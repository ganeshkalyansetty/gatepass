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
table { 
	width: 0%; 
	border-collapse: collapse; 
	margin:30px -30px;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #eee; 
	}

th { 
	background: #0000FF; 
	color: white; 
	font-weight: bold; 
	}

td, th { 
	padding: 10px; 
	border: 1px solid #ccc; 
	text-align: left; 
	font-size: 15px;
	}
.container1{
   
  max-width:10000px;
  width: 90%;
  background-color: #ffff;
  padding: 25px 30px;
  border-radius: 10px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
  overflow-y:scroll;
  height:110%;
  width:100%;
  margin:1vmin;

}
.container1 .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container1 .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
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
<%
Connection con=connections.Establish();
int flag=0,count=0;
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
session.setAttribute("branch",branch);
%>
<div class="container1">
<div class="content">
<div class="user-details">
<div class="header">
<div class="button">
  <a class="active" href="#home">HOME</a>
  <a href="HODrecord.jsp">RECORDS</a>
  <a href="login.jsp">LOGOUT</a>
</div>
</div>
                    <div class="title">Welcome:<%out.println(appemails);%></div>
                    <h1 align="center">HOD PAGE</h1>
                    <section>
                       
                        <article>
                            <h1 style="color:black; font-size: 20px;">Gate pass Records</h1>
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
                            <td>APPROVE/REJECT</td>
                            </tr>
                            <% 
                            try
                            {
                               
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
                               <td>
                               <button type="button" class="button1" value="approve" onclick="location.href='ServletApprove?ID=<%=rs.getString("roll_no")%>'" 
                               		 style="height:40px;
                                     width:120px; 
                                     border:none;
                                     margin:5px 20px; 
                                     border-radius:6px; 
                                     font-size:12px; 
                                     font-weight:bold;">Approve</button> 
									</form>
									<form action="./ServletReject">
                               <button type="button" class="button2" value="reject" onclick="location.href='ServletReject?ID=<%=rs.getString("roll_no") %>'"
                                     style="height:40px; 
                                     width:120px; 
                                     border:none; 
                                     margin:-5px 10px;
                                     border-radius:6px; 
                                     font-size:12px; 
                                     font-weight:bold;">Reject</button>
                                </td>   
								</tr>
								
                            <%
                            flag=rs.getRow();
                                }
                                
                                
                            %>
                            <h4 align="center">Total requests are <%=flag%></h4>
                            <%
                                
                            rs.close();
                            stmt.close();
                            
                            }
                            catch(Exception e)
                            {
                                 e.printStackTrace();
                            }
                            %>          
                            </table>        
                            </div>
                            </article>                           
            </section>
        </form>
        <%
        	try
        	{
        		String approved="approved";
        		Statement stmt1=con.createStatement();
                ResultSet rs1=stmt1.executeQuery("select * from student_request where branch='"+branch+"' and HOD_status='"+approved+"' and dates='"+strDate+"'");
        		while(rs1.next())
        		{
        			count=rs1.getRow();
        		}
        		rs1.close();
        		stmt1.close();
        		con.close();
        	}
       		catch(SQLException e)
        	{
        		out.println(e);
        	}
        %>
        <h2 align="center">TOTAL NUMBER OF GATEPASSES APPROVED AS OF <%=strDate%> are <%=count %></h2>
        </div>
        </div>
        </div>
    </body>
</html>