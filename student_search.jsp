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
<%@ page import="searchrecord.Searching"%>
<%@page import ="searchrecord.studentdetails" %>
<!DOCTYPE html>
<html>
<head>
 <style>
table { 
	width: 750px; 
	border-collapse: collapse; 
	margin:50px -20px;
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
	font-size: 14px;
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
form .button{
 
   height: 45px;
   margin: 35px 0
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.3s ease;
   background: linear-gradient(135deg, #02aab0,#00cdac);
 }
 form .button input:hover{
  transform: scale(1.08); 
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
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
</style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<div class="title">Search a student record</div>
<div class="content">
<form action="#" method="post">
<div class="user-details">
<div class="input-box">
<input type="text" name="rollno" placeholder="Enter student Rollno" required>
</div>
<div class="button">
<input type="submit" value="submit">
</div>
</div>
</form>
 <%String rollno=request.getParameter("rollno"); %>
 <% 
 Searching obj=new Searching();
studentdetails temp=obj.searchbranch(rollno);
 //ArrayList<studentdetails> o=(ArrayList)request.getAttribute("display");
if(temp.number==0&&rollno!=null)
{
	out.println("ROLL NUMBR DOES NOT EXIST");
}
else if(rollno!=null){
	%>
	<font size="+1" color="green">
<TABLE cellpadding="15" border="3" style="background-color: #ffffff">
<tr>
<th><a href="">ROLL NUMBER</a></th>
<th><a href="">FIRST NAME</a></th>
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
<TR>
<TD><%=temp.roll_no%></TD>
<TD><%=temp.first_name%></TD>
<TD><%=temp.middle_name%></TD>
<TD><%=temp.last_name%></TD>
<TD><%=temp.branch%></TD>
<TD><%=temp.section%></TD>
<TD><%=temp.contact_no%></TD>
<TD><%=temp.pin%></TD>
<TD><%=temp.mandal%></TD>
<TD><%=temp.district%></TD>
<TD><%=temp.state%></TD>
<TD><%=temp.locality%></TD>
<%--<TD><%=rs.getString(13)%></TD>--%>
<TD><%=temp.house_no%></TD>
<TD><%=temp.father_name%></TD>
<TD><%=temp.father_ph%></TD>
</TR>
	<%
}
 %>
 
 </TABLE>
 </font>

</div>
</div>
</body>
</html>