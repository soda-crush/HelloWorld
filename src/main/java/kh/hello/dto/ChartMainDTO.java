package kh.hello.dto;

public class ChartMainDTO {

	private int today;
	private int total;
	public ChartMainDTO() {
		super();
	}
	public ChartMainDTO(int today, int total) {
		super();
		this.today = today;
		this.total = total;
	}
	public int getToday() {
		return today;
	}
	public void setToday(int today) {
		this.today = today;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
