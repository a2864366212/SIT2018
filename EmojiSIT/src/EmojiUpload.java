

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Objects;
import java.util.UUID;


import org.apache.commons.fileupload.FileItem; 
import org.apache.commons.fileupload.disk.DiskFileItemFactory; 
import org.apache.commons.fileupload.servlet.ServletFileUpload; 

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class EmojiUpload
 */
@WebServlet("/EmojiUpload")
public class EmojiUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String[] IMAGE_TYPE = new String[] {".bmp",".jpeg",".jpg",".gif",".png"};
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmojiUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String>uploadData=null;
		try {
			uploadData=reciveImageAndParams(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		EmojiDao emojiDao=new EmojiDao();
		int emojiNum=Integer.parseInt(uploadData.get("emojiNum"));
		//{caption-idx,tag-idx,uuid-idx,type-idx}
		for (int i=0;i<emojiNum;i++) {
			String idx= Integer.toString(i);
			//String []keyArr={"caption-"+idx,"tag-"+idx,"uuid-"+idx,"type-"+idx};
			
			String eid=uploadData.get("uuid-"+idx);
			String caption=uploadData.get("caption-"+idx);
			String etag=uploadData.get("tag-"+idx);
			/*
			boolean review,
			int uid*/
			java.util.Date currentTime = new java.util.Date();
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    String uploaddate = formatter.format(currentTime);
			
			String type=uploadData.get("type-"+idx);
			
			String str = "INSERT INTO emoji ( eid,caption,etag,uploaddate,type ) VALUES ( '%s', '%s', '%s', '%s', '%s' )";
			String sql=String.format(str,
										eid,caption,etag,uploaddate,type);
	        int res = -1;
	        
	        res=emojiDao.add(sql);
		        
	    }
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String jsonOutput= JSON.toJSONString(uploadData);
		out.print(jsonOutput);
		out.flush();
		out.close();
		emojiDao.close();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	public Map<String, String> reciveImageAndParams(HttpServletRequest request) throws Exception {
		Map<String, String> data = new HashMap<String, String>();
		String tempPathDir = "";
		File tempPathDirFile = new File(tempPathDir);
		
		// 创建工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置缓冲区大小，这里是400kb
		factory.setSizeThreshold(4096 * 100);
		// 设置缓冲区目录
		factory.setRepository(tempPathDirFile);
		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置上传文件的大小 12M
		upload.setSizeMax(4194304 * 3);
		// 创建解析器
		// 得到所有的文件
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> i = items.iterator();
		//图片地址拼接
		StringBuffer buf=new StringBuffer();
		//String img_urls="";
		while (i.hasNext()) {
			FileItem fi = i.next();
			// false表示文件 否则字段
			if (!fi.isFormField()) {
				String fileName = fi.getName();
				if (fileName != null) {
					// 如果不是图片格式，则提示错误. (gif,jpg,jpeg,bmp,png)
					String suffixName = fileName.substring(fileName.lastIndexOf(".") + 1);
					if ("jpg".equalsIgnoreCase(suffixName) || "jpeg".equalsIgnoreCase(suffixName)
							|| "png".equalsIgnoreCase(suffixName) || "gif".equalsIgnoreCase(suffixName)) {
						//生成uuid图片名，防止重复
						String uuid=UUID.randomUUID().toString();
						String imageName = uuid+"." + suffixName;
						ConfUtil cf = new ConfUtil();
						String imgPath = cf.getConfig("/imgconfig.properties", "emojiPhyPath") + imageName;//服务器 图片物理存储地址
						//图片地址拼接，映射相对地址
						//String img_url=cf.getConfig("/imgconfig.properties", "emojiUrl") + imageName;
						
						String fieldName=fi.getFieldName();
						String emojiIdx=fieldName.substring(fieldName.lastIndexOf("-")+1);
						
						data.put("type-"+emojiIdx,
								suffixName);
						data.put("uuid-"+emojiIdx,
								uuid);
						
						// 定义图片流
						InputStream fin = fi.getInputStream();
						// 定义图片输出流
						FileOutputStream fout = new FileOutputStream(imgPath);
						// 写文件
						byte[] b = new byte[1024];
						int length = 0;
						while ((length = fin.read(b)) > 0) {
							fout.write(b, 0, length);//写入物理存储空间
						}
						// 关闭数据流
						fin.close();
						fout.close();

					} else {
						// throw new ProcureException("文件格式不正确");
					}
				}
			} else {//普通字段数据
				//fi.getString("UTF-8");
				System.out.println(fi.getFieldName());
				System.out.println(fi.getString("UTF-8"));
				data.put(new String(fi.getFieldName()),
						new String(fi.getString("UTF-8")));
			}
		}
		
		
		return data;

	}

}
