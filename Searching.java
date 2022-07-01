package searchrecord;
import request.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.List;
import java.sql.Statement;
import java.util.ArrayList;
//import javax.portlet.PortletRequest;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
public class Searching extends SearchByBranch{
		public <T>studentdetails  searchbranch(String ele) throws SQLException {
//System.out.println("1")
			Connection con= connections.Establish();
			studentdetails  s=new studentdetails();
			if(con!=null) {
				Statement st=con.createStatement();
				ResultSet rs;
				try {
					String rno=ele;
					rs=st.executeQuery("call branchsearch('"+rno+"')");
					while(rs.next()) {
						s.roll_no=rs.getString("roll_no");
						s.first_name=rs.getString("first_name");
						s.last_name=rs.getString("last_name");
						s.middle_name=rs.getString("middle_name");
						s.branch=rs.getString("branch");
						s.section=rs.getString("section");
						s.contact_no=rs.getString("contact_no");
						s.pin=rs.getString("pin");
						s.father_name=rs.getString("father_name");
						s.father_ph=rs.getString("father_ph");
						s.mandal=rs.getString("mandal");
						s.district=rs.getString("district");
						s.locality=rs.getString("locality");
						s.state=rs.getString("state");
						s.house_no=rs.getString("house_no");	
						s.number=1;
						}
				}
				catch(SQLException e) {
					System.out.println(e);
				}catch(Exception e) {
					System.out.println(e);
				}
				st.executeUpdate("DROP VIEW search;");
				con.close();
				return s;
				
			}
			else {
				System.out.println("Connection not established");
				return null;
			}
		}
	}
