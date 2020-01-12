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
}
