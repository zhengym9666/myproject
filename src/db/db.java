package db;
import java.sql.*;
public class db {

		private String dbDriver="com.mysql.jdbc.Driver";  
		private String sConnStr = "jdbc:mysql://localhost:3306/stu_union"; //sql2005 
		public Connection connect = null;
		public ResultSet rs=null;
		public db() {
	    try {
	     
	      Class.forName(dbDriver).newInstance(); 
	     
	      connect = DriverManager.getConnection(sConnStr,"root","root"); 
	     
	    }
	    catch (Exception ex) {
	      ex.printStackTrace();
	    }
	  }
	
	  
	  public ResultSet executeQuery(String sql) {
			try{
				//connect=DriverManager.getConnection(sConnStr,"sa","sa");
				Statement stmt=connect.createStatement();
				rs=stmt.executeQuery(sql);
			}catch(SQLException ex){
				System.err.println(ex.getMessage());
			}
			return rs;
		}
	  public void executeUpdate(String sql)
	    {
	    	
	    	Statement stmt=null;
	    	rs=null;
	    	try
	    	{  // connect=DriverManager.getConnection(sConnStr,"sa","sa");
	    		stmt=connect.createStatement();
	    		stmt.executeUpdate(sql);
	    		stmt.close();
	    		connect.close();
	    		
	    	
	    	}
	    	catch(SQLException ex)
	    	{
	    		System.err.println(ex.getMessage());
	    		
	    		
	    	}
	    
	    	
	    }
	  
	  public static void main(String[] args) {
		db testdb = new db();
		System.out.println("测试数据库连接");
	}
	  
}
