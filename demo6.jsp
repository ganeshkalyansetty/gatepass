<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String[] colors={"red","green","blue"};
for(int i=0;i<colors.length;i++)
{
	out.print("<p>"+colors[i]+"</p>");
}
out.print(" "+colors[1].length()+"<br>");
out.print(colors[2].equals("Blue")+"<br>");
out.print(" "+colors[0].charAt(2)+"<br>");
out.print(" "+colors[1].indexOf("n")+"<br>");
out.print(" "+colors[1].replace('e','E')+"<br>");
%>
<%-- <p> is HTML paragraph tag --%>
</body>
</html>