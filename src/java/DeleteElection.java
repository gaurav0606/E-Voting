import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;


public class DeleteElection extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        String ecode=req.getParameter("ecode");
        try
        {
       
            Connection con=DB_Connection.get_DBConnection();


            PreparedStatement pst=con.prepareStatement("delete from election where ecode=?");
            pst.setString(1, ecode);
            pst.executeUpdate();
            pst.close();
      
            RequestDispatcher rd=req.getRequestDispatcher("ViewElections");
            rd.forward(req,res);
         
           
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}