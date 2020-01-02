package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectDTO {

	private int seq;
	private String title;
	private String contents;
	private String location1;
	private String location2;
	private int capacity;
	private Timestamp startDate;
	private Timestamp endDate;
	private String languages;
	private String phone;
	private String email;
	private String writer;
	private Timestamp writeDate;
	private String state;
	private int viewCount;
	private int commentCount;

	public ProjectDTO() {
		super();
	}	
	public ProjectDTO(int seq, String title, String contents, String location1, String location2, int capacity, Timestamp startDate,
			Timestamp endDate, String languages, String phone, String email, String writer, Timestamp writeDate,
			String state, int viewCount) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.location1 = location1;
		this.location2 = location2;
		this.capacity = capacity;
		this.startDate = startDate;
		this.endDate = endDate;
		this.languages = languages;
		this.phone = phone;
		this.email = email;
		this.writer = writer;
		this.writeDate = writeDate;
		this.state = state;
		this.viewCount = viewCount;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	
	public String getStateInKor() {
		String state = this.state;
		if(state.contentEquals("N")) {
			state = "모집중";
		}else if(state.contentEquals("Y")) {
			state = "모집마감";
		}
		return state;
	}
	
	public String getFormedAllDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.startDate)+" ~ "+sdf.format(this.endDate);
		return result;
	}
	
	public String getFormedWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String result = sdf.format(this.writeDate);
		return result;
	}
}
