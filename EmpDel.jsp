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
<%@ page import ="delempRec.EmpDel" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="style1.css">
    <link rel="stylesheet" href="style2.css">
    <style type="text/css">
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
	font-size: 13px;
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
    </style>
    <meta charset="UTF-8">
<title>Employee record deletion page</title>
</head>
<body>
<form method="post">
<div class="container1">
 <div class="title">EEMPLOYEE DELETION</div>
    <div class="content"> 
    <div class="user-details">    
        <div class="input-box1">
            <span class="details">EMPLOYEE ID</span>
            <input  type="text" name="eid"placeholder="Enter employee id to delete record"  required>
          </div>       
<div class="button1">
          <input type="submit" value="submit">
      </div>
       
<%
String str=request.getParameter("eid");
%>

<br>

<%
try
{
	Connection con=connections.Establish();
	Statement stm=con.createStatement();
	stm=con.createStatement();
	String sql="select*from employee_details where emp_id='"+str+"'";
	//String sql1="select * from student_parent where roll_no='"+str+"'";
	ResultSet rs=stm.executeQuery(sql);
	//ResultSet rs1=stm.executeQuery(sql1);
	while(rs.next())
	{
		/*String rno=request.getParameter("roll_no");
		if(str.equals(rno))
		{*/%>
		<table border=2 class="table table-striped">
		<tr>
		<td>Employee_id</td>
		<td>First Name</td>
		<td>Middle Name</td>
		<td>Last Name</td>
		<td>Branch</td>
		<td>Section</td>
		<td>Contact_no</td>
		</tr>
		<% String fnm=rs.getString("first_name");%>
			<tr><td><%=rs.getString("emp_id") %></td>
			<td><%=rs.getString("first_name") %></td>
			<td><%=rs.getString("middle_name") %></td>
			<td><%=rs.getString("last_name") %></td>
			<td><%=rs.getString("branch") %></td>
			<td><%=rs.getString("role") %></td>
			<td><%=rs.getString("contact_number") %></td>
			<%-- <td><%=rs1.getString("parent_name") %></td>
			<td><%=rs1.getString("parent_ph") %></td>
			--%>
			</tr>
			
			<%
		//}
	}
	int i=EmpDel.del(str);
	if(i==1)
	{
		out.println("Employee with ID "+str+" is deleted");
	}
	else if(str!=null&&i==0)
		out.print("Invalid Employee id!");
	rs.close();
	con.close();
}
catch(SQLException e)
{
	out.print(e);
}
%>
<br>
<%
%>
</table>
</div>
</div>
 </div>
 </form>
</body>
</html>