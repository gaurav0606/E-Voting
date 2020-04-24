
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import p1.*;

 public class GetElection extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
            PrintWriter pw=res.getWriter();
        
        try
        {
      
       String p=req.getParameter("ecode");
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from election where ecode=?");
        pst1.setString(1,p );
        ResultSet rs=pst1.executeQuery();
        
        if(rs.next())
        {
            String e=new SimpleDateFormat("dd/MM/yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(4)));
            pw.println(rs.getString(2)+"_"+rs.getString(3)+"_"+e);
            
        }
        
       
          

        
       
        
     
        }
        catch(Exception e)
        {
           
        }
    }
        
}