package kh.hello.dto;

public class ChartGenerationDTO {
	private String generation;
	private int gCount;
		
	public ChartGenerationDTO() {
		super();
	}

	public ChartGenerationDTO(String generation, int gCount) {
		super();
		this.generation = generation;
		this.gCount = gCount;
	}

	public String getGeneration() {
		return generation;
	}

	public void setGeneration(String generation) {
		this.generation = generation;
	}

	public int getgCount() {
		return gCount;
	}

	public void setgCount(int gCount) {
		this.gCount = gCount;
	}
	
	
	
	
}
