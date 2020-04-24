<%-- 
    Document   : addproduct
    Created on : Feb 22, 2017, 11:57:37 AM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="head.jsp" %>
        
    <script>
        
            //used to display date time picker
            $(function () {
             
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    minDate : new Date()
                });
            });

        
        $(document).ready(function(){
   
        $.get("GetElectionId",function(data, status){
       
        $("#txtecode").val(data);
    });
        
   
});

   
        $(document).ready(function() {
    $('#frmnewelection').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtename: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            
            txtdesc: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            
	   
	    txtvotingdate: {
                validators: {
                    notEmpty:{
                         message: 'Date value is required'
                    }
                    
                }
            }

        }
          
    });
});
        $(document).ready(function() {
            ${msg}
        });
        
        
      
    </script>
    </head>
    <body>
        
       


        <div class="container-fluid">
        <div class="row">
            <div class="col-md-offset-4 col-md-4">
                ${errormsg}
       <div class="panel panel-info">
  <div class="panel-heading" ><i class="fa fa-plus-square"></i>&nbsp New Election</div>
  <div class="panel-body">
      <form id="frmnewelection" class="form-horizontal" action="NewElection" method="post" >
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtecode">Election Code:</label>
                 <div class="col-md-6">
                     
                     <input type="text" class="form-control" id="txtecode" name="txtecode" readonly="true"  >
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtename">Election Title:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtename" name="txtename">
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtdesc">Additional Information:</label>
                 <div class="col-md-6">
                   <textarea class="form-control" rows="3" id="txtdesc" name="txtdesc"></textarea>
                 </div>
          </div>
         
          <div class="form-group">  
                          <label class="control-label col-md-4" for="date">Voting Date:</label>
                        <div class="col-md-6">
                        <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" name="txtvotingdate"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                      
                        </div>
          </div>
      
                
          
          
          <div class="form-group"> 
            <div class="col-md-offset-4 col-md-6">
              <button type="submit" class="btn btn-info btn-block" ><i class="fa fa-plus"></i> Add</button>
            </div>
          </div>
          
      </form>
  </div>
</div>
            </div>
        </div>
        </div>

<div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header bg-success">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" >Success</h4>
      </div>
      <div class="modal-body">
        <p>Election created successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
    

</html>
