package kh.hello.services;

import java.sql.Timestamp;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

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
		
	//회원가입
		public int signUp(MemberDTO mdto, String empCheck, String empEmail, String unempEmail 
				,String otherJoinPath, Timestamp birthDate) {
			System.out.println(mdto);
			//스크립트 공격 방지
			mdto.setAddr2(Utils.protectXss(mdto.getAddr2()));
			
			//이메일 설정
			if(empCheck.contentEquals("employee")){
				mdto.setEmail(Utils.protectXss(empEmail));
				mdto.setMemLevel(3);
			}else {
				mdto.setEmail(Utils.protectXss(unempEmail));
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
				//스크립트 공격 방지
				mdto.setJoinPath(Utils.protectXss(otherJoinPath));
			}
			//기본설정
			mdto.setReportCount(0);
			mdto.setPoint(1000);
			mdto.setProfileImg("/img/profile" + Utils.getRandomNum(1, 11) + ".png");
			mdto.setBirth(birthDate);
			
			return mdao.insertMember(mdto);
		}
		
		//정보수정
				public int modify(MemberDTO mdto, String empCheck, String empEmail, String unempEmail 
						,String otherJoinPath, Timestamp birthDate, String demotionMail) {
					//pw* / name* / nickName* / email* / phone* / postcode* / addr1* / addr2* / joinPath* / 
					//gender* / memLevel / Reportcount / point / ifmOpenCheck* / jD / ll / img / birth*
					//스크립트 공격방지
					mdto.setAddr2(Utils.protectXss(mdto.getAddr2()));
					
					//이메일 설정
					if(empCheck.contentEquals("employee")){
						mdto.setEmail(empEmail);
						mdto.setMemLevel(3);
					}else if(empCheck.contentEquals("demotion")) {
						mdto.setEmail(demotionMail);
						mdto.setMemLevel(1);
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
						mdto.setJoinPath(Utils.protectXss(otherJoinPath));
					}
					//기본설정
					mdto.setReportCount(0);
					mdto.setPoint(1000);
					mdto.setProfileImg("/img/profile" + Utils.getRandomNum(1, 5) + ".jpg");
					mdto.setBirth(birthDate);
					
					return mdao.modifyMember(mdto);
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
		
	//탈퇴전 비번 체크
		public String withdrawalCheck(String id, String pw) {
			int result = mdao.withdrawalCheck(id, pw);
			if(result > 0) {
				int memLevel = mdao.selectMember(id).getMemLevel();
				int result2 = -1;
				if(memLevel == 1) {
					result2 = mdao.withdrawalMem1(id);
				}else {
					result2 = mdao.withdrawal(id);
				}
				if(result2 > 0) {
					return "success";
				}else {
					return "fail";
				}
			}else {
				//비번 틀림
				return "notEquals";
			}
			
			
		}
		
		//회원가입 메일인증 
		  public String mailSending(String email) throws Exception{
			String ctfCode = Utils.getRandomCode();
			String setfrom = "sohyunKH4862@gmail.com";         
			String tomail  = email;     // 받는 사람 이메일
			String title   = "[Hello World!] 회원가입 메인 인증 코드입니다.";      // 제목
			String content = "해당코드를 입력창에 입력해주세요 : " + ctfCode;    // 내용
					  
					    
			//디비에 이메일이랑 인증코드 저장
			this.insertCtfCode(email, ctfCode);
						 
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper 
							= new MimeMessageHelper(message, true, "UTF-8");
							      
			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);     // 받는사람 이메일
			messageHelper.setSubject(MimeUtility.encodeText(title, "UTF-8", "B")); // 메일제목은 생략이 가능하다
			message.setContent(content, "text/html;charset=utf-8");  // 메일 내용
							     
			mailSender.send(message);

			return "send";
		  }	
		
		//아이디 찾기 메인인증
		  public String idFindmailSending(String name, String email) { //아이디 찾기
				 int result = this.isEmailExist(name, email);
				 if(result > 0){
					 try {
							String ctfCode = Utils.getRandomCode();
						    String setfrom = "sohyunKH4862@gmail.com";         
						    String tomail  = email;     // 받는 사람 이메일
						    String title   = "[Hello World!]  아이디/비밀번호 찾기 메인 인증 코드입니다.";      // 제목
						    String content = "해당코드를 입력창에 입력해주세요 : " + ctfCode;    // 내용
						  
						    
						    	//디비에 이메일이랑 인증코드 저장
							    this.insertCtfCode(email, ctfCode);
							 
							    	 MimeMessage message = mailSender.createMimeMessage();
								      MimeMessageHelper messageHelper 
								                        = new MimeMessageHelper(message, true, "UTF-8");
								      
								      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
								      messageHelper.setTo(tomail);     // 받는사람 이메일
								      messageHelper.setSubject(MimeUtility.encodeText(title, "UTF-8", "B")); // 메일제목은 생략이 가능하다
								      message.setContent(content, "text/html; charset=utf-8");  // 메일 내용
								     
								      mailSender.send(message);

									  return "send";
						}catch(Exception e) {
							e.printStackTrace();
							return "에러";
						}
				 }else {
					 return "false";
				 }
			}
		
}
