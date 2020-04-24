import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;

public class ViewCandidates extends HttpServlet
{
   
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        String v="";
        HttpSession hs=req.getSession(false);
        
       
        String election=req.getParameter("election").trim();
        Connection con=DB_Connection.get_DBConnection();
       
       
        
        try
        {
            PreparedStatement pst1=con.prepareStatement("Select * from election where title=? and datediff(voting_date,curdate())=?");
            pst1.setString(1, election);
            pst1.setInt(2,0);
            ResultSet rs2=pst1.executeQuery();
            if(rs2.next() && hs.getAttribute("A1")!=null){
                v="visible";
            }
            else
            {
                v="hidden";
            }
       
            String t="";
            PreparedStatement pst2=con.prepareStatement("select * from candidate where status='approved' and election=?");
            pst2.setString(1, election);
            ResultSet rs1=pst2.executeQuery();
            t=t+"<div style='font-size:20px;font-weight:bold' class='text-info'>Showing registered candidates for "+election+" election </div><hr/>";
            if(rs1.next())
            {
                do
                {

                    t=t+"<div class='row' style=';height:100%'> <div class='panel panel-danger'>  <div class='panel-body'><div class='col-md-3' style='margin-right:-70px'>";
                    t=t+"<img src='GetPicture?userid="+rs1.getString("emailid")+"'style='width:100px;height:100px' alt='Offer 1' class='img-responsive'></img></div>";


                    t=t+"<div class='col-md-6'><div style='font-size: 20px;font-family:monospace;font-weight:bolder'>"+rs1.getString("name")+"</div>"; 

                    t=t+"<div style='font-family:monospace;font-size: 12px;color:green;'>Father's name:"+rs1.getString("fathername")+"</div>";
                    t=t+"<div style='font-family:monospace;font-size: 12px;color:green;'>EmailId: "+rs1.getString("emailid")+"</div>";
                    t=t+"<div style='font-family:monospace;font-size: 12px;color:green;'>Mobile: "+rs1.getString("mobile")+"</div>";
                    t=t+"<div style='font-family:monospace;font-size: 12px;color:green;'>Age: "+rs1.getString("age")+"</div>";
                    t=t+"<div style='font-size: 18px;font-weight:bolder;padding-top:3px;'>Introduction:</div> <div style='font-size: 15px'>"+rs1.getString("Intro")+"</div><div style='font-size: 18px;font-weight:bolder;padding-top:3px;'>Promises:</div><div style='padding-top:3px;padding-bottom:10px'>Type:"+rs1.getString("promise")+"</div></div>";;

                   
                    t=t+"<div class='col-md-offset-1 col-md-3' ><form id='frmcastvote' action='CastVote' method='post' style='visibility:"+v+"'> <input type='hidden' name='election' value='"+election+"' > <input type='hidden' name='cno' value='"+rs1.getString("cno")+"' ><button type='submit' class='btn btn-success' id='btn_vote' >Cast your Vote</button></form><br/><div class='thumbnail'><img src='GetSymbol?userid="+rs1.getString("emailid")+"'style='width:140px;height:100px;' alt='Offer 1' class='img-responsive'></img><div class='caption' style='font-weight:bold'>Election Symbol</div></div></div>";
                    t=t+"</div></div></div>";
                }
                while(rs1.next());
                
            }
            else
            {
                t=t+"<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Registered candidates for this election</style>";
            }
              pw.println(t);


       
        
        }
        catch(Exception e1)
        {
            pw.println(e1);
        }

              
        
    }
}