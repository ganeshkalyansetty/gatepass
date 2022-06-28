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
<%@ page import ="request.date" %>
<%@ page import="java.text.DateFormat"%>  
<%@ page import="java.text.SimpleDateFormat"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./style1.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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
body {
  margin: 0;
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
}
body.h5{
text-align: left;
}
.topnav {
  overflow: hidden;
  background-color: #333;
}
.header {
  padding: 0px;
  text-align: center;
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  color: white;
  font-size: 30px;
}
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
h1{
color: red;
}
</style>
</head>
<body>
<div class="container">
<div class="header">
  <a  href="studentpage.jsp">Home</a>
  <a class="active" href="pass_generation.jsp">GATEPASS</a>
  <a href="login.jsp">LOGOUT</a>
</div>

<%
String roll_no=(String)session.getAttribute("roll_no");
%>
<h2><b>STUDENT GATEPASS of <%=roll_no%></b></h2>
<h3><b>GYAAN INSTITUTE OF TECHNOLOGY</b></h3>
<h6>Narayanguda, Hyderabad, Telangana state</h6>
<%
Date date = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
String strDate = dateFormat.format(date);
	try
	{
		Connection con=connections.Establish();
		Statement stm=con.createStatement();
		stm=con.createStatement();
		ResultSet rs=stm.executeQuery("call pass('"+roll_no+"','"+strDate+"')");
		if(rs.next())
		{
			
			if((rs.getRow())!=1)
			{
				%>
				<h1 align="center">GATEPASS NOT YET GENERATED</h1>
				<%
			}
			else
			{
				%>
				<h5>
					<b>NAME: </b> <%=rs.getString(2)%> 
								  <%=rs.getString(3) %>
								  <%=rs.getString(4) %>
					<br>
					<b>BRANCH: </b>
									<%=rs.getString(5) %>
					<br>
					<b>SECTION: </b> 
									<%=rs.getString(6) %>
					<%=rs.getString(7) %>
					<%=rs.getString(8) %>
				</h5>
				<%
			}
		}
	}
	catch(SQLException e)
	{
		out.print(e);
	}	
%>
</div>
</body>
</html>