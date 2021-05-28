import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ETagDao {
	DbUtil dbUtil;
	Statement stmt;
	ETagDao(){
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
			System.out.println("add ETag op result: "+res);
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
			System.out.println("update ETag op result: "+res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public int delete(String sql) {
		int res=-1;
		try {
			res=stmt.executeUpdate(sql);
			System.out.println("delete ETag op result: "+res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public ETag getETag(String sql) {
		ResultSet rs;
		ETag ETag=null;
		try {
			rs=stmt.executeQuery(sql);
			while (rs.next()){
				ETag=new ETag(   rs.getInt("etagid"),
								   rs.getString("etag"),
								   rs.getInt("freq")
							);
				break;
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ETag;
	}
	public ResultSet getETagResultSet(String sql) {
		ResultSet rs=null;
		try {
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
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
