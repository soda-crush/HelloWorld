package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.MemberDAO;
import kh.hello.dao.PortfolioDAO;
import kh.hello.dto.PortfolioDTO;

@Service
public class PortfolioService {
	
	@Autowired
	private PortfolioDAO pdao;
	
	@Autowired
	private MemberDAO mdao;
	
	public void insertWrite(PortfolioDTO pdto) {
		mdao.getPoint(pdto.getWriter(), 10);
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
		PortfolioDTO dto = pdao.selectBySeq(seq);
		mdao.minusPoint(dto.getWriter(), 15);
		pdao.delete(seq);
	}

}
