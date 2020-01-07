package kh.hello.dto;

public class ProjectImageDTO {
	private int seq;
	private int projectSeq;
	private String oriName;
	private String sysName;
	public ProjectImageDTO() {
		super();
	}
	public ProjectImageDTO(int seq, int projectSeq, String oriName, String sysName) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.oriName = oriName;
		this.sysName = sysName;
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
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	
}
