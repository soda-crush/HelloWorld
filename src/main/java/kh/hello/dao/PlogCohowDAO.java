package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.CodeQuestionDTO;

@Repository
public class PlogCohowDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<CodeQuestionDTO> selectMyQuestion(String id){
		return jdbc.selectList("PlogCohow.selectMyQuestion", id);
	}

	public List<CodeQuestionDTO> selectMyReply(String id){
		return jdbc.selectList("PlogCohow.selectMyReply", id);
	}
	
}
