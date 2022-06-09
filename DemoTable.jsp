<%@ page import="Gatepass.StateCapitals" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="max-width:500px;">
<%!StateCapitals obj =new StateCapitals();%>
<table>
	<tr class="gradientdown">
	<th style="width:40px;"><br></th>
	<th style="width:100px;">State and Capital</th>
	</tr>
	<%!String sAndC; %>
	<%
		for(int i=0;i<obj.stateCapital.size();i++)
		{
			sAndC=obj.getStateCapital(i);
	%>
	<tr class="data">
	<td style="text-align:center;">
	<td><%=sAndC %></td>
	</tr>
	<%} %>
</table>
</div>
</body>
</html>