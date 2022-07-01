package delempRec ;
import request.*;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
public class EmpDel {
			public static int del(String str)
			{
				int i=0;
				if(str!=null)
				{
				try
				{
					Connection conn=connections.Establish();
					Statement stm1=conn.createStatement();
					stm1=conn.createStatement();
					i=stm1.executeUpdate("delete from employee_details where emp_id='"+str+"'");
				//	j=stm1.executeUpdate("delete from employee_address where emp_id='"+str+"'");
					
					System.out.println(" Delete Record "+str);
					conn.close();
					
				}
				catch(SQLException e)
				{
					System.out.print(e);
				}
				}
				return i;
			}
}