/**
 * Emoji:表情图片实体
 * @author liku
 *     filePath:服务器端图片存储路径
 *	1. eid：表情图片id，自增主键
	2. caption：图片内容标识文本，varchar(50)
	3. etag：表情图片的属性信息
 */
public class Emoji {
	private String filePath;
	private String eid;
	private String caption;
	private String etag;
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	
}
