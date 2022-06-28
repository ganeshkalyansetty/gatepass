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
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link href="empcss.css" type="text/css" rel="stylesheet"/>
<style>
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
header 
{
  background-color: #666;
  /opacity:0.7;/
  background: rgba(0, 0, 0, 0.4);
  padding: 30px;
  text-align: center;
  font-size: 45px;
  color: white;
}
/* Container for flexboxes */
section 
{
background: rgba(0, 0, 0, 0.1);
  display: -webkit-flex;
  text-align: center;
  display: flex;
}
/* Style the navigation menu */
nav 
{
  -webkit-flex: 1;
  -ms-flex: 1;
  flex: 0.5;
  background: #ccc;
  padding: 20px;
  background: rgba(0, 0, 0, 0.2);
}
/* Style the list inside the menu */
nav ul 
{
  list-style-type: none;
  padding: 0;
}
/* Style the content */
article 
{
  -webkit-flex: 3;
  -ms-flex: 3;
  flex: 3;
  background-color: #f1f1f1;
  /opacity:0.7;/
  background: rgba(0, 0, 0, 0.1);
  padding: 50px;
}
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
%>
 
    <a href="login.jsp"><img src="licon.jpg" height="35" width="35" align="right"></a>

             <p class="form_label"><h2>Welcome:<%out.println(appemails);%></h2></p>

                    <header>
                        <h3>E-BLOCK PAGE</h3>
                    </header>
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
                            <td>HOD STATUS</td>
                            <td>E-BLOCK STATUS</td>
                            </tr>
                            <% 
                            try
                            {	
                               Connection conn=connections.Establish();
                                Statement stmt1=conn.createStatement();
                                ResultSet rs1=stmt1.executeQuery("call EBlockreq('"+strDate+"')");
                                while(rs1.next())
                                {
                            %>
                                <tr>
                                <td><%=rs1.getString("dates") %></td>
                                <td><%=rs1.getString("roll_no") %></td>
                                <td><%=rs1.getString("first_name") %></td>
                                <td><%=rs1.getString("middle_name") %></td>
                                <td><%=rs1.getString("last_name") %></td>
                                <td><%=rs1.getString("branch") %></td>
                                <td><%=rs1.getString("section") %></td>
                                <td><%=rs1.getString("contact_no") %></td>
                                <td><%=rs1.getString("father_name") %></td>
                                <td><%=rs1.getString("father_ph") %></td>
                                <td><%=rs1.getString("purpose") %></td>
                                <td><%=rs1.getString("HOD_status") %></td>
                                <td><%=rs1.getString("EBlock_status") %></td>
                                <form action="./ServletApprove1">
                               <td><button type="button" class="button1" value="approve" onclick="location.href='ServletApprove1?ID=<%=rs1.getString("roll_no")%> '" style="width:60px;
                                     height:20px; 
                                     border:none; 
                                     border-radius:6px; 
                                     font-size:10px; 
                                     font-weight:bold;">Approve</button> 
									</form>
									<form action="./ServletReject1">
                                    <button type="button" class="button2" value="reject" onclick="location.href='ServletReject1?ID=<%=rs1.getString("roll_no") %>'" style="width:60px;
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
                            rs1.close();
                            stmt1.close();
                            conn.close();
                            }
                            catch(Exception e)
                            {
                                 e.printStackTrace();
                                 out.println(e);
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
    </body>
</html>