package kh.hello.dto;

import java.sql.Timestamp;

public class CodeCommentsDTO {
	private int seq;
	private int repSeq;
	private String content;
	private String writer;
	private Timestamp writeDate;
	
	public CodeCommentsDTO() {
		super();
	}
	
	public CodeCommentsDTO(int seq, int repSeq, String content, String writer, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.repSeq = repSeq;
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
	public int getRepSeq() {
		return repSeq;
	}
	public void setRepSeq(int repSeq) {
		this.repSeq = repSeq;
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
	
}
