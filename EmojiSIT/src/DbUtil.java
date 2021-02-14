import java.util.*;
import java.io.*;
import java.sql.*;
public class DbUtil {
	private String propertiesPath=this.getClass().getResource("/db.properties").getPath();;
	private Connection connect;
	private String driver;
	private String url;
	private String mysqlUser;
	private String pass;
	DbUtil() throws IOException{
		 InputStream in = new BufferedInputStream(new FileInputStream(propertiesPath));
		 Properties prop = new Properties();
		 prop.load(in);
		 driver=prop.getProperty("driver");
		 url=prop.getProperty("url");
		 mysqlUser=prop.getProperty("mysqlUser");
		 pass=prop.getProperty("pass");
		 
		 try {
			  Class.forName(driver);     //加载MYSQL JDBC驱动程序   
			  System.out.println("Success loading Mysql Driver!");
		 }
		 catch (Exception e) {
			  System.out.println("Error loading Mysql Driver!");
			  e.printStackTrace();
		 }
		 
		 try {
			 connect = DriverManager.getConnection(url,mysqlUser,pass);
			 System.out.println("Success get Mysql Connection!");
		 }catch(Exception e) {
			 System.out.print("Error get Mysql Connection!");
			 e.printStackTrace();
		 }
	}
	public Connection getConnect() {
		return connect;
	}
	public void close() {
		try {
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
