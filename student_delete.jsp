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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
      // The function below will start the confirmation dialog
      function confirmAction() {
        let confirmAction = confirm("Are you sure to execute this action?");
        if (confirmAction) {
          alert("Action successfully executed");
        } else {
          alert("Action canceled");
        }
      }
    </script>
</head>
<body>
<form method="post">
<input type="text" name="rno">
<%
String str=request.getParameter("rno");
%>
<br>
			<label>TO DELETE A STUDENT REDORD CLICK BELOW</label>
			<br>
			<br>
			<div class="button">
          <button onclick="confirmAction()">Delete</button>
        </div>
        <br>
			<br>
			<br>
			<br>
			</form>
<table border=2 class="table table-striped">
<tr>
<td>Roll No.</td>
<td>First Name</td>
<td>Middle Name</td>
<td>Last Name</td>
<td>Branch</td>
<td>Section</td>
<td>Contact_no</td>
<%-- <td>Parent Name</td>
<td>Parent Contact No.</td>
--%>
</tr>
<%
try
{
	Connection con=connections.Establish();
	Statement stm=con.createStatement();
	stm=con.createStatement();
	String sql="select*from student_details where roll_no='"+str+"'";
	//String sql1="select * from student_parent where roll_no='"+str+"'";
	ResultSet rs=stm.executeQuery(sql);
	//ResultSet rs1=stm.executeQuery(sql1);
	while(rs.next())
	{
		/*String rno=request.getParameter("roll_no");
		if(str.equals(rno))
		{*/%>
		<% String fnm=rs.getString("first_name");%>
			<tr>
			<td><%=rs.getString("roll_no") %></td>
			<td><%=rs.getString("first_name") %></td>
			<td><%=rs.getString("middle_name") %></td>
			<td><%=rs.getString("last_name") %></td>
			<td><%=rs.getString("branch") %></td>
			<td><%=rs.getString("section") %></td>
			<td><%=rs.getString("contact_no") %></td>
			<%-- <td><%=rs1.getString("parent_name") %></td>
			<td><%=rs1.getString("parent_ph") %></td>
			--%>
			</tr>
			<%
		//}
	}
	rs.close();
	con.close();
}
catch(SQLException e)
{
	out.print(e);
}
%>
			<%
			
if(str!=null){
	try
	{
		Connection conn=connections.Establish();
		Statement stm1=conn.createStatement();
		stm1=conn.createStatement();
		stm1.executeUpdate("delete from student_details where roll_no='"+str+"'");
		stm1.executeUpdate("delete from student_address where roll_no='"+str+"'");
		
		out.println(str+" Deleted Succesfully");
		conn.close();
		
	}
	catch(SQLException e)
	{
		out.print(e);
	}
}
%>
	
</form>	

</body>
</html>