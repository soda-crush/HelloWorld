package kh.hello.services;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.hello.dao.MemberDAO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//로그인
	public int login(String id, String pw){
		return mdao.login(id, pw);
	}
	
	//아이디 중복체크
	public int dupleCheck(String id){
		return mdao.dupleCheck(id);
	}
	
	//닉네임 중복체크
	public int nickDupleCheck(String nickName){
		return mdao.nickDupleCheck(nickName);
	}
	
	//연락처 중복체크
		public int phoneDupleCheck(String phone){
			return mdao.phoneDupleCheck(phone);
		}
		
	//인증메일, 코드 디비 추가
		public int insertCtfCode(String email, String ctfCode){
			return mdao.insertCtfCode(email, ctfCode);
		}
		
	//인증코드 확인
		public int confirmCode(String email, String code){
			return mdao.selectCtfCode(email, code);
		}
		
	//메일 전송
		public String mailSending(String email){
			try {
				String ctfCode = "0000"; 
				 
			    String setfrom = "sohyunKH4862@gmail.com";         
			    String tomail  = email;     // 받는 사람 이메일
			    String title   = "[Hello World!] This is your verification code.";      // 제목
			    String content = "Please enter this code : ";    // 내용
			  
			    
			    	//디비에 이메일이랑 인증코드 저장
				    this.insertCtfCode(email, ctfCode);
				 
				    	 MimeMessage message = mailSender.createMimeMessage();
					      MimeMessageHelper messageHelper 
					                        = new MimeMessageHelper(message, true, "UTF-8");
					      
					      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
					      messageHelper.setTo(tomail);     // 받는사람 이메일
					      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
					      messageHelper.setText(content);  // 메일 내용
					     
					      mailSender.send(message);

						  return "send";
			}catch(Exception e) {
				System.out.println("메일 오류");
				e.printStackTrace();
				return "WEB-INF/views/error.jsp";
			}
			
		}
	
}
