package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.BambooDTO;

@Repository
public class BambooDAO {
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<BambooDTO> selectAll() {
		return jdbc.selectList("Bamboo.selectAll");
	}
}
