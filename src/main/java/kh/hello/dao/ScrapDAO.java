package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectDTO;

@Repository
public class ScrapDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<IndustryStatusDTO> selectIndustryStatusByPage(String id, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Scrap.selectIndustryStatus",param);
	}
	
	public List<CodeQuestionDTO> selectCodeQuestionByPage(String id, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Scrap.selectCodeQuestion",param);
	}
	
	public List<ProjectDTO> selectProjectByPage(String id, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Scrap.selectProject",param);
	}
	
	public List<ItnewsDTO> selectItnewsByPage(String id,int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Scrap.selectItnews",param);
	}
	
	public int TotalCount (String id,String colum) {
		if(colum=="cohow") colum = "codeQuestion";
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("colum", colum);
		return jdbc.selectOne("Scrap.ScrapTotalCount", param);
	}
	
	
}
