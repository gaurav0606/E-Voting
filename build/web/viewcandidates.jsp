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
            ${msg}
        });
            $(document).ready(function() {
          
        var n= '<%= request.getParameter("election")%>';
       
               $("#elections_table").load("ViewCandidates?election="+encodeURIComponent(n));
               
					
          
         });
         
        
$(document).ready(function(){
            $('body').on('click','#btn_vote',function(e){
             
             e.preventDefault();
            $('#modal-msg').modal('show');
           // currentRow=$(this).closest("tr");
           // pid=currentRow.find("td:eq(0)").text();  
           
                
            });
        });
        
$(document).ready(function(){
    $("#btn_d").click(function() {
        
        $("#frmcastvote").submit();
    });
});


       
        </script>
    </head>
    <body>
     

        <div class="container">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                     
                    
                    
                        <div id='elections_table'>
                            
                        </div>
                    
                  
                  
        </div>
            </div>
        </div>
        
        
        <div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header  bg-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-danger" >Cast Vote confirmation</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to vote for the selected candidate?</p>
      </div>
      <div class="modal-footer" style="text-align: center">
        <button type="button" id="btn_d" class="btn btn-danger " data-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" >No</button>
      
      </div>
    </div>

  </div>
</div>
        
        <div id="modal-msg1" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header  bg-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-danger" >Error</h4>
      </div>
      <div class="modal-body">
        <p>You have already voted for this election</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
        
        <div id="modal-msg2" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header  bg-success">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-danger" >Success</h4>
      </div>
      <div class="modal-body">
        <p>Thank you for casting your valuable vote.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
       
    </body>
</html>
