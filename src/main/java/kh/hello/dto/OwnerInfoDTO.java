package kh.hello.dto;

public class OwnerInfoDTO {
	private String id;
	private String nickName;
	private String profileImg;
	private int point;
	
	public OwnerInfoDTO() {
		super();
	}
	public OwnerInfoDTO(String id, String nickName, String profileImg, int point) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.profileImg = profileImg;
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
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
