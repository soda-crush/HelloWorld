package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.PortfolioDAO;
import kh.hello.dto.PortfolioDTO;

@Service
public class PortfolioService {
	
	@Autowired
	private PortfolioDAO pdao;
	
	public void insertWrite(PortfolioDTO pdto) {
		pdao.insertWrite(pdto);
	}
	
	public List<PortfolioDTO> selectList(String writer){
		return pdao.selectList(writer);
	}
	
	public PortfolioDTO selectBySeq(int  seq){
		return pdao.selectBySeq(seq);
	}

	public void update(PortfolioDTO pdto) {
		pdao.update(pdto);
	}
	
	public void delete(int seq) {
		pdao.delete(seq);
	}

}
