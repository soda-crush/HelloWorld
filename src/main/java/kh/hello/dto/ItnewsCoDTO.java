package kh.hello.dto;

import java.sql.Timestamp;

public class ItnewsCoDTO {
	private int seq;
	private int itSeq;
	private String writer;
	private String content;
	private Timestamp writeDate;
	public ItnewsCoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ItnewsCoDTO(int seq, int itSeq, String writer, String content, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.itSeq = itSeq;
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
	public int getItSeq() {
		return itSeq;
	}
	public void setItSeq(int itSeq) {
		this.itSeq = itSeq;
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
	@Override
	public String toString() {
		return "ItnewsCoDTO [seq=" + seq + ", itSeq=" + itSeq + ", writer=" + writer + ", content=" + content
				+ ", writeDate=" + writeDate + "]";
	}
	
	
}
