package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.PlogCohowDAO;
import kh.hello.dto.CodeQuestionDTO;

@Service
public class PlogCohowService {

	@Autowired
	private PlogCohowDAO pdao;
	
	public List<CodeQuestionDTO> selectMyQuestion(String id){
		return pdao.selectMyQuestion(id);
	}
	
	public List<CodeQuestionDTO> selectMyReply(String id){
		return pdao.selectMyReply(id);
	}
	
	
}
