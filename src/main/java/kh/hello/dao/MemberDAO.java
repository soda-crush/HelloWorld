package kh.hello.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
