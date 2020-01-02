package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class InquiryReplyDTO {
	private int seq;
	private int boardSeq;
	private String reply;
	private Timestamp writeDate;
	public InquiryReplyDTO() {
		super();
	}
	public InquiryReplyDTO(int seq, int boardSeq, String reply, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.boardSeq = boardSeq;
		this.reply = reply;
		this.writeDate = writeDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
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
