package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectCoDTO {
	private int seq;
	private int projectSeq;
	private int depth;
	private int parentSeq;
	private String writer;
	private String id;
	private Timestamp writeDate;
	private Timestamp changeDate;
	private String contents;	
	private String profileImg;
	private String formedWriteDate;
	private String formedChangeDate;
	
	public ProjectCoDTO() {
		super();
	}	
	public ProjectCoDTO(int seq, int projectSeq, int depth, int parentSeq, String writer, String id,
			Timestamp writeDate, Timestamp changeDate, String contents) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.depth = depth;
		this.parentSeq = parentSeq;
		this.writer = writer;
		this.id = id;
		this.writeDate = writeDate;
		this.changeDate = changeDate;
		this.contents = contents;
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
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
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
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public Timestamp getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Timestamp changeDate) {
		this.changeDate = changeDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	public String getFormedWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		this.formedWriteDate = sdf.format(this.writeDate);
		return this.formedWriteDate;
	}
	public void setFormedWriteDate(Timestamp writeDate) {
		this.formedWriteDate = getFormedWriteDate();
	}
	public String getFormedChangeDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		this.formedChangeDate = sdf.format(this.changeDate);
		return this.formedChangeDate;
	}
	public void setFormedChangeDate(Timestamp changeDate) {
		this.formedChangeDate = getFormedChangeDate();
	}
	@Override
	public String toString() {
		return "ProjectCoDTO [seq=" + seq + ", projectSeq=" + projectSeq + ", depth=" + depth + ", parentSeq="
				+ parentSeq + ", writer=" + writer + ", id=" + id + ", writeDate=" + writeDate + ", changeDate="
				+ changeDate + ", contents=" + contents + ", formedWriteDate=" + formedWriteDate + ", formedChangeDate="
				+ formedChangeDate + "]";
	}

}
