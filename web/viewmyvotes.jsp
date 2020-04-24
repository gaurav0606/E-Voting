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
            
           
          
               
               $("#result").load("ViewMyVotes");
               
                
                
              
					
          
         });
         $(document).ready(function(){
  $("#txtsearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      
    });
  });
});


        

        </script>
    </head>
    <body>
     

        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6">
                    
                     <div class="input-group">
    
          <input type="text" class="form-control" placeholder="Search" id="txtsearch">
          <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                     </div>
                    
                    <table  class='table table-striped'><thead><tr><th>Election</th><th>Candidate Name</th></tr></thead>
                        <tbody id='result'>
                           
                        </tbody>
                    </table>
                    
                    
                  
        </div>
            </div>
        </div>
        
        
        
       
    </body>
</html>
