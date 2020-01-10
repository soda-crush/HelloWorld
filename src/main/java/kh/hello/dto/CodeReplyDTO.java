package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CodeReplyDTO {
	private int seq;
	private int queSeq;
	private String title;
	private String content;
	private String id;
	private String writer;
	private Timestamp writeDate;
	private String adopt;
	
	public CodeReplyDTO() {
		super();
	}

	public CodeReplyDTO(int seq, int queSeq, String title, String content, String id, String writer,
			Timestamp writeDate, String adopt) {
		super();
		this.seq = seq;
		this.queSeq = queSeq;
		this.title = title;
		this.content = content;
		this.id = id;
		this.writer = writer;
		this.writeDate = writeDate;
		this.adopt = adopt;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getAdopt() {
		return adopt;
	}
	public void setAdopt(String adopt) {
		this.adopt = adopt;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return sdf.format(writeDate);
	}
	
	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
	
}
