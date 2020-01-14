package kh.hello.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CountDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public void plusVisitCount(){
		jdbc.insert("Count.plusVisitCount");
	}
		
	public int getVisitTotalCount(){
		return jdbc.selectOne("Count.getVisitTotalCount");
	}
	
	public int getVisitTodayCount(){
		return jdbc.selectOne("Count.getVisitTodayCount");
	}
	
	public int newBoard() {
		return jdbc.insert("Count.newBoard");
	}
	
	public int delBoard() {
		return jdbc.insert("Count.delBoard");
	}
	
	public int newCo() {
		return jdbc.insert("Count.newCo");
	}
	
	public int delCo() {
		return jdbc.insert("Count.delCo");
	}
}
