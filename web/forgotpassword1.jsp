<%-- 
    Document   : forgotpassword1
    Created on : Jan 12, 2017, 4:21:29 PM
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
    $('#frmforgotpassword2').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtotp1: {
                validators: {
                    notEmpty: {
                        message: 'Please enter OTP sent to your emailid to continue'
                        
                    }
                    
                    
                   
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
           <div class="well" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;width:413px;height: 180px" >  
        <div class="btn-group btn-breadcrumb">
            <a href="#" class="btn btn-default" style="font-weight:  bolder; ">Basic Details</a>
            <a href="#" class="btn btn-default completed" style="font-weight:  bolder;background-color: #ccc">Enter OTP value</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder">New Password</a>
        </div>
          
                  <div class="text-primary">${m}</div>
                  <form role="form"  id="frmforgotpassword2" action="ForgotPassword1" method="post" style="padding-top: 10px" >
                    <div class="form-group">
                         <label for="txtotp1">Enter OTP:</label>
                        <input type="text" class="form-control" id="txtotp1" name="txtotp1" placeholder="Enter OTP value" maxlength="4" ${autofocus} >
                        <input type="hidden" name="otp" value="${otp}">
                        <input type="hidden" name="userid" value="${userid}">
                         
                    </div>
                    <div class="form-group"> 
                      <a class="btn btn-success" href="forgotpassword.jsp" style="float:left"> << Previous</a>
                      <button type="submit" class="btn btn-success" style="float: right">Next >></button>
                    </div>
              </form>                            
            </div>
      
             
    </div>
    
    </body>
</html>
