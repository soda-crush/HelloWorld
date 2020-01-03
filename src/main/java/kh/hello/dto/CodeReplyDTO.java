package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CodeReplyDTO {
	private int seq;
	private int queSeq;
	private String title;
	private String content;
	private String writer;
	private Timestamp writeDate;
	
	public CodeReplyDTO() {
		super();
	}
	
	public CodeReplyDTO(int seq, int queSeq, String title, String content, String writer, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.queSeq = queSeq;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.writeDate = writeDate;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getQueSeq() {
		return queSeq;
	}
	public void setQueSeq(int queSeq) {
		this.queSeq = queSeq;
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
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return sdf.format(writeDate);
	}
}
