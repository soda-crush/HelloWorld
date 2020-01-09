package kh.hello.dto;

public class ItnewsImgDTO {
	private int seq;
	private  int itSeq;
	private String oriName;
	private String sysName;
	
	public ItnewsImgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItnewsImgDTO(int seq, int boardSeq, String oriName, String sysname) {
		super();
		this.seq = seq;
		this.itSeq = boardSeq;
		this.oriName = oriName;
		this.sysName = sysname;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getBoardSeq() {
		return itSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.itSeq = boardSeq;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSysname() {
		return sysName;
	}

	public void setSysname(String sysname) {
		this.sysName = sysname;
	}

	@Override
	public String toString() {
		return "ItnewsImgDTO [seq=" + seq + ", boardSeq=" + itSeq + ", oriName=" + oriName + ", sysname=" + sysName
				+ "]";
	}
	
}
