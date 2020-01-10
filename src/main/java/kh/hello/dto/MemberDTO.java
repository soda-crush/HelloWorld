package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
	private int memLevel;
	private int reportCount;
	private int point;
	private String ifmOpenCheck;
	private Timestamp joinDate;
	private Timestamp lastLogin;
	private String profileImg;
	private Timestamp birth;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String id, String pw, String name, String nickName, String email, String phone, String postcode,
			String addr1, String addr2, String joinPath, String gender, int memLevel, int reportCount, int point,
			String ifmOpenCheck, Timestamp joinDate, Timestamp lastLogin, String profileImg, Timestamp birth) {
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
		this.ifmOpenCheck = ifmOpenCheck;
		this.joinDate = joinDate;
		this.lastLogin = lastLogin;
		this.profileImg = profileImg;
		this.birth = birth;
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

	public int getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getIfmOpenCheck() {
		return ifmOpenCheck;
	}

	public void setIfmOpenCheck(String ifmOpenCheck) {
		this.ifmOpenCheck = ifmOpenCheck;
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

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", nickName=" + nickName + ", email=" + email
				+ ", phone=" + phone + ", postcode=" + postcode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", joinPath=" + joinPath + ", gender=" + gender + ", memLevel=" + memLevel + ", reportCount="
				+ reportCount + ", point=" + point + ", ifmOpenCheck=" + ifmOpenCheck + ", joinDate=" + joinDate
				+ ", lastLogin=" + lastLogin + ", profileImg=" + profileImg + ", birth=" + birth + "]";
	}
	
	public String getFormedJoinDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(joinDate);
	}
	
	public String getFormedLastLogin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(lastLogin);		
	}
	
	public int getAge() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String today = sdf.format(System.currentTimeMillis());
		String birth = sdf.format(this.birth);
		int todayYear = Integer.parseInt(today);
		int birthYear = Integer.parseInt(birth);		
		return todayYear - birthYear + 1;
	}
	
	public String getFormedGender() {
		if(this.gender.contentEquals("W")) {
			return "여";
		}else {
			return "남";
		}
	}
}
