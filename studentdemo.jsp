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
}
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
    <link rel="stylesheet" href="style1.css">
     
     <title>Student Registration Form</title>
     
   </head>
<body>
  <div class="container">
<div class="header">
<div class="button">
  <a class="active" href="adminlogin.jsp">HOME</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
    <div class="title">Student Registration</div>
    
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
            <input type="text" name="b"placeholder="Enter student branch" required>
          </div>
          <div class="input-box">
            <span class="details">Section</span>
            <input type="text" name="sec"placeholder="Enter student section" required>
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
          <div class="input-box">
            <span class="details">Parent/Guardian Name</span>
            <input type="text" name="fname"placeholder="Enter parent/guardian name" required>
          </div>
          <div class="input-box">
            <span class="details">Parent/Guardian Contact number</span>
            <input type="text" name="fno"placeholder="Enter Parent/guardian Contact number" required>
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
int flag=0;
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
	String street=request.getParameter("street");
	String mandal=request.getParameter("mandal");
	String dist=request.getParameter("dist");
	String state=request.getParameter("state");
	String fname=request.getParameter("fname");
	String fph=request.getParameter("fno");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","Ganesh@2002");
	Statement stmt=con.createStatement();
	stmt=con.createStatement();
	if(rno!=null){
	stmt.executeUpdate("insert into student_details(first_name,middle_name,last_name,roll_no,branch,section,contact_no)values('"+fnm+"','"+mnm+"','"+lnm+"','"+rno+"','"+b+"','"+sec+"','"+ph+"')");
	stmt.executeUpdate("insert into student_address(pin,mandal,district,state,locality,roll_no,house_no) values('"+pin+"','"+mandal+"','"+dist+"','"+state+"','"+street+"','"+rno+"','"+hno+"')");
	stmt.executeUpdate("insert into student_father(father_name,father_ph,roll_no) values('"+fname+"','"+fph+"','"+rno+"')");
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
	out.print("REGISTRATION SUCCESSFULL");
}
%>
</body>
</html>