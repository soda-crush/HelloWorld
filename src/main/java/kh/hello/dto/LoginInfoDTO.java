package kh.hello.dto;

public class LoginInfoDTO {
	private String id;
	private String nickName;
	
	public LoginInfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginInfoDTO(String id, String nickName) {
		super();
		this.id = id;
		this.nickName = nickName;
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

	@Override
	public String toString() {
		return "LoginInfoDTO [id=" + id + ", nickName=" + nickName + "]";
	}
	
	
}
