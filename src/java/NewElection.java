import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import p1.*;

public class NewElection extends HttpServlet
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
       
        PreparedStatement pst1=con.prepareStatement("select * from election where title=?");
        pst1.setString(1,title);
        ResultSet rs=pst1.executeQuery();
        if(rs.next())
        {
            req.setAttribute("errormsg", "<div class='alert alert-danger' style='height:70px'><a href='#' class='close' data-dismiss='alert' >&times;</a>Election name already exist. Please use a different name.</div>");
            RequestDispatcher rd=req.getRequestDispatcher("newelection.jsp");
            rd.forward(req, res);
        }
        else
        {
            PreparedStatement pst=con.prepareStatement("insert into election values(?,?,?,?)");
            pst.setString(1,ecode);
            pst.setString(2,title);
            pst.setString(3,desc);
            pst.setString(4,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(vdate)));

            pst.executeUpdate();
            pst.close();
            req.setAttribute("msg", "$('#modal-msg').modal('show');");
            RequestDispatcher rd=req.getRequestDispatcher("newelection.jsp");
            rd.forward(req, res);
        }
        }
        
        catch(Exception e)
        {
            pw.println(e);
        }
   }
}