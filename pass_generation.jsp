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
.box{
margin-right:-50px;
  align:center;
  align-text:left;
  max-width:1000px;
  width: 98%;
  background-color: #ffff;
  padding: 25px 30px;
  border-radius: 10px;
  border: 5px solid gray;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
  height:70%;
  width:98%;
  margin:1vmin;
  border: 1px solid black;
  outline-style: solid;
  outline-color: black;
  outline-width: thin;
}
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
	font-size: 18px;
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
  text-decoration:;
  font-size:100%;
}

/* selected link */
a:active {
  color: red;
  text-decoration: underline;
}
body {
  margin: 0;
  text-align: center;
  
  font-family: Arial, Helvetica, sans-serif;
}
h5{
margin-left:100px;
font-weight:100;
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
h2{
color:blue;
}
p{
text-align:left;
}
</style>
</head>
<body>
<div class="container">
<div class="header">
  <a  href="studentpage.jsp">HOME</a>
  <a class="active" href="pass_generation.jsp">GATEPASS</a>
  <a href="login.jsp">LOGOUT</a>
</div>
<div class="box">
<%
String roll_no=(String)session.getAttribute("roll_no");
%>
<h2><b>STUDENT GATEPASS of <%=roll_no%></b></h2>
<h3><b>GYAAN INSTITUTE OF TECHNOLOGY</b></h3>
<h6>Narayanguda, Hyderabad, Telangana state</h6>
<%
Date date = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
DateFormat dateFormat1 = new SimpleDateFormat("hh:mm:ss");
String strDate = dateFormat.format(date);
String strTime=dateFormat1.format(date); 
	try
	{
		Connection con=connections.Establish();
		Statement stm=con.createStatement();
		stm=con.createStatement();
		ResultSet rs=stm.executeQuery("call pass('"+roll_no+"','"+strDate+"')");
		if(rs.next())
		{
			{
				%>
				<h4 align="left"><b>DATE:</b><%=rs.getString(8) %></h4>
				<b>NAME:</b><%=rs.getString(2) %> <%=rs.getString(3) %> <%=rs.getString(4) %><br>
				<b>BRANCH:</b><%=rs.getString(5) %><br>
				<b>SECTION:</b><%=rs.getString(6) %><br>
				<b>CONTACT NO.:</b><%=rs.getString(7) %><br>
				<b>REASON:</b><%=rs.getString(10) %><br>
				<b>PARENT NAME:</b><%=rs.getString(14) %><br>
				<b>PARENT CONTACT NO.:</b><%=rs.getString(15) %><br>
				<b>ADDRESS:</b><%=rs.getString(17) %>, <%=rs.getString(18) %>, <%=rs.getString(19) %>, <%=rs.getString(20) %>, <%=rs.getString(21) %>.
				<br><h4 align="right">SIGNED<br>by HOD and E-BLOCK<br><%=strTime %></h4>
				<%
			}
		}
		else
		{
			%>
			<h1 align="center">GATEPASS NOT YET GENERATED</h1>
			<% 
			Statement stm2=con.createStatement();
			stm2=con.createStatement();
			String sql2="select*from student_request where roll_no='"+roll_no+"' and dates='"+strDate+"'";
			ResultSet rs2=stm2.executeQuery(sql2);
			%>
			<table>
			<tr>
			<th>DATE</th>
			<th>ROLL NO</th>
			<th>PURPOSE</th>
			<th>HOD STATUS</th>
			<th>EBLOCK STATUS</th>
			<th>BRANCH</th>
			</tr>
			<tr>
			<%
			if(rs2.next()) 
				{
					%>
					<td><%=rs2.getString("dates") %></td>
					<td><%=rs2.getString("roll_no") %></td>
					<td><%=rs2.getString("purpose") %></td>
					<td><%=rs2.getString("HOD_status") %></td>
					<td><%=rs2.getString("Eblock_status") %></td>
					<td><%=rs2.getString("branch") %></td>
					</tr>
					</table>
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
</div>
</body>
</html>