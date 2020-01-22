package kh.hello.dto;

public class OwnerInfoDTO {
	private String id;
	private String nickName;
	private String profileImg;
	private String other;
	public OwnerInfoDTO() {
		super();
	}
	public OwnerInfoDTO(String id, String nickName, String profileImg, String other) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.profileImg = profileImg;
		this.other = other;
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
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
	
	
}
