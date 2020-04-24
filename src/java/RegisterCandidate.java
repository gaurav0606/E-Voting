import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;
import javax.servlet.annotation.MultipartConfig;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


@MultipartConfig
public class RegisterCandidate extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        InputStream is[];
        is=new InputStream[]{null,null};
        String values[]=new String[9];
        int j=0;
        try
        {
            Collection<javax.servlet.http.Part> p= req.getParts();
            Iterator i=p.iterator();
            while(i.hasNext())
            {
               javax.servlet.http.Part p1=(javax.servlet.http.Part)i.next();
                
                 if(p1.getName().equalsIgnoreCase("txtpic"))
                 {
                    is[0]= p1.getInputStream();
                   
                 }
                 else if(p1.getName().equalsIgnoreCase("txtpic1"))
                 {
                    is[1]= p1.getInputStream();
                   
                 }
                 else
                 {
                    InputStream i1= p1.getInputStream();
                    int ch;
                    StringBuilder sb = new StringBuilder();
                    while((ch = i1.read()) != -1)
                    {
                        sb.append((char)ch);
                    }
                    values[j]=sb.toString();
                    j++;
                 }
            }
        
       
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("select * from candidate where emailid=? and election=?");
        pst1.setString(1, values[2]);
        pst1.setString(2, values[6]);
        ResultSet rs=pst1.executeQuery();
        if(rs.next())
        {
            RequestDispatcher rd=req.getRequestDispatcher("registercandidate.jsp");
            req.setAttribute("errormsg","<div class='alert alert-danger' style='text-align: center;'>You have already registered for this election</div>");       
            rd.forward(req, res); 
        }
        else
        {
            pst1.close();
            pst1=con.prepareStatement("insert into candidate values(?,?,?,?,?,?,?,?,?,?,?,?)");
            pst1.setString(1, values[0]);
            pst1.setString(2, values[1]);
            pst1.setString(3, values[2]);
            pst1.setString(4, values[3]);
            pst1.setString(5, values[4]);
            pst1.setInt(6, Integer.parseInt(values[5]));
            pst1.setString(7, values[6]);
            pst1.setString(8, values[7]);
            pst1.setString(9, values[8]);
            pst1.setBlob(10, is[0]);
            pst1.setBlob(11, is[1]);
            pst1.setString(12, "Disapproved");

            pst1.executeUpdate();
            
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
            msg.addRecipient(Message.RecipientType.TO,new InternetAddress(values[2]));//here type recipient email id
            msg.setSubject("Candidate Registration Confirmation");
            String m="You have successfully registered as candidate for election "+values[6]+"<br/>It is waiting for verification by admin.<br/>You will be notified via email about the same.Candidate No.: "+values[0];
           
            msg.setContent(m, "text/html; charset=utf-8");
            
            Transport.send(msg);
            req.setAttribute("msg", "$('#modal-msg').modal('show');");
            RequestDispatcher rd=req.getRequestDispatcher("registercandidate.jsp");
            rd.forward(req, res);
        }
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}