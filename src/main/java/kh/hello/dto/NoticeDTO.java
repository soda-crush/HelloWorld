package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {
	private int seq;
	private String title;
	private String content;
	private Timestamp writeDate;
	private int viewCount;
	private String nonTagContent;
	
	public NoticeDTO() {
		super();
	}

	
	public NoticeDTO(int seq, String title, String content, Timestamp writeDate, int viewCount, String nonTagContent) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
		this.nonTagContent = nonTagContent;
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


	public String getNonTagContent() {
		return nonTagContent;
	}


	public void setNonTagContent(String nonTagContent) {
		this.nonTagContent = nonTagContent;
	}


	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(writeDate);
	}
}
