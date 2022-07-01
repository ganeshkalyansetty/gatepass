<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="style2.css">
 <link rel="stylesheet" href="style1.css">
    <meta charset="UTF-8">
<title>Insert title here</title>
</head>

   
<title>Insert title here</title>
</head>
<body>
<form action=empupdate.jsp method="post">
<div class="container1">
  <div class="title">EMPLOYEE DETAILS MODIFICATION</div>
  <div class="content">
    <div class="user-details">   
        <div class="input-box1">
            <span class="details"></span>
            <input type="text" name="eid"placeholder="Enter Employee ID to modify details" required>
          </div>       
<div class="button1">
          <input type="submit" value="submit">
      </div>
      	</div>
        </div>
        </div>
        </form>
</body>
</html>