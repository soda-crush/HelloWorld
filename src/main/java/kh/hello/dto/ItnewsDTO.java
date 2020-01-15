package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ItnewsDTO {
	private int seq;
	private String writer;
	private String title;
	private String content;
	private Timestamp writeDate;
	private int viewCount;
	private String id;
	private int commentCount;
	
	public String getDate(){
	      long exDate = System.currentTimeMillis();
	      long processedWrite_date = writeDate.getTime();
	      long sec = (exDate - processedWrite_date)/1000;
	      int hour = (int)(sec/360.0) + 1;
	      
	      if(hour < 14) {
	    	  SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		         return sdf.format(processedWrite_date);
	      }else {
	    	  SimpleDateFormat sdf = new SimpleDateFormat("20yy.MM.dd");
		         return sdf.format(processedWrite_date);
	      }
	   }
	
	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}

	public ItnewsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItnewsDTO(int seq, String writer, String title, String content, Timestamp writeDate, int viewCount,
			String id, int commentCount) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
		this.id = id;
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "ItnewsDTO [seq=" + seq + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", writeDate=" + writeDate + ", viewCount=" + viewCount + ", id=" + id + ", commentCount="
				+ commentCount + "]";
	}

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
	
	
	
}
