package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.HomeDAO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectDTO;

@Service
public class HomeService {

	@Autowired
	private HomeDAO dao;
	
	public List<BambooDTO> getBamList(){
		return dao.getBamList();
	}
	
	public List<CodeQuestionDTO> getCodeList(){
		return dao.getCodeList();
	}
	
	public List<IndustryStatusDTO> getIndusList(){
		return dao.getIndusList();
	}

	public List<ItnewsDTO> getITList(){
		return dao.getItList();
	}
	
	public List<ProjectDTO> getProList(){
		return dao.getProList();
	}
}
