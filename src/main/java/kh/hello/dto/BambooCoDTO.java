package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BambooCoDTO {
	private int seq;
	private int bamSeq;
	private String writer;
	private String content;
	private Timestamp writeDate;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBamSeq() {
		return bamSeq;
	}
	public void setBamSeq(int bamSeq) {
		this.bamSeq = bamSeq;
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
	public BambooCoDTO(int seq, int bamSeq, String writer, String content, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.bamSeq = bamSeq;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
	}
	public BambooCoDTO() {
		super();
	}
	
	public String getFormedWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String result = sdf.format(this.writeDate);
		return result;
	}
	
	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
	
	
}
