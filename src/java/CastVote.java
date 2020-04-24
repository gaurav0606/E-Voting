import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class CastVote extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
        String cno=req.getParameter("cno").trim();
        String election=req.getParameter("election").trim();
        
        
        Connection con=DB_Connection.get_DBConnection();
       
        PreparedStatement pst2=con.prepareStatement("select * from votes where userid=? and title=?");
        pst2.setString(1,hs.getAttribute("A1").toString());
        pst2.setString(2,election);      
           
        ResultSet rs1=pst2.executeQuery();
        
        if(rs1.next()==false)
        {
               
                PreparedStatement pst=con.prepareStatement("insert into votes values(?,?,?)");
                pst.setString(1,hs.getAttribute("A1").toString());
                pst.setString(2,cno);
                pst.setString(3,election);
              
                pst.executeUpdate();
                pst.close();
                
                Properties p=new Properties();
                p.put("mail.smtp.starttls.enable","true");//here smtp donot get start security gets started
                p.put("mail.smtp.auth","true");
                p.put("mail.smtp.host","smtp.gmail.com");
                p.put("mail.smtp.port","587");

                Session s= Session.getInstance(p,new Authenticator()
                {
                        protected PasswordAuthentication getPasswordAuthentication() 
                        {
                                       return new PasswordAuthentication(DB_Connection.SENDERS_EMAILID,DB_Connection.SENDERS_PASSWORD);
                        }
                });


                MimeMessage msg=new MimeMessage(s);//multipurpose internet mail extension mime
                msg.setFrom(new InternetAddress(DB_Connection.SENDERS_EMAILID));
                msg.addRecipient(Message.RecipientType.TO,new InternetAddress(hs.getAttribute("A1").toString()));//here type recipient email id
                msg.setSubject("Voting Confirmation");
                String m="Thank you for casting your valuable vote.<br/>You will be notified about the election result on your email soon.";
                //msg.setText(m,"UTF-8","html");
                msg.setContent(m, "text/html; charset=utf-8");
                Transport.send(msg);
            
                req.setAttribute("msg", "$('#modal-msg2').modal('show');");
                RequestDispatcher rd=req.getRequestDispatcher("viewcandidates.jsp");
                rd.forward(req, res);
        }
        else
        {
                req.setAttribute("msg", "$('#modal-msg1').modal('show');");
                RequestDispatcher rd=req.getRequestDispatcher("viewcandidates.jsp");
                rd.forward(req, res);
        }
          
        

        }
        
        catch(Exception e)
        {
            pw.println(e);
        }
   }
}