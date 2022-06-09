<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GATEPASS MANAGEMENT SYSTEM</title>
</head>
<body>
<%--Given below is JSP Script i.e java code tag --%>
<% int count=0;
for(int i=0;i<10;i++)
{
	out.println("<br>"+(float)i/5);
}
//out.println("Hello,KMIT.JAVA code out.print() Example");
%>
<br>
page count is <% out.println(++count);%>
</body>
</html>