<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />  
<title>Auguz-PMS|Login</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" />
<link href="<c:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.min.css" />" rel="stylesheet">
<script src="/resources//javascript/jquery-2.1.4.min.js" />"  type="text/javascript"></script>
    <script type="text/javascript">
    function func(a) {
        if(a==1) {
            document.getElementById("order").style.display="none";
			document.getElementById("retrive").style.display="block"; 
			document.getElementById('btna').style.visibility = 'hidden';
			document.getElementById('btnb').style.visibility = 'visible';
		}
        if(a==2) {
            document.getElementById("order").style.display="block";
			document.getElementById("retrive").style.display="none";
			document.getElementById('btnb').style.visibility = 'hidden';
			document.getElementById('btna').style.visibility = 'visible';
        }
    }
    </script>
    <script type="text/javascript">
        function showValue(newValue)
        {
            document.getElementById("range").innerHTML=newValue;
        }
    </script>
    
<script type="text/javascript">
    $(document).ready(function() {
   $('#btnb').hide();
});
</script>

    <style type="text/css">
<!--
.style1 {color: #FF9933}
-->
    </style>
</head>

<body style="background:#0077bb">


<div class="loginbox radius" >
	<div class="loginboxinner radius">
    	<div class="loginheader">
    	</div><!--loginheader-->
        
        <div class="loginform">
                	
        	 <div  class="panel panel-default" style="background:#0077bb; border:0;" >
              <div class="panel-heading" style="background:#0077bb;border:0;">
                <div class="panel-body" style="background:#0077bb;border:0;">
        <!-- Login form -->
<form name='order' id='order'
			action="<c:url value='/j_spring_security_check' />" method='post'>
<img src="<c:url value="/resources/images/aug.png" />" class="img-responsive" id="img2" alt="Logo" height="58px" width="153px">
<p></p>
<p></p>
<p></p>
  <div class="form-group" id="sach">
  <font color="#900C3F">
  <c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		</font>
		<font color=" #FFC300">
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		</font>
		
    <label for="exampleInputEmail1">Email / Mobile Number</label>
                          <div class="input-group">
                           <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                           <input type="email" class="form-control" name="username" id="username" placeholder="Email / Mobile Number"> 
                          </div>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
                          <div class="input-group">
                           <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-star"></span></span>
                           <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                          </div>

  </div>
  
  <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> 
				<span align="right">
  <button type="submit" class="btn btn-success"> Login</button></span>  
  <p class="text-right" style="color:#f9f9f9"><button type=button class="btn btn-link style1" id="btna" onClick="func(1)">Need Help?</button>&nbsp;|&nbsp;
  <button type=button class="btn btn-link style1" id="btna" onClick="func(1)">New User - Click to Register</button>
      </p>
  </div>
      
      <div class="panel-footer" style="background:#0077bb;border:0;"></div>
</form>  
      
      <form id="retrive" style="display:none;">
      
      <img src="<c:url value="/resources/images/aug.png" />" class="img-responsive" id="img1" alt="Logo" height="58px" width="153px">
      <p></p>
<p></p>
 <p class="text-left style1" style="color:#FFFFFF"><strong>Forgot Password ?</strong></p>
<p></p>
      <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
                          <div class="input-group">
                           <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                           <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email / Mobile Number"> 
                          </div>
  </div>
  <div class="form-group">
   
  </div>
  
  
  <button type="submit" class="btn btn-success">Submit</button>
   </div><p class="text-right" style="color:#f9f9f9;visibility: hidden;"><button type=button class="btn btn-link style1" id="btnb" onClick="func(2)">Click to Login</button>
      </p>
 <div class="panel-footer" style="background:#0077bb;border:0;">
      
      <br />
      <div>
      
      </form>
</div>
  </div>
</div>
        </div><!--loginform-->
    </div><!--loginboxinner-->
</div><!--loginbox-->

</body>

</html>
