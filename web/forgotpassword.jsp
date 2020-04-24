<%-- 
    Document   : forgotpassword
    Created on : Jan 12, 2017, 1:01:57 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Voting</title>
         <%@include file="head.jsp" %>
         
         <script>
             
             $(document).ready(function() {
    $('#frmforgotpassword').formValidation({
       
        framework: 'bootstrap',
       
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtuserid: {
                validators: {
                    notEmpty:{
                         message: 'The userid is required'
                    },
                    emailAddress: {message: 'Invalid emailid format'}
                }
            }
            
        }
    });
}); 
         </script>
         
        
    </head>
    <body>
      
      
      
        <div class="row">
         <div class="col-md-4 col-md-offset-4" >
              ${errormsg}
           <div class="well" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;width:413px;" >  
        <div class="btn-group btn-breadcrumb">
            <a href="#" class="btn btn-default completed" style="font-weight:  bolder; background-color: #ccc">Basic Details</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder;">Enter OTP value</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder">New Password</a>
        </div>
	   
           
             
           <form role="form" name="frmforgotpassword" id="frmforgotpassword" action="ForgotPassword" style="padding-top: 10px"  >
               
               <div class="form-group "  >
                       <label for="txtuserid">Enter User ID:</label>
                        <input type="text" class="form-control" id="txtuserid" name="txtuserid" placeholder="Enter UserID" ${autofocus}>
                </div>
                            
                    
                        <button type="submit" class="btn btn-success" class="pull-right">  Next >></li></button>
                    
              </form>                                                        
            </div>
    </div>
       </div>
    </body>
    
</html>
