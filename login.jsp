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
<!DOCTYPE html>
<html lang="en" >
<head>
<style>
h2{
color:red;
}
</style>
  <meta charset="UTF-8">
  <title>Login Page</title>
   <link rel="stylesheet" href="./style.css">
</head>
<body>
<img src="https://cdn.ankurb.net/wp-content/uploads/2009/03/16174137/gyaanin2.jpg" width = "100px" height="100px">
<!-- partial:index.partial.html -->
<div id="bg"></div>
<form>
  <div class="form-field">
    <input type="text" name="un" placeholder="Username" required/>
  </div>
  
  <div class="form-field">
    <input type="password" name="p"placeholder="Password" required/>  
  </div>
  
  <div class="form-field">
    <button class="btn" type="submit">Log in</button>
  </div>
  </form>
  <br>
  <%
String una=request.getParameter("un");
String pw=request.getParameter("p");
try
{
	Connection con=connections.Establish();
	Statement stm=con.createStatement();
	stm=con.createStatement();
	Statement stm1=con.createStatement();
	stm1=con.createStatement();
	String sql=" select roll_no,contact_no,branch from student_details where roll_no='"+una+"'";
	String sql1="select emp_id,contact_number,branch,role,first_name from employee_details where emp_id='"+una+"'";
	//String sql2="select*from student_address where roll_no='"+rno+"'";
	ResultSet rs1=stm1.executeQuery(sql1);
	ResultSet rs=stm.executeQuery(sql);
if(una!=null)
{
	String uname="admin123";
	String pwd="0000";
	if(una.equals(uname)&&pw.equals(pwd))
	{
		response.sendRedirect("adminlogin.jsp");
	}
	else if(rs.next())
	{
		String rn=rs.getString("roll_no");
		String cn=rs.getString("contact_no");
		String branch=rs.getString("branch");
		if(una.equals(rn)&&pw.equals(cn))
		{
			response.sendRedirect("studentpage.jsp");
			session.setAttribute("roll_no",rn);
			session.setAttribute("branch",branch);
		}
		else
		{
			//out.println("INVALID LOGIN CREDENTIALS");
			%>
			<h2>
			<a href="login.jsp"></a>
			</h2>
			<%
		}
	}
	else if(rs1.next())
	{
		String rn1=rs1.getString("emp_id");
		String cn1=rs1.getString("contact_number");
		String nm1=rs1.getString("first_name");
		String role=rs1.getString("role");
		String branch=rs1.getString("branch");
		String hod="HOD";
		String E_block="E-BLOCK";
		if(una.equals(rn1)&&pw.equals(cn1))
		{
			if(role.equals(hod))
			{
				response.sendRedirect("HODpage.jsp");
				session.setAttribute("branch",branch);
				session.setAttribute("first_name",nm1);
			}
			else if(role.equals(E_block))
			{
				response.sendRedirect("Eblockpage.jsp");
				session.setAttribute("first_name",nm1);
			}
		}
		else
		{
			//out.println("INVALID LOGIN CREDENTIALS");
			%><h2>
			<a href="login.jsp"></a>
			</h2>
			<%
		}
	}
	else
	{
		%>
		<h2><a href="login.jsp"></a></h2>
		<% 
	}
}
rs.close();
rs1.close();
stm1.close();
stm.close();
con.close();
}
catch(SQLException e)
{
	out.print(e);
}

%>
</body>
</html>