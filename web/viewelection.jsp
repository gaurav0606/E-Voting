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
          
              
               $("#elections_table").load("ViewElections");
               
					
          
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
            $('body').on('click','#btn_delete',function(){
               
            $('#modal-msg').modal('show');
            currentRow=$(this).closest("tr");
            ecode=currentRow.find("td:eq(0)").text();  
           
                
            });
        });
        
$(document).ready(function(){
    $( "#btn_del" ).click(function() {
        $("#elections_table").load("DeleteElection?ecode="+ecode);
    });
});


       
        </script>
    </head>
    <body>
     

        <div class="container">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                     <div class="input-group">
    
          <input type="text" class="form-control" placeholder="Search" id="txtsearch">
          <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                     </div>
                    
                    <table  class='table table-striped'><thead><tr><th>Election Code</th><th>Title</th><th>Description</th><th>Voting Date</th><th>Edit Details</th><th>Delete Election</th></tr></thead>
                        <tbody id='elections_table'>
                            
                        </tbody>
                    </table>
                  
                  
        </div>
            </div>
        </div>
        
        
        <div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header  bg-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-danger" >Delete Product</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete the selected product?</p>
      </div>
      <div class="modal-footer" style="text-align: center">
        <button type="button" id="btn_del" class="btn btn-danger " data-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" >No</button>
      
      </div>
    </div>

  </div>
</div>
       
    </body>
</html>
