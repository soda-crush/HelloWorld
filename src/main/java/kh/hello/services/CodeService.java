package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.hello.dao.CodeQuestionDAO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.ProjectDTO;

@Service
public class CodeService {
	@Autowired
	private CodeQuestionDAO dao;
	
	public List<CodeQuestionDTO> selectQuestionAll() throws Exception{
			return dao.selectQuestionAll();
	}
	
	public void insertBoard(CodeQuestionDTO dto) throws Exception{
		dao.insert(dto);
	}
	
	@Transactional("txManager")
	public CodeQuestionDTO detailQuestion(int seq) throws Exception{
		dao.incrementViewCount(seq);
		return dao.detailQuestion(seq);
	}
	public void delete(int seq) throws Exception{
		dao.delete(seq);
	}
}
