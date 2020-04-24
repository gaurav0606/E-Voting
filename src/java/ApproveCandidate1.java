import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class ApproveCandidate1 extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
                String cno=req.getParameter("cno").trim();
                String e=req.getParameter("e").trim();
      
                Connection con=DB_Connection.get_DBConnection();
                   
                PreparedStatement pst=con.prepareStatement("update candidate set status=? where cno=?");
                pst.setString(1,"Approved");
                pst.setString(2,cno);
                         
           
                pst.executeUpdate();
                pst.close();
          
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
                msg.addRecipient(Message.RecipientType.TO,new InternetAddress(e));//here type recipient email id
                msg.setSubject("Verification Successful");
                String m="Congratulations,Your registration as candidate has been successfully verified.<br/>Candidate No.: "+cno;

                msg.setContent(m, "text/html; charset=utf-8");

                Transport.send(msg);
            
                RequestDispatcher rd=req.getRequestDispatcher("ApproveCandidate");
                rd.forward(req, res);
                      
        }
        
        
        catch(Exception e)
        {
            pw.println(e);
        }
   }
}