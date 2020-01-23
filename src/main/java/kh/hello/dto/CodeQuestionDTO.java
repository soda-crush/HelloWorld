package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

public class CodeQuestionDTO {
	private int seq;
	private String division;
	private String title;
	private String content;
	private String id;
	private String writer;
	private int point;
	private int viewCount;
	private Timestamp writeDate;
	private int replyCount;
	private String profileImg;
	private String kakaoTitle;

	public CodeQuestionDTO() {
		super();
	}

	public CodeQuestionDTO(int seq, String division, String title, String content, String id, String writer, int point,
			int viewCount, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.division = division;
		this.title = title;
		this.content = content;
		this.id = id;
		this.writer = writer;
		this.point = point;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	public String getKakaoTitle() {
		return kakaoTitle;
	}

	public void setKakaoTitle(String kakaoTitle) {
		this.kakaoTitle = kakaoTitle;
	}

	//New 하루이내 표시 
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

	public String getFormedDate() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
//		return sdf.format(writeDate);
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
						}
						else if(nowMin-writeMin>120) {
							return "하루 전";
						}
						else {
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
	public String getscrapDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(writeDate);
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int repCount) {
		this.replyCount = repCount;
	}

	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
}
