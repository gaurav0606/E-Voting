
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class GetPicture extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
         //PrintWriter pw=res.getWriter();
         res.setContentType("image/jpeg");
       //  HttpSession hs=req.getSession(false);
         byte b[]=null;
        try
        {
      
       String p=req.getParameter("userid");
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from candidate where emailid=?");
        pst1.setString(1,p );
        ResultSet rs=pst1.executeQuery();
        rs.next();
        
       
          
            b=rs.getBytes("pic");
            ServletOutputStream o=res.getOutputStream();
            o.write(b);
            o.flush();
            o.close();

        
       
        
     
        }
        catch(Exception e)
        {
           
        }
    }
        
}