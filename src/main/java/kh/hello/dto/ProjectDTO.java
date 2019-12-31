package kh.hello.dto;

import java.sql.Timestamp;

public class ProjectDTO {

	private int seq;
	private String title;
	private String contents;
	private String location;
	private int capacity;
	private Timestamp startDate;
	private Timestamp endDate;
	private String languages;
	private String phone;
	private String email;
	private String writer;
	private Timestamp writeDate;
	private String state;
	
	public ProjectDTO() {
		super();
	}
	public ProjectDTO(int seq, String title, String contents, String location, int capacity, Timestamp startDate,
			Timestamp endDate, String languages, String phone, String email, String writer, Timestamp writeDate,
			String state) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.location = location;
		this.capacity = capacity;
		this.startDate = startDate;
		this.endDate = endDate;
		this.languages = languages;
		this.phone = phone;
		this.email = email;
		this.writer = writer;
		this.writeDate = writeDate;
		this.state = state;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	
	
}
