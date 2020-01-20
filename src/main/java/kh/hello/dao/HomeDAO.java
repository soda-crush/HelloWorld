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
public class HomeDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<BambooDTO> getBamList(){
		return jdbc.selectList("Home.getBam");
	}
	
	public List<CodeQuestionDTO> getCodeList(){
		return jdbc.selectList("Home.getCode");
	}
	
	public List<IndustryStatusDTO> getIndusList(){
		return jdbc.selectList("Home.getIndus");
	}
	
	public List<ItnewsDTO> getItList(){
		return jdbc.selectList("Home.getIt");
	}
	
	public List<ProjectDTO> getProList(){
		return jdbc.selectList("Home.getPro");
	}
	
}
