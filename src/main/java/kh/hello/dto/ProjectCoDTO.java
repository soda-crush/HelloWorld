package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectCoDTO {
	private int seq;
	private int projectSeq;
	private String writer;
	private String contents;
	private Timestamp writeDate;
	public ProjectCoDTO() {
		super();
	}
	public ProjectCoDTO(int seq, int projectSeq, String writer, String contents, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.writer = writer;
		this.contents = contents;
		this.writeDate = writeDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
	public String getFormedWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String result = sdf.format(this.writeDate);
		return result;
	}
}
