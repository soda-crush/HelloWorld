package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ItnewsCoDTO {
	private int seq;
	private int itSeq;
	private String writer;
	private String content;
	private Timestamp writeDate;
	private String id;
	private String profileImg;
	private String formedDate;
	
	
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		this.formedDate = sdf.format(this.writeDate);
		return this.formedDate;
	}
	public void setFormedDate(Timestamp writeDate) {
		this.formedDate = getFormedDate();
	}
	
	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}

	public ItnewsCoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItnewsCoDTO(int seq, int itSeq, String writer, String content, Timestamp writeDate, String id,
			String profileImg) {
		super();
		this.seq = seq;
		this.itSeq = itSeq;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
		this.id = id;
		this.profileImg = profileImg;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	@Override
	public String toString() {
		return "ItnewsCoDTO [seq=" + seq + ", itSeq=" + itSeq + ", writer=" + writer + ", content=" + content
				+ ", writeDate=" + writeDate + ", id=" + id + ", profileImg=" + profileImg + ", formedDate="
				+ formedDate + "]";
	}




	
}
