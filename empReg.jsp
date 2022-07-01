<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
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
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  <style type="text/css">
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
   select{
  		  height: 45px;
  		width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
  	}
  	
  </style>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="style_employee_registration.css">
     
     <title> Employee Registration Form</title>
     
   </head>
<body>
  <div class="container">
    <div class="header">
<div class="button">
  <a class="active" href="adminlogin.jsp">HOME</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
    <div class="title">Employee Registration</div>
    
    <div class="content">
      <form action="#">
        <div class="user-details">
        <div class="input-box">
            <span class="details">First Name</span>
            <input type="text" name="fnm"placeholder="Enter employee first name" required>
          </div>
          <div class="input-box">
            <span class="details">Middle Name</span>
            <input type="text" name="mnm"placeholder="Enter employee middle name" required>
          </div>
          <div class="input-box">
            <span class="details">Last Name</span>
            <input type="text" name="lnm"placeholder="Enter employee last name" required>
          </div>
          <div class="input-box">
            <span class="details">employee number</span>
            <input type="text" name="eno"placeholder="Enter employee ID number" required>
          </div>
          <div class="input-box">
            <span class="details">Contact Number</span>
            <input type="text" name="ph"placeholder="Enter employee Contact number" required>
          </div>
          <div class="input-box">
            <span class="details">ROLE</span>
            <input type="text" name="b"placeholder="Enter employee role" required>
          </div>
          <div class="input-box">
            <span class="details">Head of which department</span>
            <input type="text" name="branch"placeholder="Enter HOD branch(only for HOD)" required>
          </div>
          <div class="input-box">
            <span class="details" >HOUSE NUMBER</span>
            <input type="text" name="hno"placeholder="Enter house number" required>
          </div>
          <div class="input-box">
            <span class="details">PIN</span>
            <input type="text" name="pin"placeholder="Enter pin" required>
          </div>
          <div class="input-box">
            <span class="details">STREET/LOCALITY</span>
            <input type="text" name="street"placeholder="Enter street/locality" required>
          </div>
          <div class="input-box">
            <span class="details">MANDAL</span>
            <input type="text" name="mandal"placeholder="Enter mandal" required>
          </div>
          <div class="input-box">
            <span class="details">DISTRICT</span>
            <input type="text" name="dist"placeholder="Enter district" required>
          </div>
          <div class="input-box">
            <span class="details">STATE</span>
            <input type="text" name="state"placeholder="Enter state" required>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register">
        </div>
      </form>
    </div>
 
<%
int flag=0;
try{
	String fnm=request.getParameter("fnm");
	String mnm=request.getParameter("mnm");
	String lnm=request.getParameter("lnm");
	String eno=request.getParameter("eno");
	String ph=request.getParameter("ph");
	String b=request.getParameter("b");
	String branch=request.getParameter("branch");
	String hno=request.getParameter("hno");
	String pin=request.getParameter("pin");
	String street=request.getParameter("street");
	String mandal=request.getParameter("mandal");
	String dist=request.getParameter("dist");
	String state=request.getParameter("state");
	Connection con=connections.Establish();
	Statement stmt=con.createStatement();
	stmt=con.createStatement();
	if(eno!=null){
	stmt.executeUpdate("insert into employee_details(emp_id,first_name,middle_name,last_name,role,contact_number,branch)values('"+eno+"','"+fnm+"','"+mnm+"','"+lnm+"','"+b+"','"+ph+"','"+branch+"')");
	stmt.executeUpdate("insert into employee_address(emp_id,house_no,street,pin,mandal,district,state) values('"+eno+"','"+hno+"','"+street+"','"+pin+"','"+mandal+"','"+dist+"','"+state+"')");
	flag=1;
	}
	con.close();
}
catch(SQLException e)
{
	out.println(e);
}
catch(Exception e)
{
	out.println(e);
}
if(flag==1)
{
	%>
	<h2 align="center">REGISTRATION SUCCESSFUL</h2>
	<% 
}
%>
 </div>
</body>
</html>