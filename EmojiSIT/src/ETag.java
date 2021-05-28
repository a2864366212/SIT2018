public class ETag {
	private int etagid;
	private String etag;
	private int freq;
	

	public ETag(int etagid, String etag, int freq) {
		this.etagid = etagid;
		this.etag = etag;
		this.freq = freq;
	}
	

	public int getEtagid() {
		return etagid;
	}
	
	public void setEtagid(int etagid) {
		this.etagid = etagid;
	}
	public String getEtag() {
		return etag;
	}
	public void setEtag(String etag) {
		this.etag = etag;
	}
	public int getFreq() {
		return freq;
	}
	public void setFreq(int freq) {
		this.freq = freq;
	}
}
