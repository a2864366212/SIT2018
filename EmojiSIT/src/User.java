/**
 * User:用户信息实体
 * @author liku
 *	1. uid：用户id，自增主键
	2. email：用户邮箱 varchar(30),
	3. phone：用户手机号  varchar(20),
	4. pass：密码 varchar(20),
	5. username：用户名 varchar(20),
 */
public class User {
	private int uid;
	private String userName;
	private String email;
	private String phone;
	private String pass;
	User(){}
	User(int uid,String userName,String email,String phone,String pass){
		this.uid=uid;
		this.userName=userName;
		this.phone=phone;
		this.email=email;
		this.pass=pass;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
