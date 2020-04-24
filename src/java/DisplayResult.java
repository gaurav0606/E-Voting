
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class DisplayResult extends HttpServlet
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
        PreparedStatement pst1=con.prepareStatement("Select cno,count(*) from votes where title=? group by cno order by 2 desc");
        pst1.setString(1,election);
        ResultSet rs=pst1.executeQuery();
        ResultSet rs1;
       
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
            
            
            
            
        }
       
        pw.println(p);
        }
        catch(Exception e)
        {
           
        }
    }
        
 }