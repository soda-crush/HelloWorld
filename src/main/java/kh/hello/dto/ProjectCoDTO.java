package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectCoDTO {
	private int seq;
	private int projectSeq;
	private String writer;
	private String id;
	private String contents;
	private Timestamp writeDate;
	private String formedWriteDate;
	
	public ProjectCoDTO() {
		super();
	}
	public ProjectCoDTO(int seq, int projectSeq, String writer, String id, String contents, Timestamp writeDate,
			String formedWriteDate) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.writer = writer;
		this.id = id;
		this.contents = contents;
		this.writeDate = writeDate;
		this.formedWriteDate = formedWriteDate;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
		this.formedWriteDate = sdf.format(this.writeDate);
		return this.formedWriteDate;
	}
	public void setFormedWriteDate(Timestamp writeDate) {
		this.formedWriteDate = getFormedWriteDate();
	}
}
