package request;
import  java.sql.Connection;
import  java.sql.Statement; 
import  java.sql.ResultSet;
 import java.sql.Driver.*;
 import java.sql.DriverManager;
import  java.sql.SQLException;
import  javax.sql.*;
import  java.util.*; 
import  java.lang.Class;
import  java.lang.*;
import  java.sql.Statement;
public class connections {
	public  static Connection Establish() throws SQLException {
		Connection conn=null; 
		try
		 {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","Ganesh@2002");
			 //return conn;
		 }
		catch(SQLException e)
		 {
			 System.out.println("connection not established");	
			 //conn=null;
		 }
		 catch(ClassNotFoundException ex)
		 {

			 	System.out.println(ex);
			 	ex.printStackTrace();
		 }
		 return conn;
		 	
	 }
	public static boolean closeConnection(Connection obj) {
		try
	      {
	        if(obj != null)
	         obj.close();  
	      } 
		catch (SQLException e)
		{
	        return false;
		}
		return true;
	}
}