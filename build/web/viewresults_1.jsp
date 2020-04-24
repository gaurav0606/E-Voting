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
            
           var n= '<%= request.getParameter("election")%>';
           $('#modal-progress').modal('show');
          
               
               $("#result").load("DisplayResult?election="+encodeURIComponent(n));
               
                
                
              var clear = setInterval(function()
                { 
                   var m = $('#n1').text();
                   if(m!='')
                   {
                      $('#winner').html('The Winner is: '+m);
                    
                       clearInterval(clear);
                       $('#modal-progress').modal('hide');
                   }
                    
                }, 500);
             
					
          
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
                    <div style='font-size:20px;font-weight:bold' class='text-info'>Result for <%= request.getParameter("election") %> Elections</div><hr/>
                     <div class="input-group">
    
          <input type="text" class="form-control" placeholder="Search" id="txtsearch">
          <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                     </div>
                    
                    <table  class='table table-striped'><thead><tr><th>Name</th><th>Count</th></tr></thead>
                        <tbody id='result'>
                            
                        </tbody>
                    </table>
                     <hr/>
                    <div id="winner" style='font-size:20px;font-weight:bold' class='text-info'></div>
                  
        </div>
            </div>
        </div>
        
        
        <div id="modal-progress" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <div class="modal-content">
      <div class="modal-header  bg-primary">
        
        <h4 class="modal-title" >Please Wait....</h4>
      </div>
      <div class="modal-body">
        <div class="progress progress-striped active">
  <div class="progress-bar"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
  </div>
      </div>
      
    </div>
    
     
    </div>

  </div>
</div>
       
    </body>
</html>
