
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class ViewMyVotes extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        HttpSession hs=req.getSession(false);
        try
        {
       
        String p="";
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from votes where userid=?");
        pst1.setString(1,hs.getAttribute("A1").toString());
        ResultSet rs=pst1.executeQuery();
      
       
        if(rs.next())
        {
            do
            {
                PreparedStatement pst2=con.prepareStatement("Select * from candidate where cno=?");
                pst2.setString(1,rs.getString("cno"));
                ResultSet rs1=pst2.executeQuery();
                rs1.next();
                p=p+"<tr class='success'>";
                p=p+"<td>"+rs.getString("title");
                p=p+"<td>"+rs1.getString("name");
                p=p+"</tr>";
                
            }
            while(rs.next());
            
            
            
            
        }
        else
        {
           p="<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Voting record</style>";
        }
       
        pw.println(p);
        }
        catch(Exception e)
        {
           
        }
    }
        
 }