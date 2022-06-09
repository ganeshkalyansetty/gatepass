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
<%--<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
STUDENT REGISTRATION
<br>
<form>
<b>FIRST NAME:</b>		<input type="text"name="fnm"><br>
<b>MIDDLE NAME:</b>	<input type="text"name="mnm"><br>
<b>LAST NAME:</b>	<input type="text"name="lnm"><br>
<b>ROLL NUMBER:</b>	<input type="text"name="rno"><br>
<b>CONTACT NUMBER:</b> 	<input type="text"name="ph"><br>
<b>BRANCH:</b><input type="text"name="b"><br>
<b>SECTION:</b><input type="text"name="sec"><br>
<b> FATHER NAME:</b><input type="text"name="fname"><br>
<b>FATHER CONTACT NUMBER:</b><input type="text"name="fph"><br>
<b>HOUSE NUMBER:</b><input type="text"name="hno"><br>
<b>PIN:</b><input type="text"name="pin"><br>
<br>
<input type="submit">
</form>--%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="style1.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Registration Form</title>
   </head>
<body>
  <div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="#">
        <div class="user-details">
        <div class="input-box">
            <span class="details">First Name</span>
            <input type="text" name="fnm"placeholder="Enter your first name" required>
          </div>
          <div class="input-box">
            <span class="details">Middle Name</span>
            <input type="text" name="mnm"placeholder="Enter your middle name" required>
          </div>
          <div class="input-box">
            <span class="details">Last Name</span>
            <input type="text" name="lnm"placeholder="Enter your last name" required>
          </div>
          <div class="input-box">
            <span class="details">Roll number</span>
            <input type="text" name="rno"placeholder="Enter your roll number" required>
          </div>
          <div class="input-box">
            <span class="details">Contact Number</span>
            <input type="text" name="ph"placeholder="Enter student Contact number" required>
          </div>
          <div class="input-box">
            <span class="details">Branch</span>
            <input type="text" placeholder="Enter your number" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="text" placeholder="Enter your password" required>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="text" placeholder="Confirm your password" required>
          </div>
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" id="dot-1">
          <input type="radio" name="gender" id="dot-2">
          <input type="radio" name="gender" id="dot-3">
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1">
            <span class="dot one"></span>
            <span class="gender">Male</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender">Female</span>
          </label>
          <label for="dot-3">
            <span class="dot three"></span>
            <span class="gender">Prefer not to say</span>
            </label>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register">
        </div>
      </form>
    </div>
  </div>
<%
try{
	String fnm=request.getParameter("fnm");
	String mnm=request.getParameter("mnm");
	String lnm=request.getParameter("lnm");
	String rno=request.getParameter("rno");
	String ph=request.getParameter("ph");
	String b=request.getParameter("b");
	String sec=request.getParameter("sec");
	String hno=request.getParameter("hno");
	String pin=request.getParameter("pin");
	String fname=request.getParameter("fname");
	String fph=request.getParameter("fph");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","Ganesh@2002");
	Statement stmt=con.createStatement();
	stmt=con.createStatement();
	if(rno!=null){
	stmt.executeUpdate("insert into student_details(first_name,middle_name,last_name,roll_no,branch,section,contact_no,house_no,pin)values('"+fnm+"','"+mnm+"','"+lnm+"','"+rno+"','"+b+"','"+sec+"','"+ph+"','"+hno+"','"+pin+"')");
	stmt.executeUpdate("insert into student_father(father_name,father_ph,roll_no) values('"+fname+"','"+fph+"','"+rno+"')");
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
%>
</body>
</html>