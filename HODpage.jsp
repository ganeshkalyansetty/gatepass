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
<%@ page import="java.text.DateFormat"%>  
<%@ page import="java.text.SimpleDateFormat"%> 
<%
//   String name = request.getParameter( "username" );
  // session.setAttribute( "theName", name );
%>

<html>
<head>
<link rel="stylesheet" href="./style1.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link href="empcss.css" type="text/css" rel="stylesheet"/>
<style>
.container1{
  max-width:10000px;
  width: 100px;
  background-color: #ffff;
  padding: 25px 30px;
  border-radius: 10px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
  overflow-y:scroll;
  height:110%;
  width:130%;
  margin:1vmin;

}
.header {
  padding: 0px;
  text-align: center;
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  color: white;
  font-size: 30px;
}
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

* {
  box-sizing: border-box;
  }
body 
{
  font-family: Arial, Helvetica, sans-serif;
}
.form-popup {
  display: none;
}
/* Style the header */
/* Container for flexboxes */
/* Style the navigation menu */
/* Style the content */

.button1 {
  background-color: #4CAF50; /* Green */
}
.button2 {background-color: #f44336;} /* Red */ 
/* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
@media (max-width: 600px) 
{
  section 
  {
    -webkit-flex-direction: column;
    flex-direction: column;
  }
}
</style>
</head>
<body>
<div class="container1">
<div class="content">
<div class="user-details">
<div class="header">
<div class="button">
  <a class="active" href="#home">Home</a>
 
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
<%
Date date = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
String strDate = dateFormat.format(date);
%>
<%
response.setHeader("Cache-control","no-cache");
response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expire", 0);
String appemails=(String)session.getAttribute("first_name");
String branch=(String)session.getAttribute("branch");
%>
                        
                    <div class="title">Welcome:<%out.println(appemails);%></div>
                    <h1 align="center">HOD PAGE</h1>
                    <section>
                        <nav>
                            <ul>
                                <li>
                                    <button type="button" value="Get All Record"  class="open-button" onclick="openForm()" style="width:70px;
                                     height:40px;
                                     margin:5px; 
                                     border:none; 
                                     border-radius:2px; 
                                     font-size:17px; 
                                     font-weight:bold;">View</button>

                                     <button type="button" class="btn cancel" onclick="closeForm()" style="width:70px;
                                     height:40px; 
                                     margin:5px; 
                                     border:none; 
                                     border-radius:2px; 
                                     font-size:17px; 
                                     font-weight:bold;">Close</button>
                                </li>
                            </ul>
                        </nav>
                        <article>
                            <h1 style="color:black; font-size: 20px;">Gate pass Records</h1>
                            <div class="form-popup" id="myForm" style="height:200px;width:1180px;overflow:scroll;overflow-y:scroll;overflow-x:hidden;">

                            <table  style="border:black;color:black; font-family: Arial, Helvetica, sans-serif; font-size:10px; font-weight:bold;" border="5" cellpadding="5" cellspacing="1" >
                            <tr>
                            <td>DATE</td>
                            <td>ROLL NUMBER</td> 
                            <td>FIRST NAME</td> 
                            <td>MIDDLE NAME</td> 
                            <td>LAST NAME</td> 
                            <td>BRANCH</td> 
                            <td>SECTION</td> 
                            <td>CONTACT NUMBER</td> 
                            <td>FATHER NAME</td> 
                            <td>FATHER CONTACT NUMBER</td> 
                            <td>PURPOSE</td> 
                            <td>STATUS</td>
                            </tr>
                            <% 
                            try
                            {
                               Connection con=connections.Establish();
                                Statement stmt=con.createStatement();
                                ResultSet rs=stmt.executeQuery("call HODreq('"+strDate+"','"+branch+"')");
                                
                                while(rs.next())
                                {
                            %>
                                <tr>
                                <td><%=rs.getString("dates") %></td>
                                <td><%=rs.getString("roll_no") %></td>
                                <td><%=rs.getString("first_name") %></td>
                                <td><%=rs.getString("middle_name") %></td>
                                <td><%=rs.getString("last_name") %></td>
                                <td><%=rs.getString("branch") %></td>
                                <td><%=rs.getString("section") %></td>
                                <td><%=rs.getString("contact_no") %></td>
                                <td><%=rs.getString("father_name") %></td>
                                <td><%=rs.getString("father_ph") %></td>
                                <td><%=rs.getString("purpose") %></td>
                                <td><%=rs.getString("HOD_status") %></td>
                                <form action="./ServletApprove">
                               <td><button type="button" class="button1" value="approve" onclick="location.href='ServletApprove?ID=<%=rs.getString("roll_no")%>'" style="width:60px;
                                     height:20px; 
                                     border:none; 
                                     border-radius:6px; 
                                     font-size:10px; 
                                     font-weight:bold;">Approve</button> 
									</form>
									<form action="./ServletReject">
                                    <button type="button" class="button2" value="reject" onclick="location.href='ServletReject?ID=<%=rs.getString("roll_no") %>'" style="width:60px;
                                     height:20px; 
                                     border:none; 
                                     border-radius:6px; 
                                     font-size:10px; 
                                     font-weight:bold;">Reject</button>

                                </td>   

                                </tr>

                            <%
                                }
                            %>
                            <%
                            rs.close();
                            stmt.close();
                            con.close();
                            }
                            catch(Exception e)
                            {
                                 e.printStackTrace();
                            }
                            %>          
                            </table>        
                            </div>
                            </article>

                <script>
                    function openForm() 
                    {
                        document.getElementById("myForm").style.display = "block";
                    }
                    function closeForm() 
                    {
                        document.getElementById("myForm").style.display = "none";
                    }
                </script>                           
            </section>
        </form>
        </div>
        </div>
        </div>
    </body>
</html>