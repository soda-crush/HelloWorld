package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.GuestBookDTO;

@Repository
public class GuestBookDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void insert(GuestBookDTO gdto) {
		jdbc.insert("GuestBook.insert", gdto );
	}
	
	public int TotalCount (String owner) {
		return jdbc.selectOne("GuestBook.guestBookTotalCount",owner);
	}
	
	public List<GuestBookDTO> selectListByPage(String owner, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("owner", owner);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("GuestBook.guestBookListByPage", param);
	}
	
	public void delete(int seq) {
		jdbc.delete("GuestBook.delete",seq);
	}
	
	public void update(GuestBookDTO gdto) {
		jdbc.update("GuestBook.update",gdto);
	}
	
	
	
	
	
}
