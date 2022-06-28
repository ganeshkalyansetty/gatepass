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
     
     <title>Updation Form</title>
     
   </head>
<body>
  
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
	String locality=request.getParameter("locality");
	String mandal=request.getParameter("mandal");
	String dist=request.getParameter("dist");
	String state=request.getParameter("state");
	String fname=request.getParameter("fname");
	String fph=request.getParameter("fno");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","Ganesh@2002");
	Statement stmt=con.createStatement();
	stmt=con.createStatement();
	String sql=" select*from student_details where roll_no='"+rno+"'";
	//String sql1="select*from student_father where roll_no='"+rno+"'";
	//String sql2="select*from student_address where roll_no='"+rno+"'";
	ResultSet rs=stmt.executeQuery(sql);
	//ResultSet rs1=stmt.executeQuery(sql1);
	//ResultSet rs2=stmt.executeQuery(sql2);
	if(rs.next()){
	%>
		<div class="container">
  
    <div class="title">Student Details Updation</div>
    
    <div class="content">
      <form action="#">
        <div class="user-details">
        <div class="input-box">
            <span class="details">First Name</span>
            <input type="text" name="fnm" value="<%=rs.getString("first_name")%>" >
          </div>
          <div class="input-box">
            <span class="details">Middle Name</span>
            <input type="text" name="mnm"value="<%=rs.getString("middle_name")%>">
          </div>
          <div class="input-box">
            <span class="details">Last Name</span>
            <input type="text" name="lnm" value="<%=rs.getString("last_name")%>">
          </div>
          <div class="input-box">
            <span class="details">Roll number</span>
            <input type="text" name="rno"value="<%=rs.getString("roll_no")%>">
          </div>
          <div class="input-box">
            <span class="details">Contact Number</span>
            <input type="text" name="ph" value="<%=rs.getString("contact_no")%>">
          </div>
          <div class="input-box">
            <span class="details">Branch</span>
            <input type="text" name="b"value="<%=rs.getString("branch")%>">
          </div>
          <div class="input-box">
            <span class="details">Section</span>
            <input type="text" name="sec"value="<%=rs.getString("section")%>">
          </div>
         <%
	}
	String sql2="select*from student_address where roll_no='"+rno+"'";
	ResultSet rs2=stmt.executeQuery(sql2);
          if(rs2.next()){%>
          <div class="input-box">
            <span class="details" >HOUSE NUMBER</span>
            <input type="text" name="hno"value="<%=rs2.getString("house_no")%>">
          </div>
          <div class="input-box">
            <span class="details">PIN</span>
            <input type="text" name="pin"value="<%=rs2.getString("pin")%>">
          </div>
          <div class="input-box">
            <span class="details">STREET/LOCALITY</span>
            <input type="text" name="locality"value="<%=rs2.getString("locality")%>">
          </div>
          <div class="input-box">
            <span class="details">MANDAL</span>
            <input type="text" name="mandal"value="<%=rs2.getString("mandal")%>">
          </div>
          <div class="input-box">
            <span class="details">DISTRICT</span>
            <input type="text" name="dist"value="<%=rs2.getString("district")%>">
          </div>
          <div class="input-box">
            <span class="details">STATE</span>
            <input type="text" name="state"value="<%=rs2.getString("state")%>">
          </div>
          <%
	}
          String sql1="select*from student_father where roll_no='"+rno+"'";
          ResultSet rs1=stmt.executeQuery(sql1);
          if(rs1.next()){
          %>
          <div class="input-box">
            <span class="details">Parent/Guardian Name</span>
            <input type="text" name="fname"value="<%=rs1.getString("father_name")%>">
          </div>
          <div class="input-box">
            <span class="details">Parent/Guardian Contact number</span>
            <input type="text" name="fno"value="<%=rs1.getString("father_ph")%>">
          </div>
        </div> <div class="button">
        
          <input type="submit" value="Update">
        </div>
      </form>
    </div>
  </div>
  <%
}
   stmt.executeUpdate("update student_details set roll_no='"+rno+"',first_name='"+fnm+"',middle_name='"+mnm+"',last_name='"+lnm+"',branch='"+b+"',section='"+sec+"',contact_no='"+ph+"',pin='"+pin+"' where roll_no='"+rno+"'");
	stmt.executeUpdate("update student_address set pin='"+pin+"',mandal='"+mandal+"',district='"+dist+"',state='"+state+"',locality='"+locality+"',roll_no='"+rno+"',house_no='"+hno+"'where roll_no='"+rno+"'");
	stmt.executeUpdate("update student_father set father_name='"+fname+"',father_ph='"+fph +"',roll_no='"+rno+"' where roll_no='"+rno+"'");
	con.close();
}
catch(SQLException e)
{
	out.println("");
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>