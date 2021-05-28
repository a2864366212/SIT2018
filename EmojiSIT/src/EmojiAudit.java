

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class EmojiAudit
 */
@WebServlet("/EmojiAudit")
public class EmojiAudit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 
     */
    public EmojiAudit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 审核emoji_raw数据表中的图片，通过审核的图片被转移到emoji数据表中
		 * */
		String btn=request.getParameter("btn");
		if(Objects.isNull(btn))return;
		Map<String,String>emojiData=null;
		if(btn.equals("getHolder")) {
			String maxEmojiNum=request.getParameter("maxEmojiNum");
			emojiData=getEmoji(maxEmojiNum);
		}
		if(btn.equals("delete")) {
			String uuid=request.getParameter("emojiUuid");
			String sql="delete from emoji_raw where eid='"+uuid+"'";
			EmojiDao emojiDao=new EmojiDao();
			int res=emojiDao.delete(sql);
			emojiData=new HashMap<String, String>();
			if(res>0) {
				emojiData.put("result-info","成功删除");
			}else {
				emojiData.put("result-info","删除失败");
			}
		}
		if(btn.equals("modify")) {
			EmojiDao emojiDao=new EmojiDao();
			String uuid=request.getParameter("emojiUuid");
			String caption=request.getParameter("caption");
			String tag=request.getParameter("tag");
			
			String selectSql="select * from emoji_raw where eid='"+uuid+"'";//取出原字段
			Emoji emoji=emojiDao.getEmoji(selectSql);
			
			String str = "INSERT INTO emoji ( eid,caption,etag,uploaddate,type ) VALUES ( '%s', '%s', '%s', '%s', '%s' )";
			String insertSql=String.format(str,
										emoji.getEid(),caption,tag,emoji.getUploaddate(),emoji.getType());
	        int res = -1;
	        res=emojiDao.add(insertSql);//审核完成，拼接修正后属性，插入emoji数据库，作为正式图源
			if(res>0) {//插入成功，则删除emoji_raw中的条目
				String deleteSql="delete from emoji_raw where eid='"+uuid+"'";//删除原字段
				emojiDao.delete(deleteSql);
			}
			
			emojiData=new HashMap<String, String>();
			if(res>0) {
				emojiData.put("result-info","修改成功");
			}else {
				emojiData.put("result-info","修改失败");
			}
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		String jsonOutput= JSON.toJSONString(emojiData);
		out.print(jsonOutput);
		out.flush();
		out.close();
	}
	protected Map<String,String> getEmoji(String maxEmojiNum){
		String sql="select eid,caption,etag,type from emoji_raw limit "+Integer.toString(new Random().nextInt(5))+","+maxEmojiNum;//从数据库中返回前X条数据
		EmojiDao emojiDao=new EmojiDao();
		ResultSet rs=emojiDao.getEmojiResultSet(sql);
		Map<String,String>emojiData=new HashMap<String, String>();
		int j=0;
		try {
			while (rs.next()){
				emojiData.put("emoji-"+Integer.toString(j),rs.getString("eid")+"."+rs.getString("type"));
				emojiData.put("caption-"+Integer.toString(j),rs.getString("caption"));
				emojiData.put("tag-"+Integer.toString(j),rs.getString("etag"));
				
				j++;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		emojiDao.close();
		emojiData.put("emojiNum",Integer.toString(j));
		return emojiData;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
