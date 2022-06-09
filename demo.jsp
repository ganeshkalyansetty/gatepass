<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Driver" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.lang.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!String str; %>

<%

try
{
	String url="jdbc:mysql://localhost:3306/connect";
	String uname="root";
	String pass="Ganesh@2002";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url,uname,pass);
Statement st=con.createStatement();
 String sql ="insert into new_table(id,name) values('5','dinesh')";
 st.executeUpdate(sql);
  out.println("Data is successfully inserted!");

}
catch(Exception ex)
{
out.print("catch");%><h2>


<% out.println(ex);%>
</h2>
<% 
ex.printStackTrace();
}
%>

</body>
</html>