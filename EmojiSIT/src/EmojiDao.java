import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmojiDao {
	DbUtil dbUtil;
	Statement stmt;
	EmojiDao(){
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
			System.out.println("add emoji op result: "+res);
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
			System.out.println("update emoji op result: "+res);
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
			System.out.println("delete emoji op result: "+res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public Emoji getEmoji(String sql) {
		ResultSet rs;
		Emoji emoji=null;
		try {
			rs=stmt.executeQuery(sql);
			while (rs.next()){
				emoji=new Emoji(   rs.getString("eid"),
								   rs.getString("caption"),
								   rs.getString("etag"),
								   rs.getDate("uploaddate"),
								   rs.getInt("uid"),
								   rs.getString("type"));
				break;
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return emoji;
	}
	public ResultSet getEmojiResultSet(String sql) {
		ResultSet rs=null;
		Emoji emoji=null;
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
