<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FORM example</title>
</head>
<body>
<%!String str; %>	<%--Declaration tag --%>
<form><%--Form tag --%>
	<h3><label>Enter your username</label></h3>
	<input type="text"name="un">        <%-- input tag --%>
	<br>
	<h3><label>Enter your password</label></h3>
	<input type="password"name="uk">        <%-- input tag --%>
	<br>
	<br>
	<input type="submit"value="Click">  <%--Button tag --%>
	<br>
	<% str=request.getParameter("un"); 
	if(str!=null) out.print("WELCOME "+str);
	%><%--Expression tag, this tag display value stored in a variable --%>
	<%--<%=str=request.getParameter("uk") --%>
</form>
</body>
</html>