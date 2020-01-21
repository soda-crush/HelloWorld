package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReportDTO {
	private int seq;
	private String state;
	private String boardName;
	private int boardSeq;
	private String title;
	private String reporterNick;
	private String reporterID;	
	private Timestamp reportDate;
	private String reason;
	private String result;
	public ReportDTO() {
		super();
	}
	public ReportDTO(int seq, String state, String boardName, int boardSeq, String title, String reporterNick, String reporterID,
			 Timestamp reportDate, String reason, String result) {
		super();
		this.seq = seq;
		this.state = state;
		this.boardName = boardName;
		this.boardSeq = boardSeq;
		this.title = title;
		this.reporterID = reporterID;
		this.reporterNick = reporterNick;
		this.reportDate = reportDate;
		this.reason = reason;
		this.result = result;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReporterID() {
		return reporterID;
	}
	public void setReporterID(String reporterID) {
		this.reporterID = reporterID;
	}
	public String getReporterNick() {
		return reporterNick;
	}
	public void setReporterNick(String reporterNick) {
		this.reporterNick = reporterNick;
	}
	public Timestamp getReportDate() {
		return reportDate;
	}
	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return sdf.format(this.reportDate);
	}
	
	public String getFormedResult() {
		String result = this.result;
		if(result == null) {
			return "";
		}
		
		if(result.equals("delete")) {
			return "삭제처리";
		}else if(result.contentEquals("noMatter")) {
			return "문제없음";
		}else if(result.contentEquals("noBoard")){
			return "이미 삭제된 글";
		}else {
			return "";
		}
	}
	
	public String getBoard() {
		String board = this.boardName;
		if(board.contentEquals("Bamboo")) {
			return "대나무숲";
		}else if(board.contentEquals("Cohow")){
			return "Code-How";
		}else if(board.contentEquals("Industry")){
			return "업계현황";
		}else if(board.contentEquals("Itnews")){
			return "IT뉴스";
		}else{
			return "프로젝트";
		}	
	}
	
	public String getFormedState() {
		String state = this.state;
		if(state.contentEquals("Y")) {
			return "처리완료";
		}else {
			return "대기중";
		}
	}
}
