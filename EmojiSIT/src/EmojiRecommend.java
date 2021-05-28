

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class EmojiRecommend
 */
@WebServlet("/EmojiRecommend")
public class EmojiRecommend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmojiRecommend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,String>responseData=null;
		
		String renewTagCloudData=request.getParameter("renewTagCloudData");
		
		
		if(!Objects.isNull(renewTagCloudData)) {
			/*
			 *推荐页面请求获取标签云数据 
			 * */
			responseData=getTagFreq();
			
		}
		
		String userBehavior=request.getParameter("userBehavior");
		if(!Objects.isNull(userBehavior)){
			Logger logger=LogManager.getLogger(this.getClass().getName());
			JSONObject jsonObject=JSONObject.parseObject(userBehavior);
			logger.info(userBehavior);
		}
		
		String btn = request.getParameter("btn");
		if(!Objects.isNull(btn))
		{
			if(btn.equals("queryBtn"))
			{
				//推荐页面的请求推荐按钮 queryBtn   该按钮提交query表单 附带 查询文本与tagList
				String queryTxt=request.getParameter("queryTxt");//查询文本
				String queryTagList=request.getParameter("queryTagList");//查询的表情TagList
				responseData=recommend(queryTxt,queryTagList);
			}
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		String jsonOutput= JSON.toJSONString(responseData);
		out.print(jsonOutput);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected Map<String,String> getTagFreq(){
		String sql="select etag,freq from tb_etag";
		ETagDao eatagDao=new ETagDao();
		
		ResultSet rs=eatagDao.getETagResultSet(sql);
		Map<String,String>ETagData=new HashMap<String, String>();
		int j=0;
		try {
			while (rs.next()){
				ETagData.put("etag-"+Integer.toString(j),rs.getString("etag"));
				ETagData.put("freq-"+Integer.toString(j),Integer.toString(rs.getInt("freq")));
				
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
		eatagDao.close();
		ETagData.put("etagNum",Integer.toString(j));
		return ETagData;
		
	}
	protected Map<String,String> recommend(String queryTxt,String queryTagList){
		//目前实现为简单的在数据表中查询并返回 queryTxt匹配图片文本或是Tag匹配的图片
		String [] tagList = queryTagList.split("\\s+");//按空格分割queryTagList字符串
		
		//查询queryTxt匹配图片文本 的图片结果
		String sql="select eid,etag,caption,type from emoji where caption='"+queryTxt+"'";
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
		
		//查询Tag匹配的图片结果
		for(String tag:tagList)
		{
			sql="select eid,etag,caption,type from emoji where etag like '"+tag+"'";
			rs=emojiDao.getEmojiResultSet(sql);
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
}
