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
        $(document).ready(function(){
        
            var ecode='<%=request.getParameter("ecode")%>'
        
            $.get("GetElection?ecode="+ecode,function(data, status){
             
               if(data!="")
               {
                    var res = data.split("_");
                     $("#txtecode").val(ecode);
                    $("#txtename").val(res[0]);
                    $("#txtdesc").val(res[1]);
                    $("#txtvotingdate").val(res[2]);
                   
                   $("#txtecode").attr("readonly", "true");

               }
               
            
        
    });
       
    });

        
      $(function () {
             
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    minDate : new Date()
                });
            });

        
   
      
        $(document).ready(function(){
    $("#btn_reset").click(function(){
          $("#txtename").val("");
          $("#txtecode").val("");
           $("#txtdesc").val("");
           $("#txtvotingdate").val("");
         
          
           $("#txtecode").removeAttr("readonly");
          
    });
});
        
        $(document).ready(function(){
    $("#txtecode").keyup(function(){
       
        var l=$("#txtecode").val().length;
        var ecode=$("#txtecode").val()
        if( l == 10)
        {
            $.get("GetElection?ecode="+ecode,function(data, status){
             
               if(data!="")
               {
                    var res = data.split("_");
                    $("#txtename").val(res[0]);
                    $("#txtdesc").val(res[1]);
                    $("#txtvotingdate").val(res[2]);
                    $("#msg").text("");
                    $("#txtecode").attr("readonly", "true");

               }
               else
               {
                       $("#msg").text("Invalid product id.");
                        $("#txtename").val("");
                  $("#txtdesc").val("");
                   $("#txtvotingdate").val("");
               }
            
        
    });
        }
        else
            {
                 $("#txtename").val("");
                  $("#txtdesc").val("");
                   $("#txtvotingdate").val("");
                      
                   
            }
    });
});


       

         $(document).ready(function() {
    $('#frmeditelection').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
             txtecode: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            
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
       <div class="panel panel-info">
  <div class="panel-heading" ><i class="fa fa-plus-square"></i>&nbsp Edit Election</div>
  <div class="panel-body">
      <form id="frmeditelection" class="form-horizontal" action="EditElection" method="post" >
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtecode">Election Code:</label>
                 <div class="col-md-6">
                     
                     <input type="text" class="form-control" id="txtecode" name="txtecode"   >
                    <p id="msg" style="color:#a94442"></p>

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
                    <input type='text' class="form-control" name="txtvotingdate" id="txtvotingdate"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                      
                        </div>
          </div>
      
                
          
          
          <div class="form-group"> 
            <div class="col-md-offset-4 col-md-6">
              <button type="submit" class="btn btn-info btn-block" ><i class="fa fa-save"></i> Save Changes</button>
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
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" >Success</h4>
      </div>
      <div class="modal-body">
        <p>Election details saved successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
    <div id="div1">
        
    </div>
</html>
