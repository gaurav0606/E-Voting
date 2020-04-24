<%-- 
    Document   : head
    Created on : Jan 9, 2017, 4:35:41 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>E-Voting</title>
       
       
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/formValidation.css"/> <%--used for validation--%>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css"/> 
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/breadcrumbs.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-magnify.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/magnify.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-submenu.css">
        
         <script src="bootstrap-3.3.7-dist/js/jquery-3.1.1.js"></script>
         <script src="bootstrap-3.3.7-dist/js/jquery-1.12.0.js"></script>
         <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
          <script src="bootstrap-3.3.7-dist/js/bootstrap-submenu.js"></script>
         <script src="bootstrap-3.3.7-dist/js/moment.js"></script>
         <script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js"></script>
         <script src="bootstrap-3.3.7-dist/js/formValidation.js"></script> <%--used for validation--%>
         <script src="bootstrap-3.3.7-dist/js/bootstrap_1.js"></script>  <%--used for validation--%>
         <script src="bootstrap-3.3.7-dist/js/bootstrap-magnify.js"></script>
         


      
         <script>
             $(document).ready(function(){
  
        $.get("GetUpcomingElections",function(data, status){
      
        var res = data.split("-");
         
       
      
        for (var i in res) 
        {
                if(res[i]!='')
                {
                 
                    $("#candidateslist").append("<li><a href='viewcandidates.jsp?election="+res[i]+"'>"+res[i]+"</a></li>");
                   $("#candidateslist1").append("<li><a href='viewresults.jsp?election="+res[i]+"'>"+res[i]+"</a></li>");
                   //$("#electionresult").append("<li><a href='viewresults.jsp?election="+res[i]+"'>"+res[i]+"</a></li>");
                }
            
           
        }
        
    });
    
    $.get("GetResultList",function(data, status){
      
        var res = data.split("-");
         
       
      
        for (var i in res) 
        {
                if(res[i]!='')
                {
                 
                   
                   $("#electionresults").append("<li><a href='viewresults_1.jsp?election="+res[i]+"'>"+res[i]+"</a></li>");
                }
            
           
        }
        
    });
    
    $.get("GetVoteCast",function(data, status){
      
        var res = data.split("-");
         
       
      
        for (var i in res) 
        {
                if(res[i]!='')
                {
                 
                   
                   $("#candidateslist2").append("<li><a href='viewcandidates.jsp?election="+res[i]+"'>"+res[i]+"</a></li>");
                }
            
           
        }
        
    });
        
   
});

$(document).ready(function(){
    $('[data-toggle="popover"]').popover({
        
        container:'body',
         title: '<h4>Login</h4>',
         html: true, 
       
    content: function() {
          return $('#popover-content').html();
    }
    });  
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
			event.preventDefault(); 
			event.stopPropagation(); 
			$(this).parent().siblings().removeClass('open');
			$(this).parent().toggleClass('open');
		});

});

$(document).ready(function() {
                 $(document).on("submit", "#frmlogin", function(e) {
  
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if($('.popover-content').find('#txtuserid').val()=="")
        {
             $('.popover-content').find('#m1').text("Value is required")
             $('.popover-content').find('#d1').removeClass("form-group").addClass("form-group has-error has-feedback");
             $('.popover-content').find('#s1').addClass("glyphicon glyphicon-remove form-control-feedback");
             e.preventDefault();
              
        }
        else if(filter.test($('.popover-content').find('#txtuserid').val())==false)
        {
            $('.popover-content').find('#m1').text("Invalid emailid format")
            $('.popover-content').find('#d1').removeClass("form-group").addClass("form-group has-error has-feedback");
             $('.popover-content').find('#s1').addClass("glyphicon glyphicon-remove form-control-feedback");
                e.preventDefault();
        }
        else
        {
           
            $('.popover-content').find('#d1').removeClass("form-group has-error has-feedback").addClass("form-group has-success has-feedback");
             $('.popover-content').find('#s1').removeClass("glyphicon glyphicon-remove form-control-feedback").addClass("glyphicon glyphicon-ok form-control-feedback");
            $('.popover-content').find('#m1').text("")
        }
        
        if($('.popover-content').find('#txtpassword').val()=="")
        {
            $('.popover-content').find('#m2').text("Value is required")
             $('.popover-content').find('#d2').removeClass("form-group").addClass("form-group has-error has-feedback");
             $('.popover-content').find('#s2').addClass("glyphicon glyphicon-remove form-control-feedback");
             e.preventDefault();
               
        }
        else
         {
            $('.popover-content').find('#d2').removeClass("form-group has-error has-feedback").addClass("form-group has-success has-feedback");
             $('.popover-content').find('#s2').removeClass("glyphicon glyphicon-remove form-control-feedback").addClass("glyphicon glyphicon-ok form-control-feedback");
            $('.popover-content').find('#m2').text("")
            
         }
     
    
});
             });

</script>
       
       
        
       
    </head>
    
    <body>
        
       <nav class="navbar navbar-inverse" style=";padding-top: 10px"  >
  <div class="container-fluid" >
    <div class="navbar-header"  >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" >
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
        <div style="padding-right: 150px"><a class="navbar-brand" href="home.jsp" style="color:white;font-weight:bolder;font-size: 30px;"><img src="images/l4.png" style="width:200px;height: 50px;margin-top: -20px"></img></a></div>
    </div>
      <div class="collapse navbar-collapse" id="myNavbar"   >
      <ul class="nav navbar-nav" style="margin-left: -5%">
        <li ><a  href="home.jsp">Home</a></li>
        <li><a href="aboutus.jsp" style="color: white">Company's Profile</a></li>
        <li><a href="contactus.jsp" style="color: white">Get in touch</a></li> 
        <li><a href="feedback.jsp" style="color: white">Valuable Comments</a></li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: white">Election
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="upcomingelections.jsp">Upcoming Elections</a>
            
           </li>
           <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Candidate's List</a>
             <ul class="dropdown-menu" id="candidateslist">
                   
           </li>
             </ul>
           
           <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Election Results</a>
             <ul class="dropdown-menu" id="electionresults">
                    
             </ul>
           </li>
           
        </ul>
      </li>

        <%
            if(session.getAttribute("A1")!=null)
            {
            if(session.getAttribute("A1").toString().equalsIgnoreCase("shashanknambiar18@evoting.com"))
            {
          %>
           <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:white">Admin's Section
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="newelection.jsp">New Election</a></li>
          <li><a href="editelection.jsp">Edit Election</a></li>
          <li><a href="viewelection.jsp">View/Delete Elections</a></li>
          <li><a href="approvecandidate.jsp">Approve Candidates</a></li>
           <li><a href="viewallcandidate_admin.jsp">View all Candidates</a></li>
          <li><a href="viewfeedback.jsp">View Feedback</a></li>
          <li><a href="viewusers.jsp">View Users</a></li>
          <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Declare Result</a>
             <ul class="dropdown-menu" id="candidateslist1">
                  
                    
             
             </ul>
           </li>
          <li><hr/></li>
          <li><a href="editprofile.jsp">Change Profile</a></li>
          <li><a href="changepassword.jsp">Change Password</a></li>
          <li><a href="signout.jsp">Signout</a></li>
        </ul>
      </li>
           
           <%
            }
            else
            {
           %>
           <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:white">My Section
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="registercandidate.jsp">Register as Candidate</a></li>
          <li><a href="viewfeedback.jsp">View Feedback</a></li>
           <li><a href="viewmyvotes.jsp">View my votes</a></li>
                    
           <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Cast My Vote</a>
             <ul class="dropdown-menu" id="candidateslist2">
                  
                    
             
             </ul>
           </li>
           
           
           
       
          <li><hr/></li>
          <li><a href="editprofile.jsp">Change Profile</a></li>
          <li><a href="changepassword.jsp">Change Password</a></li>
          <li><a href="signout.jsp">Signout</a></li>
        </ul>
      </li>
            
            <%
            }
                       }
            %>


        
        
        
      </ul>
          
            <%
                if(session.getAttribute("A1")==null)
            {
                    %>
                
            
      <ul class="nav navbar-nav navbar-right" >
     
      <li><a href="#" data-toggle="popover"  data-placement="bottom"  ><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       
      <li><a href="forgotpassword.jsp"><i class="fa fa-unlock"></i> Forgot password</a></li>
      
     </ul>
      <%
             }
            else
            {   
            %>
            <div style="color:white;font-weight: bolder;font-size: 20px" class="pull-right">Welcome, <%= session.getAttribute("A2") %></div>
            
            <%
                       }
                       %>
    </div>
  </div>
</nav>
        
     <div id="popover-content" class="hide">
      <form  role="form" action="Login" id="frmlogin" method="Post" >
        <div class="form-group" id="d1">
          <input type="text" placeholder="Emailid" class="form-control" id="txtuserid" name="txtuserid"  >
          <span id="s1" ></span>
        </div>
          <div id="m1" style="color: #a94442;padding-bottom: 10px"></div>
        
        <div class="form-group" id="d2" >
          <input type="password" placeholder="Password" class="form-control" id="txtpassword" name="txtpassword">
          <span id="s2"></span>
        </div>
          <div id="m2" style="color: #a94442;padding-bottom: 10px "></div>
         <div class="form-group">
          <button type="submit" class="btn btn-primary" >Login</button>                                  
        </div>
      </form>
    </div>  

        
    </body>
</html>
