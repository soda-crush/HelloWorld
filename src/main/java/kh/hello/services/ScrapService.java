package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.ScrapDAO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectDTO;

@Service
public class ScrapService {

	@Autowired
	private ScrapDAO sdao;
	
	public List<IndustryStatusDTO> selectIndustryStatus(String id) {
		return sdao.selectIndustryStatus(id);
	}
	
	public List<CodeQuestionDTO> selectCodeQuestion(String id) {
		return sdao.selectCodeQuestion(id);
	}
	
	public List<ProjectDTO> selectProject(String id) {
		return sdao.selectProject(id);
	}
	
	public List<ItnewsDTO> selectItnews(String id) {
		return sdao.selectItnews(id);
	}
	
}
