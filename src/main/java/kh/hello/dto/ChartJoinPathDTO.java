package kh.hello.dto;

public class ChartJoinPathDTO {
	private String joinPath;
	private int pathCount;
	public ChartJoinPathDTO() {
		super();
	}
	public ChartJoinPathDTO(String joinPath, int pathCount) {
		super();
		this.joinPath = joinPath;
		this.pathCount = pathCount;
	}
	public String getJoinPath() {
		return joinPath;
	}
	public void setJoinPath(String joinPath) {
		this.joinPath = joinPath;
	}
	public int getPathCount() {
		return pathCount;
	}
	public void setPathCount(int pathCount) {
		this.pathCount = pathCount;
	}

}
