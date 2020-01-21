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
	
	public String getFormedPath() {
		String joinPath = this.joinPath;
		
		if(joinPath.equals("지인 추천")) {
			return joinPath;
		}else if(joinPath.equals("'Hello World!' 검색")) {
			return joinPath;
		}else if(joinPath.equals("'프로젝트 모집' 검색")) {
			return joinPath;
		}else {
			return "기타";
		}
	}
}
