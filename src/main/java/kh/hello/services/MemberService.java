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
		
	
		
}
