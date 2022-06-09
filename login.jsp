<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Page with Background Image Example</title>
  <link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div id="bg"></div>
<form>
  <div class="form-field">
    <input type="text" name="un" placeholder="Username" required/>
  </div>
  
  <div class="form-field">
    <input type="password" name="p"placeholder="Password" required/>                         </div>
  
  <div class="form-field">
    <button class="btn" type="submit">Log in</button>
  </div>
</form>
<%
String una=request.getParameter("un");
String pw=request.getParameter("p");
%>
<%
if(una!=null)
{
	String uname="admin123";
	String pwd="0000";
	if(una.equals(una) && pw.equals(pwd))
	{
		response.sendRedirect("adminlogin.jsp");
	}
	else
	{
		out.print("invalid username and password");
	}
}
%>
</body>
</html>