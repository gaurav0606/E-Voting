package p1;




import java.sql.*;

public class DB_Connection 
{
    public static String SENDERS_EMAILID="vishalsawant639@gmail.com";
    public static String SENDERS_PASSWORD="sonugoogle";
    
    public static Connection get_DBConnection()
    {
        Connection conn=null;
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
           conn=DriverManager.getConnection("jdbc:mysql://localhost/voting_db","root","abc");
           
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return conn;
    }
    
}
