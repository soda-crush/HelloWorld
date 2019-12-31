package kh.hello.dto;

import java.sql.Timestamp;

public class GuestBookDTO {
	private int seq;
	private String writer;
	private String content;
	private Timestamp writeDate;
	public GuestBookDTO() {
		super();
	}
	public GuestBookDTO(int seq, String writer, String content, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
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
}
