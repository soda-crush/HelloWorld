package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.BambooDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectDTO;

@Repository
public class ScrapDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<IndustryStatusDTO> selectIndustryStatus(String id) {
		return jdbc.selectList("Scrap.selectIndustryStatus", id);
	}
	
	public List<CodeQuestionDTO> selectCodeQuestion(String id) {
		return jdbc.selectList("Scrap.selectCodeQuestion", id);
	}
	
	public List<ProjectDTO> selectProject(String id) {
		return jdbc.selectList("Scrap.selectProject", id);
	}
	
	public List<ItnewsDTO> selectItnews(String id) {
		return jdbc.selectList("Scrap.selectItnews", id);
	}
}
