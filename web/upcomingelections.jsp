<%-- 
    Document   : displaytrucks
    Created on : Mar 11, 2017, 6:15:17 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="head.jsp" %>
        
       
        <script>
            $(document).ready(function() {
          
            
               $("#dd").load("UpcomingElections");
               
			  	
          
         });
         
        



        
        </script>
    </head>
    <body>
     

        <div class="container" >
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div id='dd'>
                            
                    </div>
                  
                  
        </div>
            </div>
        </div>
        
        
        
       
    </body>
</html>
