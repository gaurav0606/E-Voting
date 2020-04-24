
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class GetResultList extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
            PrintWriter pw=res.getWriter();
        
        try
        {
      
       String p="";
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from result");
        
        ResultSet rs=pst1.executeQuery();
        
       while(rs.next())
        {
            p=p+"-"+rs.getString(1);
          
        }
        pw.println(p);
        }
        catch(Exception e)
        {
           
        }
    }
        
 }