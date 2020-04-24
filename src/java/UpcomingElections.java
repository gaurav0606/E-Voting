
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import p1.*;

 public class UpcomingElections extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
       PrintWriter pw=res.getWriter();
        
        try
        {
      
        String p="";
              
        Connection con=DB_Connection.get_DBConnection();
        PreparedStatement pst1=con.prepareStatement("Select * from election where title not in (select title from result) and datediff(voting_date,curdate()) >=?");
        pst1.setInt(1,0);
        ResultSet rs=pst1.executeQuery();
        p=p+"<div style='font-size:20px;font-weight:bold' class='text-info'>Upcoming Elections</div><hr/>";
       if(rs.next())
        {
            do
            {
                p=p+"<div class='well'>";
                p=p+"<div class='' style='font-size:15px;font-weight:bold;padding-bottom:3px'>Election Code: "+rs.getString(1)+"</div>";
                p=p+"<div class='' style='font-size:15px;font-weight:bold;padding-bottom:3px'>Title: "+rs.getString(2)+"</div>";
                p=p+"<div class='' style='font-size:15px;font-weight:bold;padding-bottom:10px'>Voting Date: "+rs.getString(4)+"</div>";
                p=p+"<div class='' style='font-size:15px;font-weight:bold'>Additional Information: <br/></div>"+rs.getString(3);
                p=p+"<div style='padding-top:10px'> <a href='viewcandidates.jsp?election="+rs.getString(2)+"'>Candidate's List</a></div>";
                p=p+"</div><hr/>";
            }while(rs.next());
          
        }
       else
       {
           p=p+"<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Upcoming Elections </style>";
       }
        pw.println(p);
        }
        catch(Exception e)
        {
           
        }
    }
        
 }