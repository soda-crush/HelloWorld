package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

public class ProjectPLogDTO {
	private int seq;
	private int projectSeq;
	private String state;
	private String title;
	private String contents;
	private String writer;
	private String leaderId;
	private String location1;
	private String location2;
	private Timestamp startDate;
	private Timestamp endDate;
	private int capacity;	
	private String approve;
	private int commentCount;
	private int imageCount;
	private Timestamp writeDate;
	
	public ProjectPLogDTO() {
		super();
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}	
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
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
	public int getImageCount() {
		return imageCount;
	}
	public void setImageCount(int imageCount) {
		this.imageCount = imageCount;
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
			state = "마감";
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
	public String getFormedDate() {
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdfDay = new SimpleDateFormat("MM-dd");
		SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy-MM-dd");
		
		LocalDateTime writeDate = this.getWriteDate().toLocalDateTime();
		int writeYear = writeDate.getYear();
		int writeMonth = writeDate.getMonthValue();
		int writeDay = writeDate.getDayOfMonth();
		int writeHour = writeDate.getHour();
		int writeMin = writeDate.getMinute();

		LocalDateTime now = LocalDateTime.now();
		int nowYear = now.getYear();
		int nowMonth = now.getMonthValue();
		int nowDay = now.getDayOfMonth();
		int nowHour = now.getHour();
		int nowMin = now.getMinute();
		
		if(nowYear==writeYear) {
			if(nowMonth==writeMonth) {
				if(nowDay==writeDay) {
					if(nowHour==writeHour) {
						if(nowMin-writeMin<=1) {
							return "방금 전";							
						}
						return sdfTime.format(this.getWriteDate());
					}
					return sdfTime.format(this.getWriteDate());
				}else {
					return sdfDay.format(this.getWriteDate());
				}
			}else {
				return sdfDay.format(this.getWriteDate());
			}			
		}else {
			return sdfYear.format(this.getWriteDate());
		}	
	}
}
