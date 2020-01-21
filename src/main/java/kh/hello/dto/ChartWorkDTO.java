package kh.hello.dto;

public class ChartWorkDTO {
	private String memLevel;
	private int levelCount;
	public ChartWorkDTO() {
		super();
	}
	public ChartWorkDTO(String memLevel, int levelCount) {
		super();
		this.memLevel = memLevel;
		this.levelCount = levelCount;
	}
	public String getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}

	public int getLevelCount() {
		return levelCount;
	}
	public void setLevelCount(int levelCount) {
		this.levelCount = levelCount;
	}
	
	public String getWorkStatus() {
		String memLevel = this.memLevel;
		
		if(memLevel.contentEquals("2")) {
			return "비재직자";
		}else if(memLevel.contentEquals("3")) {
			return "재직자";
		}else {
			return "알수없음";
		}
	}
	
	
}
