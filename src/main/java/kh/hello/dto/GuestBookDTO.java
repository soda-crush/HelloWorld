package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class GuestBookDTO {
	private int seq;
	private String ownerID;
	private String owner;
	private String writerID;
	private String writer;
	private String content;
	private Timestamp writeDate;
	
	public String getDate(){
	      long exDate = System.currentTimeMillis();
	      long processedWrite_date = writeDate.getTime();
	      long sec = (exDate - processedWrite_date)/1000;
	      int hour = (int)(sec/360.0) + 1;
	      
	      if(hour < 24) {
	    	  SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
		      return sdf.format(processedWrite_date);
	      }else {
	         SimpleDateFormat sdf = new SimpleDateFormat("20yy-MM-dd");
	         return sdf.format(processedWrite_date);
	      }
	}

	public GuestBookDTO(int seq, String ownerID, String owner, String writerID, String writer, String content,
			Timestamp writeDate) {
		super();
		this.seq = seq;
		this.ownerID = ownerID;
		this.owner = owner;
		this.writerID = writerID;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
	}
	public GuestBookDTO() {
		super();
	}
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(String ownerID) {
		this.ownerID = ownerID;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getWriterID() {
		return writerID;
	}

	public void setWriterID(String writerID) {
		this.writerID = writerID;
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


	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
	
}
