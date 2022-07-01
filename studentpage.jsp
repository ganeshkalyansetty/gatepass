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
textarea {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
  overflow:auto;
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
  color: red;
  text-decoration: none;
}
textarea{
align: center;

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
.header {
  padding: 0px;
  text-align: center;
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  color: white;
  font-size: 30px;
}
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration:none;
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
</style>
</head>
<body>
<div class="container">
<div class="content">
<div class="user-details">
<div class="header">
<div class="button">
  <a class="active" href="#home">HOME</a>
  <a href="pass_generation.jsp">GATEPASS</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
<%
String purpose="";
String str=(String)session.getAttribute("roll_no");
String str1=(String)session.getAttribute("branch");
session.setAttribute("roll_no", str);
%>
<div class="title">Welcome <%=str %>!!</div>
<%Connection con=connections.Establish();
Statement stm=con.createStatement();
stm=con.createStatement();
String sql="select*from student_details where roll_no='"+str+"'";
ResultSet rs=stm.executeQuery(sql);
if(rs.next())
{%>
<form  method="post">
<h2 align="center">STUDENT DETAILS</h2>
<table  class="table table-striped" width=30% align="center">
<tr>
<th>Roll No.</th><td><%=rs.getString("roll_no") %></td></tr>
<tr><th>First Name</th><td><%=rs.getString("first_name") %></td></tr>
<tr><th>Middle Name</th><td><%=rs.getString("middle_name") %></td></tr>
<tr><th>Last Name</th><td><%=rs.getString("last_name") %></td></tr>
<tr><th>Branch</th><td><%=rs.getString("branch") %></td></tr>
<tr><th>Section</th><td><%=rs.getString("section") %></td></tr>
<tr><th>Contact_no</th><td><%=rs.getString("contact_no") %></td>
<%-- <td>Parent Name</td>
<td>Parent Contact No.</td>
--%>
</tr>
</table>
</form>
<%}%>

			<%
			   Date date = Calendar.getInstance().getTime();  
			    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
			    String strDate = dateFormat.format(date);
			    int i=0;
			%>
<%
try
{ 
	%>
	<form method=post>
<div class="input-box">
<div class="textarea">
  <textarea placeholder="ENTER YOUR REASON" rows="7" cols="125%" name="comment" ></textarea>
</div>
</div>
			<div class="button">
           <input type="submit" value="APPLY GATEPASS">
        </div>
			 </form>
	<%
	purpose=request.getParameter("comment");
	   String hello="pending";
	if(purpose!=null){
		Statement stmnt=con.createStatement();
		i=stmnt.executeUpdate("insert into student_request(dates,roll_no,purpose,HOD_status,Eblock_status,branch) values('"+strDate+"','"+str+"','"+purpose+"','"+hello+"','"+hello+"','"+str1+"')");
		%>
			<h2 align="center" color="green">GATEPASS APPLIED SUCCESSFULLY</h2>
		<% 
	}
}
catch(SQLException e)
{	
	//System.out.println("tthis is catch");
	Connection conn=connections.Establish();
Statement stm2=conn.createStatement();
stm2=conn.createStatement();
String sql2="select*from student_request where roll_no='"+str+"'";
ResultSet rs2=stm2.executeQuery(sql2);
while(rs2.next())
{
	String datee=rs2.getString("dates");
	if(datee.equals(strDate)){%>

<table  border="2">
<tr>
<th>DATE</th>
<th>ROLL NO</th>
<th>PURPOSE</th>
<th>HOD STATUS</th>
<th>EBLOCK STATUS</th>
<th>BRANCH</th>
</tr>
<tr>
<td><%=rs2.getString("dates") %></td>
<td><%=rs2.getString("roll_no") %></td>
<td><%=rs2.getString("purpose") %></td>
<td><%=rs2.getString("HOD_status") %></td>
<td><%=rs2.getString("Eblock_status") %></td>
<td><%=rs2.getString("branch") %></td>
</tr>
</table>
<% }}
	//out.print(e);
	if(purpose!=null){
	out.println("<script type=\"text/javascript\">");
	out.println("alert('YOU HAVE ALREADY APPLIED FOR GATEPASS');");
	 out.println("location='pass_generation	.jsp';");
     out.println("</script>");}
	rs2.close();
	conn.close();
}
rs.close();
con.close();
%>
</div>
</div>
</div>
</body>
</html>