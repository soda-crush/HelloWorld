package kh.hello.dto;

public class ChartVisitChangeDTO {
	private String dateis;
	private int visitCount;
	public ChartVisitChangeDTO() {
		super();
	}
	public ChartVisitChangeDTO(String dateis, int visitCount) {
		super();
		this.dateis = dateis;
		this.visitCount = visitCount;
	}
	public String getDateis() {
		return dateis;
	}
	public void setDateis(String dateis) {
		this.dateis = dateis;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	
	
}
