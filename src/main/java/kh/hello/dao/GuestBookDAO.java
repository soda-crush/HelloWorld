package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.GuestBookDTO;

@Repository
public class GuestBookDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void insertWrite(GuestBookDTO gdto) {
		jdbc.insert("GuestBook/insert", gdto );
	}
	public List<GuestBookDTO> selectList() {
		return jdbc.selectList("GuestBook.selectAll");
	}
}
