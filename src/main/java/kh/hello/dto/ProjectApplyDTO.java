package kh.hello.dto;

import java.sql.Timestamp;

public class ProjectApplyDTO {
	private int seq;
	private int projectSeq;
	private String writer;
	private String languages;
	private String gender;
	private String age;
	private String workIn;
	private String email;
	private String etc;
	private Timestamp writeDate;
	private String approve;
	private int proceeding;
	
	public ProjectApplyDTO() {
		super();
	}
	public ProjectApplyDTO(int seq, int projectSeq, String writer, String languages, String gender, String age,
			String workIn, String email, String etc, Timestamp writeDate, String approve) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.writer = writer;
		this.languages = languages;
		this.gender = gender;
		this.age = age;
		this.workIn = workIn;
		this.email = email;
		this.etc = etc;
		this.writeDate = writeDate;
		this.approve = approve;
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
	public int getProceeding() {
		return proceeding;
	}
	public void setProceeding(int proceeding) {
		this.proceeding = proceeding;
	}
}
