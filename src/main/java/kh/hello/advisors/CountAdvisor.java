package kh.hello.advisors;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import kh.hello.dao.CountDAO;


public class CountAdvisor {
	
	@Autowired
	private CountDAO cdao;
	
	public void newBoard(JoinPoint jp) {	
		cdao.newBoard();
	}
	
	public void delBoard(JoinPoint jp) {		
		cdao.delBoard();
	}
	
	public void newCo(JoinPoint jp) {		
		cdao.newCo();	
	}
	
	public void delCo(JoinPoint jp) {
		cdao.delCo();
	}
}
