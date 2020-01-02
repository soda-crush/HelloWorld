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
	
	public List<PortfolioDTO> selectList(){
		return pdao.selectList();
	}

}
