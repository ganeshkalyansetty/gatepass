<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!String str;%>
<%!int week=2;%>

<%
	switch(week)
	{
		case 0:
			out.print("Sunday");
			break;
		case 1:
			out.print("Monday");
			break;
		case 2:
			out.print("Tuesday");
			break;
		case 3:
			out.print("Wednesday");
			break;
		case 4:
			out.print("Thursday");
			break;
		default:
			out.print("wrong choice");
	}
%>
</body>
</html>