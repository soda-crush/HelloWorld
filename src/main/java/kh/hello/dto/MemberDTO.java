package kh.hello.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String email;
	private String phone;
	private String postcode;
	private String addr1;
	private String addr2;
	private String joinPath;
	private String gender;
	private String memLevel;
	private String reportCount;
	private int point;
	private Timestamp joinDate;
	private Timestamp lastLogin;
	
	public MemberDTO() {
		super();
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", nickName=" + nickName + ", email=" + email
				+ ", phone=" + phone + ", postcode=" + postcode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", joinPath=" + joinPath + ", gender=" + gender + ", memLevel=" + memLevel + ", reportCount="
				+ reportCount + ", point=" + point + ", joinDate=" + joinDate + ", lastLogin=" + lastLogin + "]";
	}

	public MemberDTO(String id, String pw, String name, String nickName, String email, String phone, String postcode,
			String addr1, String addr2, String joinPath, String gender, String memLevel, String reportCount, int point,
			Timestamp joinDate, Timestamp lastLogin) {

		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.postcode = postcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.joinPath = joinPath;
		this.gender = gender;
		this.memLevel = memLevel;
		this.reportCount = reportCount;
		this.point = point;
		this.joinDate = joinDate;
		this.lastLogin = lastLogin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getJoinPath() {
		return joinPath;
	}
	public void setJoinPath(String joinPath) {
		this.joinPath = joinPath;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}
	public String getReportCount() {
		return reportCount;
	}
	public void setReportCount(String reportCount) {
		this.reportCount = reportCount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	public Timestamp getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Timestamp lastLogin) {
		this.lastLogin = lastLogin;
	}
	
}
