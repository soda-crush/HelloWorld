package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CodeCommentsDTO {
	private int seq;
	private int queSeq;
	private int repSeq;
	private String content;
	private String id;
	private String writer;
	private Timestamp writeDate;
	private String formedWriteDate;
	private String profileImg;
	
	public CodeCommentsDTO() {
		super();
	}

	public CodeCommentsDTO(int seq, int queSeq, int repSeq, String content, String id, String writer,
			Timestamp writeDate) {
		super();
		this.seq = seq;
		this.queSeq = queSeq;
		this.repSeq = repSeq;
		this.content = content;
		this.id = id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	public String getFormedWriteDate() {
		return formedWriteDate;
	}

	public void setFormedWriteDate(String formedWriteDate) {
		this.formedWriteDate = formedWriteDate;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return sdf.format(writeDate);
	}
	
	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "CodeCommentsDTO [seq=" + seq + ", queSeq=" + queSeq + ", repSeq=" + repSeq + ", content=" + content
				+ ", id=" + id + ", writer=" + writer + ", writeDate=" + writeDate + ", formedWriteDate="
				+ formedWriteDate + "]";
	}
	
	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
}
