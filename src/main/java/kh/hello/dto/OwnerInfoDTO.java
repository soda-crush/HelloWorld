package kh.hello.dto;

public class OwnerInfoDTO {
	private String id;
	private String nickName;
	private int point;
	public OwnerInfoDTO() {
		super();
	}
	public OwnerInfoDTO(String id, String nickName, int point) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
}
