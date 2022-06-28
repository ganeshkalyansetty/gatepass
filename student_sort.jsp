<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.Driver.*" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.lang.Class" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="request.connections" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Page For List Sorting</title>
</head>
<body style="background-color:#2193b0">
<%
try {
	Connection connection= connections.Establish();
	Statement statement=connection.createStatement();
	statement=connection.createStatement();
	ResultSet rs;
	rs=statement.executeQuery("call sort1()");
if(!connection.isClosed())
%>
<font size="+3" color="green">
<TABLE cellpadding="15" border="3" style="background-color: #ffffff">
<tr>
<th><a href="#" OnClick=" return <%rs = statement.executeQuery("call sort1()");%>">ROLL NUMBER</a></th>
<%--<%String string = response.encodeURL("");%>--%>
<%// rs = statement.executeQuery("SELECT * from details order by name asc;");%>
<th><a href="">FIRST NAME</a></th>
<%// rs = statement.executeQuery("SELECT * from details order by address asc;");%>
<th><a href="">MIDDLE NAME</a></th>
<th><a href="">LAST NAME</a></th>
<th><a href="">BRANCH</a></th>
<th><a href="">SECTION</a></th>
<th><a href="">CONTACT NUMBER</a></th>
<th><a href="">PIN</a></th>
<th><a href="">MANDAL</a></th>
<th><a href="">DISTRICT</a></th>
<th><a href="">STATE</a></th>
<th><a href="">LOCALITY</a></th>
<th><a href="">HOUSE NUMBER</a></th>
<th><a href="">FATHER NAME</a></th>
<th><a href="">FATHER CONTACT NUMBER</a></th>
</tr>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<TD><%=rs.getString(7)%></TD>
<TD><%=rs.getString(8)%></TD>
<TD><%=rs.getString(9)%></TD>
<TD><%=rs.getString(10)%></TD>
<TD><%=rs.getString(11)%></TD>
<TD><%=rs.getString(12)%></TD>
<%--<TD><%=rs.getString(13)%></TD>--%>
<TD><%=rs.getString(14)%></TD>
<TD><%=rs.getString(15)%></TD>
<TD><%=rs.getString(16)%></TD>
</TR>
<% } %></TABLE>
<%
//int i;
//i=statement.executeUpdate("DROP VIEW sort;");
rs.close();
statement.close();
connection.close();
}
catch(Exception ex){
%>
</font>
<font size="+3" color="red">
<%
out.println("Unable to connect to database" + ex);
}%>
</font>
</body>
</html>