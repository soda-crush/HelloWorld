package kh.hello.dto;

import java.sql.Timestamp;

public class ProjectApplyDTO {
	private int seq;
	private int projectSeq;
	private String writer;
	private String id;
	private String languages;
	private String gender;
	private String age;
	private String workIn;
	private String email;
	private String etc;
	private Timestamp writeDate;
	private String approve;
	private String portfolio;
	private String title;
	private String leaderId;

	public ProjectApplyDTO() {
		super();
	}
	public ProjectApplyDTO(int seq, int projectSeq, String writer, String id, String languages, String gender,
			String age, String workIn, String email, String etc, Timestamp writeDate, String approve, String portfolio,
			String title, String leaderId) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.writer = writer;
		this.id = id;
		this.languages = languages;
		this.gender = gender;
		this.age = age;
		this.workIn = workIn;
		this.email = email;
		this.etc = etc;
		this.writeDate = writeDate;
		this.approve = approve;
		this.portfolio = portfolio;
		this.title = title;
		this.leaderId = leaderId;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getWorkIn() {
		return workIn;
	}
	public void setWorkIn(String workIn) {
		this.workIn = workIn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}	
	public String getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}	
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}
	
	
	public String getFormedAge() {
		String age = this.age;
		if(age.contentEquals("1")) {
			return "10대";
		}else if(age.contentEquals("2")) {
			return "20대";
		}else if(age.contentEquals("3")) {
			return "30대";
		}else if(age.contentEquals("4")) {
			return "40대 이상";
		}else {
			return "비공개";
		}
	}
	public String getGenderInKor() {
		String g = this.gender;
		if(g.contentEquals("F")) {
			return "여";
		}else if(g.contentEquals("M")) {
			return "남";
		}else {
			return "비공개";
		}
	}
	public String getWorkInInKor() {
		String w = this.workIn;
		if(w.contentEquals("Y")) {
			return "재직자";
		}else {
			return "비재직자";
		}
	}
	public String getPortfolioInKor() {
		String p = this.portfolio;
		if(p.contentEquals("Y")) {
			return "공개";
		}else {
			return "비공개";
		}
	}
	public String getApproveInKor() {
		String approve = this.approve;
		if(approve.contentEquals("W")) {
			return "대기중";
		}else if(approve.contentEquals("O")) {
			return "승인";
		}else if(approve.contentEquals("X")) {
			return "거절";
		}else if(approve.contentEquals("C")) {
			return "취소";
		}return approve;
	}
}
