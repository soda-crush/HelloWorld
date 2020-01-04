package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class InquiryDTO {
	private int seq;
	private String title;
	private String content;
	private String writer;
	private Timestamp writeDate;
	private int count;
	
	public InquiryDTO() {
		super();
	}
	
	public InquiryDTO(int seq, String title, String content, String writer, Timestamp writeDate, int count) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
		this.count = count;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return sdf.format(writeDate);
	}
}
