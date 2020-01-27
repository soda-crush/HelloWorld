package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

public class IndustryStatusDTO {
	private int seq;
	private String field;
	private String duty;
	private String writer;
	private String title;
	private String content;
	private Timestamp writeDate;
	private int viewCount;
	private String id;
	private int commentCount;
	private String profileImg;
	private String kakaoTitle;
	private String nonTagContents;
	private String modTitle;

	public String getModTitle() {
		this.modTitle = this.title.replaceAll("\"","modF'Fdom");
		return this.modTitle;
	}
	public void setModComment(String title) {
		this.modTitle = getModTitle();
	}
	public String getNonTagContents() {
		return nonTagContents;
	}

	public void setNonTagContents(String nonTagContents) {
		this.nonTagContents = nonTagContents;
	}

	public String getKakaoTitle() {
		return kakaoTitle;
	}

	public void setKakaoTitle(String kakaoTitle) {
		this.kakaoTitle = kakaoTitle;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public IndustryStatusDTO() {
		super();
	}

	public IndustryStatusDTO(int seq, String field, String duty, String writer, String title, String content,
			Timestamp writeDate, int viewCount, String id) {
		super();
		this.seq = seq;
		this.field = field;
		this.duty = duty;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
		this.id = id;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public String getNewWriteDate() {
		LocalDateTime writeDate = this.getWriteDate().toLocalDateTime();
		int writeDay = writeDate.getDayOfMonth();
		
		LocalDateTime ldtDay = LocalDateTime.now();
		int nowDay = ldtDay.getDayOfMonth();
		if((nowDay-writeDay)<1) {
			return "N";
		}else {
			return null;
		}
	}
	public String getFormedWriteDate() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
//		String result = sdf.format(this.writeDate);
//		return result;
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
					if(nowHour-writeHour>=1) {
						return sdfTime.format(this.getWriteDate());
					}else {
						if(nowMin-writeMin>5) {
							return "1시간 이내";							
						}else {
							return "방금 전";
						}
					}
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
	
	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
}
