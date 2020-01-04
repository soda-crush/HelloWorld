package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.ItnewsDAO;
import kh.hello.dto.ItnewsDTO;

@Service
public class ItnewsService {

	@Autowired
	private ItnewsDAO dao;
	
	public List<ItnewsDTO> itnewsList()throws Exception{
		return dao.getItnewsList();
	}
	
	public ItnewsDTO itnewsDetail(int seq)throws Exception{
		return dao.getItnewsDTO(seq);
	}
	
}
