import java.io.IOException;
import java.sql.*;
public class UserDao {
	DbUtil dbUtil;
	Statement stmt;
	UserDao(){
		dbUtil=new DbUtil();
		
		try {
			stmt = dbUtil.getConnect().createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("get stmt fail");
			e.printStackTrace();
		}
	}
	public int add(String sql) {
		int res=-1;
		try {
			res=stmt.executeUpdate(sql);
			System.out.println("add op result: "+res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public int update(String sql) {
		int res=-1;
		try {
			res=stmt.executeUpdate(sql);
			System.out.println("update op result: "+res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public User getUser(String sql) {
		ResultSet rs;
		User user=null;
		try {
			rs=stmt.executeQuery(sql);
			while (rs.next()){
				user=new User(rs.getInt("uid"),
								   rs.getString("username"),
								   rs.getString("email"),
								   rs.getString("phone"),
								   rs.getString("pass") );
				
	   
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public boolean isExist(String sql) {
		ResultSet rs;
		User user=null;
		boolean res=false;
		try {
			rs=stmt.executeQuery(sql);
			
			while (rs.next()){
				user=new User(rs.getInt("uid"),
								   rs.getString("username"),
								   rs.getString("email"),
								   rs.getString("phone"),
								   rs.getString("pass") );
				res=true;
	   
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public void close() {
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbUtil.close();
	}
}
