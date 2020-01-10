package kh.hello.dto;

public class ChartGenderDTO {
	private String gender;
	private int genderCount;
	public ChartGenderDTO() {
		super();
	}
	public ChartGenderDTO(String gender, int genderCount) {
		super();
		this.gender = gender;
		this.genderCount = genderCount;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getGenderCount() {
		return genderCount;
	}
	public void setGenderCount(int genderCount) {
		this.genderCount = genderCount;
	}
	
	
}
