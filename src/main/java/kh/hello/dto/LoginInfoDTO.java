package kh.hello.dto;

public class LoginInfoDTO {
	private String id;
	private String nickName;
	private int memLevel;
	
	public LoginInfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginInfoDTO(String id, String nickName, int memLevel) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.memLevel = memLevel;
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
	public int getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}
	@Override
	public String toString() {
		return "LoginInfoDTO [id=" + id + ", nickName=" + nickName + ", memLevel=" + memLevel + "]";
	}
	
}
