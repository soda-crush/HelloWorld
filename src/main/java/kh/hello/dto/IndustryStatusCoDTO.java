package kh.hello.dto;

import java.sql.Timestamp;

public class IndustryStatusCoDTO {
	private int seq;
	private int indSeq;
	private String writer;
	private String content;
	private Timestamp writeDate;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getIndSeq() {
		return indSeq;
	}
	public void setIndSeq(int indSeq) {
		this.indSeq = indSeq;
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
	public IndustryStatusCoDTO(int seq, int indSeq, String writer, String content, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.indSeq = indSeq;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
	}
	public IndustryStatusCoDTO() {
		super();
	}
	
}
