<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration form</title>
</head>
<body>
<%String uname,pw,email,gen,mar,cer; %>
<form>
<label><b><h2>Registration Form</h2></b></label><br><br>
<b>First Name</b>	<input type="text"     name="un"><br><br>
<b>Email ID</b>    <input type="text"     name="email"><br><br>
<b>Password</b>    <input type="password" name="pwd"><br><br>
<b>Married</b>   <input type="radio" name="married"checked>
<b>Un-Married</b><input type="radio" name="married"><br><br>
<b>Gender</b><br>
<input type="radio" name="gender" value=male>Male
<input type="radio" name="gender" value=female>Female
<input type="radio" name="gender" value=others>Others<br><br>
<button type="button" onclick="displayRadioValue()" >Submit for gender</button>
<br>
<div id="result"></div>
<script>
	function displayRadioValue(){
		var ele=document.getElementsByName('gender');
		for(i=0;i<ele.length;i++)
			{
				if(ele[i].checked)
				document.getElementById("result").innerHTML="Gender: "+ele[i].value;
			}
	}
</script>
<b>Certified in?</b><br>
<input type="checkbox" name="c">C and DS<br>
<input type="checkbox" name="c">java<br>
<input type="checkbox" name="c">MySql<br>
<br>
<b>Country<><br>
<select name="country">
	<option value=1>India</option>
	<option value=2>USA</option>
	<option value=3>UK</option>
</select>
<br>
<br>
<button>SUBMIT</button><br><br>
<%
	uname=request.getParameter("un");
	pw=request.getParameter("pwd");
	email=request.getParameter("email");
	gen=request.getParameter("gender");
	mar=request.getParameter("married");
	cer=request.getParameter("c");
	String con=request.getParameter("country");
	out.print("<br>"+uname+"<br>"+pw+"<br>"+email+"<br>"+gen+"<br>"+mar+"<br>"+cer+"<br>"+con);
	if(uname!=null&&pw!=null&&email!=null&&gen!=null&&mar!=null&&cer!=null&&con!=null)
		out.print("<br><h1>SUCCESSFULLY REGISTERED</h1>");
%>
</form>
</body>
</html>