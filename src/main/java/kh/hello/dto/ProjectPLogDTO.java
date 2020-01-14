package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectPLogDTO {
	private int seq;
	private int projectSeq;
	private String state;
	private String title;
	private String writer;
	private String location1;
	private String location2;
	private Timestamp startDate;
	private Timestamp endDate;
	private int capacity;	
	private String approve;
	private int commentCount;
	private Timestamp writeDate;
	
	public ProjectPLogDTO() {
		super();
	}
	public ProjectPLogDTO(int seq, int projectSeq, String state, String title, String writer, String location1,
			String location2, Timestamp startDate, Timestamp endDate, int capacity, String approve, int commentCount,
			Timestamp writeDate) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.state = state;
		this.title = title;
		this.writer = writer;
		this.location1 = location1;
		this.location2 = location2;
		this.startDate = startDate;
		this.endDate = endDate;
		this.capacity = capacity;
		this.approve = approve;
		this.commentCount = commentCount;
		this.writeDate = writeDate;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
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
		return sdf.format(this.startDate)+" ~ "+sdf.format(this.endDate);
	}
	
	public String getFormedWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(this.writeDate);		
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
