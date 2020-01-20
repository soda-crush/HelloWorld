package kh.hello.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProjectDTO {

	private int seq;
	private String title;
	private String contents;
	private String location1;
	private String location2;
	private int capacity;
	private Date startDate;
	private Date endDate;
	private String languages;
	private String phone;
	private String email;
	private String writer;
	private String id;
	private Timestamp writeDate;
	private String state;
	private int viewCount;
	private int commentCount;
	private int applyCount;
	private int scrap;
	private Timestamp changeDate;
	private int totalApply;
	private int totalApprove;
	private String profileImg;
	
	public ProjectDTO() {
		super();
	}	
	public ProjectDTO(int seq, String title, String contents, String location1, String location2, int capacity,
			Date startDate, Date endDate, String languages, String phone, String email, String writer, String id,
			Timestamp writeDate, String state, int viewCount, int commentCount, int applyCount, int scrap,
			Timestamp changeDate, int totalApply, int totalApprove, String profileImg) {
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
		this.id = id;
		this.writeDate = writeDate;
		this.state = state;
		this.viewCount = viewCount;
		this.commentCount = commentCount;
		this.applyCount = applyCount;
		this.scrap = scrap;
		this.changeDate = changeDate;
		this.totalApply = totalApply;
		this.totalApprove = totalApprove;
		this.profileImg = profileImg;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}
	public int getScrap() {
		return scrap;
	}
	public void setScrap(int scrap) {
		this.scrap = scrap;
	}
	public Timestamp getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Timestamp changeDate) {
		this.changeDate = changeDate;
	}
	public int getTotalApply() {
		return totalApply;
	}
	public void setTotalApply(int totalApply) {
		this.totalApply = totalApply;
	}
	public int getTotalApprove() {
		return totalApprove;
	}
	public void setTotalApprove(int totalApprove) {
		this.totalApprove = totalApprove;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
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
	public String getFormedCalStartDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.startDate);
	}
	public String getFormedCalEndDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.endDate);
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

	public List<String> getSplitLanguage(){
		String languages = this.languages;
		String[] array = languages.split(",");
		List<String> result = new ArrayList<>();
		for(String tmp : array) {
			result.add(tmp);
		}
		return result;
	}
}
