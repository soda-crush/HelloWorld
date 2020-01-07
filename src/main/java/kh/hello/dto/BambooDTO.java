package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BambooDTO {
	private int seq;
	private String writer;
	private String title;
	private String content;
	private Timestamp writeDate;
	private int viewCount;
	private int commentCount;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public BambooDTO(int seq, String writer, String title, String content, Timestamp writeDate, int viewCount) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
	}
	public BambooDTO() {
		super();
	}
	
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	public String getFormedWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String result = sdf.format(this.writeDate);
		return result;
	}
	
	public String getFormedDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
	@Override
	public String toString() {
		return "BambooDTO [seq=" + seq + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", writeDate=" + writeDate + ", viewCount=" + viewCount + ", commentCount=" + commentCount + "]";
	}
	
	
}
