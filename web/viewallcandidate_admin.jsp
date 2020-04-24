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
          
              
               $("#elections_table").load("ViewAllCandidate_Admin");
               
					
          
         });
         
         $(document).ready(function(){
  $("#txtsearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


        
        $(document).ready(function(){
            $('body').on('click','.check-box',function(){
               
          //  $('#modal-msg').modal('show');
            currentRow=$(this).closest("tr");
            var cno=currentRow.find("td:eq(0)").text();  
            
            $("#elections_table").load("ApproveCandidate1?cno="+cno);
                 
            });
        });
        



        
        </script>
    </head>
    <body>
     

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                     <div class="input-group">
    
          <input type="text" class="form-control" placeholder="Search" id="txtsearch">
          <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                     </div>
                    
                    <table  class='table table-striped'><thead><tr><th>Candidate No.</th><th>Name</th><th>EmailID</th><th>Mobile</th><th>Father's Name</th><th>Age</th><th>Election</th><th>Introduction</th><th>Promises</th><th>Election Symbol</th><th>Picture</th><th>Status</th></tr></thead>
                        <tbody id='elections_table'>
                            
                        </tbody>
                    </table>
                  
                  
        </div>
            </div>
        </div>
        
        
       
       
    </body>
</html>
