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
    <link rel="stylesheet" href="style1.css">
     
     <title>Employee Updation Form</title>
     
   </head>
<body>
  
<%
try{
	String fnm=request.getParameter("fnm");
	String mnm=request.getParameter("mnm");
	String lnm=request.getParameter("lnm");
	String eid=request.getParameter("eid");
	String ph=request.getParameter("ph");
	String b=request.getParameter("b");
	String role=request.getParameter("role");
	String hno=request.getParameter("hno");
	String pin=request.getParameter("pin");
	String street=request.getParameter("street");
	String mandal=request.getParameter("mandal");
	String dist=request.getParameter("dist");
	String state=request.getParameter("state");
	Connection con=connections.Establish();
	Statement stmt=con.createStatement();
	stmt=con.createStatement();
	String sql=" select*from employee_details where emp_id='"+eid+"'";
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()){
	%>
		<div class="container">
      <div class="header">
<div class="button">
  <a class="active" href="adminlogin.jsp">HOME</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
    <div class="title">Employee Details Updation</div>
    
    <div class="content">
      <form action="#">
        <div class="user-details">
        <div class="input-box">
            <span class="details">Employee id</span>
            <input type="text" name="eid"value="<%=rs.getString("emp_id")%>">
          </div>
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
            <span class="details">Branch</span>
            <input type="text" name="b"value="<%=rs.getString("branch")%>">
          </div>
          <div class="input-box">
            <span class="details">Contact Number</span>
            <input type="text" name="ph" value="<%=rs.getString("contact_number")%>">
          </div>
          <div class="input-box">
            <span class="details">Role</span>
            <input type="text" name="role"value="<%=rs.getString("role")%>">
          </div>
       
         <%
	}
	String sql2="select*from employee_address where emp_id='"+eid+"'";
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
            <input type="text" name="street"value="<%=rs2.getString("street")%>">
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
        </div> <div class="button">
        
          <input type="submit" value="Update">
        </div>
      </form>
    </div>
  </div>
  <%
}
          if(fnm!=null)
          {
			   stmt.executeUpdate("update employee_details set emp_id='"+eid+"',first_name='"+fnm+"',middle_name='"+mnm+"',last_name='"+lnm+"',branch='"+b+"',contact_number='"+ph+"',role='"+role+"' where emp_id='"+eid+"'");
				stmt.executeUpdate("update employee_address set emp_id='"+eid+"',house_no='"+hno+"',street='"+street+"',pin='"+pin+"',mandal='"+mandal+"',district='"+dist+"',state='"+state+"' where emp_id='"+eid+"'");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('STUDENT RECORD HAS BEEN MODIFIED');");
				 out.println("location='studentupdate.jsp';");
			     out.println("</script>");
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