
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

 public class GenerateResult extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
       PrintWriter pw=res.getWriter();
        HttpSession hs=req.getSession(false);
        try
        {
        String election=req.getParameter("election").trim();
        String p="";
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from result where title=?");
        pst1.setString(1,election);
        ResultSet rs=pst1.executeQuery();
        if(rs.next())
        {
            pw.println("Result Already declared for this election");
        }
        else
        {
        
        
        pst1=con.prepareStatement("Select cno,count(*) from votes where title=? group by cno order by 2 desc");
        pst1.setString(1,election);
        rs=pst1.executeQuery();
        ResultSet rs1;
        String winner="";
        if(rs.next())
        {
            do
            {
                PreparedStatement pst2=con.prepareStatement("Select * from candidate where cno=?");
                pst2.setString(1,rs.getString(1));
                rs1=pst2.executeQuery();
                rs1.next();
                p=p+"<tr class='info'>";
                p=p+"<td id='n1'>"+rs1.getString("name");
                p=p+"<td>"+rs.getString(2);
                p=p+"</tr>";
                
            }
            while(rs.next());
            
            PreparedStatement pst2=con.prepareStatement("insert into result values(?,?)");
            pst2.setString(1,election);
            pst2.setString(2,rs1.getString("name"));
            pst2.execute();
            winner=rs1.getString("name");
            
            Properties p1=new Properties();
            p1.put("mail.smtp.starttls.enable","true");//here smtp donot get start security gets started
            p1.put("mail.smtp.auth","true");
            p1.put("mail.smtp.host","smtp.gmail.com");
            p1.put("mail.smtp.port","587");

            Session s= Session.getInstance(p1,new Authenticator()
            {
                    protected PasswordAuthentication getPasswordAuthentication() 
                    {
                                   return new PasswordAuthentication(DB_Connection.SENDERS_EMAILID,DB_Connection.SENDERS_PASSWORD);
                    }
            });


            MimeMessage msg=new MimeMessage(s);//multipurpose internet mail extension mime
            msg.setFrom(new InternetAddress(DB_Connection.SENDERS_EMAILID));
            
            PreparedStatement pst3=con.prepareStatement("Select * from votes where title=?");
            pst3.setString(1,election);
            ResultSet rs3=pst3.executeQuery();
            msg.setSubject("Voting Result");
            String m="Hello,<br> The winner of "+election+" is "+winner+"<br/>Following is the detailed result:<br/> "+p;
            //msg.setText(m,"UTF-8","html");
            msg.setContent(m, "text/html; charset=utf-8");
            while(rs3.next())
            {
                msg.addRecipient(Message.RecipientType.TO,new InternetAddress(rs3.getString("userid")));//here type recipient email id
            
                Transport.send(msg);
            }
        }
        else
        {
           p="<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Voting record</style>";
        }
        pw.println(p);
        }
        }
        catch(Exception e)
        {
           
        }
    }
        
 }