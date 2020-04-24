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
    
        $.get("GetElectionName",function(data, status){
      
        var res = data.split("-");
      
      
        for (var i in res) 
        {
                if(res[i]!='')
                {
                    var option = new Option(res[i].trim(), res[i].trim())
                    $("#election").append(option);
                }
            
           
        }
        
    });
        
   
});

$(document).ready(function(){
    
        var u='<%= session.getAttribute("A1") %>'
        $.get("GetCandidateDetails?userid="+u,function(data, status){
      
        var res = data.split("-");
        $('#txtcname').val(res[0]);
        $('#txtemailid').val(res[1]);
        $('#txtmobile').val(res[2]);
        
        
    });
        
   
});

        
        $(document).ready(function(){
   
        $.get("GetCandidateId",function(data, status){
       
        $("#txtcno").val(data);
    });
        
   
});

  function call()
        {
            if(parseInt($("#txtpic").get(0).files.length)==0)
            {
                
                return false;
            }
            else
                {
                    return true;
                }
        }
        
        function call1()
        {
            if(parseInt($("#txtpic1").get(0).files.length)==0)
            {
                
                return false;
            }
            else
                {
                    return true;
                }
        }

        $(document).ready(function() {
    $('#frmregistercandidate').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtfname: {
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
             txtpromise: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            
	   
	     txtage: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 18,
                        message: 'The value must be greater than or equal to 18'
                    }
                 }
            },
            
            txtpic: {
                validators: {
                    callback: {
                  
                        callback: function(value, validator, $field) {
                                                
                            
                                return {
                                    valid: call(),
                                    message:'Please select an image'
                                }
                            
                           
                   
                    
                    
                }
            }
                 }

            
           
            
        },
         txtpic1: {
                validators: {
                    callback: {
                  
                        callback: function(value, validator, $field) {
                                                
                            
                                return {
                                    valid: call1(),
                                    message:'Please select an image'
                                }
                            
                           
                   
                    
                    
                }
            }
                 }

            
           
            
        }
        }
          
    });
});

        $(document).ready(function() {
            ${msg}
        });
        
     
        $(document).ready(function(){
            $("#txtpic").change(function(event){
                  
               
                    var tmppath1 = URL.createObjectURL($(this).get(0).files[0]);
                   
                    
                    $("#img1").fadeIn("fast").attr('src',tmppath1 )
                  
            });
            
            $("#txtpic1").change(function(event){
                  
               
                    var tmppath1 = URL.createObjectURL($(this).get(0).files[0]);
                   
                    
                    $("#img2").fadeIn("fast").attr('src',tmppath1 )
                  
            });
        });
   
      
    </script>
    </head>
    <body>
        
       


        <div class="container-fluid">
        <div class="row">
            <div class="col-md-offset-4 col-md-4">
                ${errormsg}
       <div class="panel panel-info">
           <div class="panel-heading" ><i class="fa fa-plus-square"></i>&nbsp Register as Candidate</div>
  <div class="panel-body">
    
          
  
    <form id="frmregistercandidate"  action="RegisterCandidate" method="post" enctype="multipart/form-data">
          
          <div class="form-group">
                <label class="control-label" for="txtecode">Candidate No.:</label>
                <input type="text" class="form-control" id="txtcno" name="txtcno" readonly="true"  >
        
          </div>
          <div class="form-group">
                <label class="control-label" for="txtcname">Candidate Name:</label>
                
                        <input type="text" class="form-control" id="txtcname" name="txtcname" readonly="true">
        
          </div>
          
          <div class="form-group">
                <label class="control-label" for="txtemailid">EmailID:</label>
                
                     
                        <input type="text" class="form-control" id="txtemailid" name="txtemailid" readonly="true">
                    
                    
          </div>
          
          <div class="form-group">
                <label class="control-label" for="txtmobile">Mobile:</label>
               
                     
                        <input type="text" class="form-control" id="txtmobile" name="txtmobile" readonly="true">
                    
                   
          </div>
          

          <div class="form-group">
                <label class="control-label" for="txtfname">Fathers Name:</label>
                 
                     
                        <input type="text" class="form-control" id="txtfname" name="txtfname" >
                    
                 
                
          </div>
          <div class="form-group">
                <label class="control-label" for="txtage">Age:</label>
                
                     
                        <input type="text" class="form-control" id="txtage" name="txtage" >
                    
                    
          </div>
         <div class="form-group">
                <label class="control-label" for="election">Register for:</label>
                 
                     <select class="form-control" id="election" name="election">
                         
                        
                     </select>
                 
          </div>
          <div class="form-group">
                <label class="control-label" for="txtdesc">Introduce yourself to voters (max 1000 chars):</label>
                
                     <textarea class="form-control" rows="3" id="txtdesc" name="txtdesc" maxlength="1000" ></textarea>
                
          </div>
          
          <div class="form-group">
                <label class="control-label" for="txtpromise">Description to promises to voters (max 1000 chars):</label>
               
                   <textarea class="form-control" rows="3" id="txtpromise" name="txtpromise" maxlength="1000"></textarea>
                 
          </div>
          
         <div class="form-group">
                <label class="control-label" for="txtpic">Election symbol:</label>
               
                       <label class="btn btn-default" style="width:100%;height:35px">
                           Browse <input type="file" style="opacity:0;"  id="txtpic" name="txtpic"></input>
                        </label>
                     <img id="img1" class="zoom" style="width:75px;height: 75px;display: none">
                    
                       
                
          </div>

          <div class="form-group">
                <label class="control-label" for="txtpic1">Your picture:</label>
                 
                       <label class="btn btn-default" style="width:100%;height:35px">
                           Browse <input type="file" style="opacity:0;"  id="txtpic1" name="txtpic1"></input>
                        </label>
                     <img id="img2" class="zoom" style="width:75px;height: 75px;display: none">
       
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
        <p>Candidate details added successfully <br/> You will be notified via email when it is approved .</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
    

</html>
