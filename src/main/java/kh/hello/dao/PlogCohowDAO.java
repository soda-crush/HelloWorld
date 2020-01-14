package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;

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
	
	
	public List<CodeQuestionDTO> selectMyQuestionListByPage(String id, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("PlogCohow.selectMyQuestionListByPage",param);
	}
	
	public List<CodeQuestionDTO> selectMyReplyListByPage(String id, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("PlogCohow.selectMyReplyListByPage",param);
	}
	
	public int TotalCount (String id,String colum) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		if (colum == "Q") {
			param.put("colum", "codeQuestion");
		}else if(colum == "R") {
			param.put("colum", "codeReply");
		}
		return jdbc.selectOne("PlogCohow.TotalCount", param);
	}

}
