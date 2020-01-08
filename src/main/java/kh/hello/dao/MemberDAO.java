package kh.hello.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	//로그인
	public int login(String id, String pw){
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return jdbc.selectOne("Member.login", param);
	}
	
	//아이디 중복체크
	public int dupleCheck(String id){
		return jdbc.selectOne("Member.dupleCheck", id);
	}
	
	//닉네임 중복체크
	public int nickDupleCheck(String nickName){
		return jdbc.selectOne("Member.nickDupleCheck", nickName);
	}
	
	//연락처 중복체크
		public int phoneDupleCheck(String phone){
			return jdbc.selectOne("Member.phoneDupleCheck", phone);
		}
	
	//인증메일, 코드 디비 추가
		public int insertCtfCode(String email, String ctfCode){
			Map<String, String> param = new HashMap<>();
			param.put("email", email);
			param.put("certificationCode", ctfCode);
			return jdbc.insert("Member.insertCode", param);
		}
		
	//인증코드확인
		public int selectCtfCode(String email, String ctfCode){
			Map<String, String> param = new HashMap<>();
			param.put("email", email);
			param.put("certificationCode", ctfCode);
			return jdbc.selectOne("Member.selectCode", param);
		}
	//회원가입
		public int insertMember(MemberDTO dto) {
			return jdbc.insert("Member.insertMember", dto);
		}
	//최근 로그인 날짜 갱신
		public int updateLastLogin(String id) {
			return jdbc.update("Member.updateLastLogin", id);
		}

	//이름, 이메일에 해당하는 정보 있는지	
		public int selectEmail(String name, String email) {
			Map<String, String> param = new HashMap<>();
			param.put("name", name);
			param.put("email", email);
			return jdbc.selectOne("Member.selectEmailnName", param);
		}
	//가입전 이메일 있는지 확인
		public int selectEmailAlready(String email) {
			return jdbc.selectOne("Member.selectEmail", email);
		}
	//이메일로 아이디 찾기
		public String selectIdByEmail(String email) {
			return jdbc.selectOne("Member.selectIdByEmail", email);
		}	
	//비밀번호 변경
		public int modifyPw(String id, String pw) {
			Map<String, String> param = new HashMap<>();
			param.put("id", id);
			param.put("pw", pw);
			return jdbc.update("Member.modifyPw", param);
		}
	//포인트 적립
		public void getPoint(String id,int point) {
			Map<String, Object> param = new HashMap<>();
			param.put("id", id);
			param.put("point", point);
			jdbc.update("Member.getPoint", param);
		}
	//포인트 차감
		public void minusPoint(String id,int point) {
			Map<String, Object> param = new HashMap<>();
			param.put("id", id);
			param.put("point", point);
			jdbc.update("Member.minusPoint", param);
		}	
	//아이디로 DTO꺼내기
		public MemberDTO selectMember(String id) {
			return jdbc.selectOne("Member.selectMember", id);
		}
		
}
