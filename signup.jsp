<html>
<head>
<title>COOKBOOK</title>
<link rel="stylesheet" type="text/css" href="sign.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var k=document.getElementById("username").value;
var urls="namecheck.jsp?ver="+k;
if (window.XMLHttpRequest)
{
xmlhttp=new XMLHttpRequest();
}
else
{
xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4)
{
document.getElementById("err").innerHTML=xmlhttp.responseText;
}
}
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>
</head>
<body>
<script type="text/javascript">
		function check(myform)
		{
			if(myform.username.value=="" || myform.username.value==null)
			{
				alert("Enter a name");
				return false;
			}
			if(myform.password.value=="" || myform.password.value==null)
			{
				alert("Enter a password");
				return false;
			}
			if(myform.cpassword.value=="" )
			{
				alert("Confirm your Password");
				return false;
			}
			if(myform.cpassword.value!=myform.password.value)
			{
				alert("Passwords do not match!")
			}
			
		}
</script>
<header>
<div class="navbar">
<ul>

<li><a href="viewrecipe.jsp"><i class="fa fa-newspaper-o" aria-hidden="true"></i>FEED</a></li>
<li><a href="viewrecipe.jsp"><i class="fa fa-search" aria-hidden="true"></i>SEARCH</a></li>
<li><a href="#"><i class="fa fa-glass" aria-hidden="true"></i>ADD RECIPE</a></li>
<li><a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>FAVORITES</a></li>
<li><a href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i>GROCERY LIST</a></li>


</ul>
</div>
</header>


<div class="signin">
<form  name="form1" method="POST" action="reg" onSubmit="return check(form1)"> 
<center><h2>SIGN UP</h2><br><br><br></center>


<input type="text" id="username" name="username" placeholder="username" onkeyup="loadXMLDoc()"><br>
<span id="err"></span><br>
<input type="password" name="password" placeholder="password"><br><br>
<input type="password" name="cpassword" placeholder="confirm password"><br><br>

<a href="signup.jsp"><input type="submit" value="SIGN UP"></a><br><br>
<div class="addinfo">
<a href="signin.html" style="margin-right:0px;" >SIGN IN</a><br>

<br>
</div>
</form>
</div>




</body>
</html>