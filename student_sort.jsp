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
<style>
table { 
	width: 750px; 
	border-collapse: collapse; 
	margin:50px auto;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #eee; 
	}

th { 
	background: #3498db; 
	color: white; 
	font-weight: bold; 
	}

td, th { 
	padding: 10px; 
	border: 1px solid #ccc; 
	text-align: left; 
	font-size: 13px;
	}

/* 
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table { 
	  	width: 100%; 
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}

	td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);

		color: #000;
		font-weight: bold;
	}

}
    /* unvisited link */
a:link {
  color: black;
  text-decoration: none;
  background-color: linear-gradient(-135deg, #71b7e3, #9b59b7);
  font-size:80%;
}

/* visited link */
a:visited {
  color: black;
  text-decoration: none;
}

/* mouse over link */
a:hover {
  color: white;
  text-decoration: none;
  font-size:100%;
}

/* selected link */
a:active {
  color: blue;
  text-decoration: none;
}
.header {
  padding: 0px;
  text-align: center;
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  color: white;
  font-size: 30px;
}
.container1{
  max-width:10000px;
  width: 100%;
  background-color: #ffff;
  padding: 25px 30px;
  border-radius: 10px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
  overflow-y:scroll;
  height:110%;
  width:100%;
  margin:1vmin;

}

.container1 .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container1 .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
}
</style>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<div class="container1">
<div class="header">
<div class="button">
  <a class="active" href="adminlogin.jsp">HOME</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
    <div class="title">All student records</div>
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
</div>
</body>
</html>