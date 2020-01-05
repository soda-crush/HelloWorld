package kh.hello.dto;

public class CertificationDTO {

	private String email;
	private String certificationCode;
	
	public CertificationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CertificationDTO(String email, String certificationCode) {
		super();
		this.email = email;
		this.certificationCode = certificationCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCertificationCode() {
		return certificationCode;
	}
	public void setCertificationCode(String certificationCode) {
		this.certificationCode = certificationCode;
	}
	
	
}
