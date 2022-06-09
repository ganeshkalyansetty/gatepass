
<%@page import="Gatepass.Student" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<%!Student obj1=new Student(); %>
<%!String sAndC; %>
	<%
		obj1.registration();
		for(int i=0;i<obj1.details.size();i++)
		{
			sAndC=obj1.getStudentDetails(i);
			%>
			<tr> 
			<td><%= sAndC %>
			</td>
			</tr>
			<%
		}
	%>
	</table>
</body>
</html>