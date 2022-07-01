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
<%@ page import="java.text.DateFormat"%>  
<%@ page import="java.text.SimpleDateFormat"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./style1.css">
<meta charset="ISO-8859-1">
<style>
table { 
	width: 0%; 
	border-collapse: collapse; 
	margin:50px auto;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #eee; 
	}

th { 
	background: #71b7e6; 
	color: white; 
	font-weight: bold; 
	}

td, th { 
	padding: 10px; 
	border: 1px solid #ccc; 
	text-align: left; 
	font-size: 14px;
	}
.container1{
   
  max-width:10000px;
  width: 90%;
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
.header {
  padding: 0px;
  text-align: center;
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  color: white;
  font-size: 30px;
}
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

* {
  box-sizing: border-box;
  }
body 
{
  font-family: Arial, Helvetica, sans-serif;
}
.form-popup {
  display: none;
}
/* Style the header */
/* Container for flexboxes */
/* Style the navigation menu */
/* Style the content */

.button1 {
  background-color: #4CAF50; /* Green */
}
.button2 {background-color: #f44336;} /* Red */ 
/* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
@media (max-width: 600px) 
{
  section 
  {
 
    -webkit-flex-direction: column;
    flex-direction: column;
  }
}
</style>
<title>Insert title here</title>
</head>
<body>
<%
String branch=(String)session.getAttribute("branch");
Connection conn=connections.Establish();
int flag=0,count=0;
Date date = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
String strDate = dateFormat.format(date);
%>
<div class="container1">
<div class="content">
<div class="user-details">
<div class="header">
<div class="button">
  <a href="HODpage.jsp">HOME</a>
  <a class="active" href="HODrecord.jsp">RECORDS</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
                    <div class="title">STUDENT REQUESTS</div>
                    <h1 align="center">HOD PAGE</h1>
                     <table  style="border:black;color:black; font-family: Arial, Helvetica, sans-serif; font-size:10px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr>
                            <th>DATE</th>
                            <th>ROLL NUMBER</th> 
                            <th>FIRST NAME</th> 
                            <th>MIDDLE NAME</th> 
                            <th>LAST NAME</th> 
                            <th>BRANCH</th> 
                            <th>SECTION</th> 
                            <th>CONTACT NUMBER</th> 
                            <th>FATHER NAME</th> 
                            <th>FATHER CONTACT NUMBER</th> 
                            <th>PURPOSE</th> 
                            <th>STATUS</th>
                            </tr>
                            <% 
                            try
                            {	
                               
                                Statement stmt1=conn.createStatement();
                                ResultSet rs1=stmt1.executeQuery("call HODreq_display('"+strDate+"','"+branch+"')");
                                while(rs1.next())
                                {
                            %>
                                <tr>
                                <td><%=rs1.getString("dates") %></td>
                                <td><%=rs1.getString("roll_no") %></td>
                                <td><%=rs1.getString("first_name") %></td>
                                <td><%=rs1.getString("middle_name") %></td>
                                <td><%=rs1.getString("last_name") %></td>
                                <td><%=rs1.getString("branch") %></td>
                                <td><%=rs1.getString("section") %></td>
                                <td><%=rs1.getString("contact_no") %></td>
                                <td><%=rs1.getString("father_name") %></td>
                                <td><%=rs1.getString("father_ph") %></td>
                                <td><%=rs1.getString("purpose") %></td>
                                <td><%=rs1.getString("HOD_status") %></td>
                                </tr>
                            <%
                                }
                            rs1.close();
                            stmt1.close();
                            conn.close();
                            
                            }
                            catch(Exception e)
                            {
                                 e.printStackTrace();
                                 out.println(e);
                            }
                            %>          
                            </table>        
                            </div>
          
 </div>
 </div>
</body>
</html>