package kh.hello.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int validLogin(String adminId, String password) {
		Map<String, String> param = new HashMap<>();
		param.put("adminId", adminId);
		param.put("password", password);
		return jdbc.selectOne("Admin.validLogin", param);
	}
}
