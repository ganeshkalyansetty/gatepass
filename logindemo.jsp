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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post">
Accno<input type="number" name="un"><br>
Title<input type="text" name="p">
<input type="submit">
</form>
<%
String un=request.getParameter("un");
String p=request.getParameter("p");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/connect","root","Ganesh@2002");
	Statement stmt=con.createStatement();
	stmt=con.createStatement();
	ResultSet rs;
	rs=stmt.executeQuery("select id,name from new_table");
	String accn;
	String tit="";
	int flag=0;
	if(un!=null)
	{
		while(rs.next())
		{
			accn=rs.getString("id");
			tit=rs.getString("name");
			if(un.equals(accn)&&p.equals(tit))
			{
				//out.print("Record Found"+"<a href='Dummypage.jsp'> redirect</a>");
				response.sendRedirect("Dummypage.jsp");
				flag=1;
				break;
			}
		}
	}
	if(un!=null && flag==0)
	{
		out.println("Book accno title is incorrect!"+"<a href='logindemo.jsp'>Retry</a>");
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