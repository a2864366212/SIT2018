/**
 * User:用户信息实体
 * @author liku
 *	1. uid：用户id，自增主键
	2. email：用户邮箱 varchar(30),
	3. phone：用户手机号  varchar(20),
	4. pass：密码 varchar(20),
	5. username：用户名 varchar(20),
	6. age: 年龄 int
	7. sex: 性别 char(2)
 */
public class User {
	private int uid;
	private String userName;
	private String email;
	private String phone;
	private String pass;
	private int age;
	private String sex;
	User(){}
	User(int uid,String userName,String email,String phone,String pass,int age,String sex){
		this.uid=uid;
		this.userName=userName;
		this.phone=phone;
		this.email=email;
		this.pass=pass;
		this.age=age;
		this.sex=sex;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
}
