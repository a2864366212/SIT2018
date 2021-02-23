import java.sql.Date;

/**
 * Emoji:表情图片实体
 * @author liku
 *	
 *  1. eid：表情图片id，uuid前端生成，也即图片文件名
	2. caption：图片内容标识文本，varchar(50)
	3. etag：表情图片的属性信息，varchar(50)
	4. review：BOOLEAN，审核位，为1则为已经审核过的图片
	5. uploaddate：上传日期，DATE类型
	6. uid：上传用户id
	7. type：表情图片类型，"jpg" 、"jpeg"、 "png"等
 *
 */
public class Emoji {
	private String eid;
	private String caption;
	private String etag;
	private Date uploaddate;
	private int uid;
	private String type;
	Emoji(){}
	Emoji(String eid,String caption,String etag,Date uploaddate,int uid
			,String type){
		this.eid=eid;
		this.caption=caption;
		this.etag=etag;
		this.uploaddate=uploaddate;
		this.uid=uid;
		this.type=type;
	}
	
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getEtag() {
		return etag;
	}
	public void setEtag(String etag) {
		this.etag = etag;
	}
	public Date getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
