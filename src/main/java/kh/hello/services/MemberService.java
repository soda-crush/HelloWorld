package kh.hello.services;

import java.sql.Timestamp;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.hello.dao.MemberDAO;
import kh.hello.dto.MemberDTO;
import kh.hello.utils.Utils;

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
		
	//회원가입
		public int signUp(MemberDTO mdto, String empCheck, String empEmail, String unempEmail 
				,String otherJoinPath, Timestamp startDate) {
			
			//이메일 설정
			if(empCheck.contentEquals("employee")){
				mdto.setEmail(empEmail);
				mdto.setMemLevel(3);
			}else {
				mdto.setEmail(unempEmail);
				mdto.setMemLevel(2);
			}
			//가입경로 설정
			if(mdto.getJoinPath().contentEquals("jp1")) {
				mdto.setJoinPath("지인 추천");
			}else if(mdto.getJoinPath().contentEquals("jp2")) {
				mdto.setJoinPath("'Hello World!' 검색");
			}else if(mdto.getJoinPath().contentEquals("jp3")) {
				mdto.setJoinPath("'프로젝트 모집' 검색");
			}else{
				mdto.setJoinPath(otherJoinPath);
			}
			//기본설정
			mdto.setReportCount(0);
			mdto.setPoint(1000);
			mdto.setProfileImg("/img/profile" + Utils.getRandomNum(1, 5) + ".jpg");
			mdto.setBirth(startDate);
			
			return mdao.insertMember(mdto);
			
		}
		
	//로그인시 최근 로그인 날짜 갱신
		public int updateLastLogin(String id) {
			return mdao.updateLastLogin(id);
		}
		
	//이름, 이메일에 해당하는 정보 있는지
		public int isEmailExist(String name, String email) {
			return mdao.selectEmail(name, email);
		}
	//가입전 이메일 있는지 확인
		public int isEmailALready(String email) {
			return mdao.selectEmailAlready(email);
		}
	//이메일로 아이디 찾기
		public String selectIdByEmail(String email) {
			return mdao.selectIdByEmail(email);
		}
	//비밀번호 변경
		public int modifyPw(String id, String pw) {
			return mdao.modifyPw(id, pw);
		}
	//아이디로 DTO꺼내기
		public MemberDTO selectMember(String id) {
			return mdao.selectMember(id);
		}
}
