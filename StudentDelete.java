package deleterecord;
import request.*;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
public class StudentDelete {
			public static int del(String str)
			{
				int i=0,j=0,k=0;
				if(str!=null)
				{
				try
				{
					Connection conn=connections.Establish();
					Statement stm1=conn.createStatement();
					stm1=conn.createStatement();
					i=stm1.executeUpdate("delete from student_details where roll_no='"+str+"'");
					j=stm1.executeUpdate("delete from student_address where roll_no='"+str+"'");
					conn.close();
					k=i&j;
				}
				catch(SQLException e)
				{
					System.out.print(e);
				}
				}
				return k;
			}
}