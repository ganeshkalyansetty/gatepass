<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
img {
   display: block;
  margin-left: auto;
  margin-right: auto;
  
}
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
h6 {
  text-align: right;
}
*{
  margin: 20px;
  padding:0px;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background: linear-gradient(135deg, #02aab0,#00cdac);
}
</style>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style1.css">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<div class="header">
<div class="button">
  <a class="active" href="#home">HOME</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
<div class="title">Welcome Admin!!</div>
<form action="studentdemo.jsp" method="post">
<div class="button">
          <input type="submit" value="STUDENT REGISTRATION">
        </div>
</form>
<form action="studentupdate.jsp" method="post">
<div class="button">
          <input type="submit" value="STUDENT DETAILS MODIFICATION">
        </div>
</form>
<form action="student_delete.jsp" method="post">
<div class="button">
          <input type="submit" value="STUDENT RECORD DELETION">
        </div>
</form>
<form action="student_sort.jsp" method="post">
<div class="button">
          <input type="submit" value="ALL STUDENT RECORDS">
        </div>
</form>
<form action="student_search.jsp" method="post">
<div class="button">
          <input type="submit" value="SEARCH A STUDENT RECORD">
        </div>
</form>
<form action="empReg.jsp" method="post">
 <div class="button">
          <input type="submit" value="EMPLOYEE REGISTRATION">
        </div>     
</form>
<form action="emp_modify.jsp" method="post">
<div class="button">
          <input type="submit" value="EMPLOYEE DETAILS MODIFICATION">
        </div>
</form>
<form action="EmpDel.jsp" method="post">
<div class="button">
          <input type="submit" value="EMPLOYEE RECORD DELETION">
        </div>
</form>
</div>
</body>
</html>