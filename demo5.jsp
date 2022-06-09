<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dynamically build table</title>
</head>
<body>
<table border=3 width=100%> <%--table builds rows and columns, border 1,2 or 3 is thickness --%>
<%
	String[] col={"red","green","blue"};
	int n=3;
	%>
	<br>
	<br>
	<% 
	for(int i=0;i<n;i++)
	{
		%>
		<tr>
		<td><%=i%></td>
		<td><%out.print(col[i]); %></td>
		</tr>
		<%
	}
%>
</table>
</body>
</html>