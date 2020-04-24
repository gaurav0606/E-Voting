import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import p1.*;

public class EditElection extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        String ecode=req.getParameter("txtecode").trim();
        String title=req.getParameter("txtename").trim();
        String desc=req.getParameter("txtdesc").trim();
        String vdate=req.getParameter("txtvotingdate").trim();
        
        Connection con=DB_Connection.get_DBConnection();
       
        PreparedStatement pst=con.prepareStatement("update election set title=?,description=?,voting_date=? where ecode=?");
       
        pst.setString(1,title);
        pst.setString(2,desc);
        pst.setString(3,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(vdate)));
        pst.setString(4,ecode);
        
        pst.executeUpdate();
        pst.close();
        
        req.setAttribute("msg", "$('#modal-msg').modal('show');");
        RequestDispatcher rd=req.getRequestDispatcher("editelection.jsp");
        rd.forward(req, res);
        
        }
        
        catch(Exception e)
        {
            pw.println(e);
        }
   }
}