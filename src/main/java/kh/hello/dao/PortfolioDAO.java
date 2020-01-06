package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.PortfolioDTO;

@Repository
public class PortfolioDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void insertWrite(PortfolioDTO pdto) {
		jdbc.insert("Portfolio.insert", pdto);
	}
	
	public List<PortfolioDTO> selectList(String writer) {
		return jdbc.selectList("Portfolio.selectAll", writer);
	}
	
	public PortfolioDTO selectBySeq(int seq) {
		return jdbc.selectOne("Portfolio.selectBySeq", seq);
	}
	
	public void update(PortfolioDTO pdto) {
		jdbc.update("Portfolio.update", pdto);
	}
}
