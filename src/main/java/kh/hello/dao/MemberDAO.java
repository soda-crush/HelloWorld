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
	public int login(String id, String pw)throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return jdbc.selectOne("Member.login", param);
	}
	
	//아이디 중복체크
	public int dupleCheck(String id)throws Exception{
		return jdbc.selectOne("Member.dupleCheck", id);
	}
	
	//닉네임 중복체크
	public int nickDupleCheck(String nickName)throws Exception{
		return jdbc.selectOne("Member.nickDupleCheck", nickName);
	}
	
	//연락처 중복체크
		public int phoneDupleCheck(String phone)throws Exception{
			return jdbc.selectOne("Member.phoneDupleCheck", phone);
		}
	
}
