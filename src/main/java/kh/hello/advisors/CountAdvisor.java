package kh.hello.advisors;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import kh.hello.dao.CountDAO;


public class CountAdvisor {
	
	@Autowired
	private CountDAO cdao;
	
	public void newBoard(JoinPoint jp) {
		String oriMethod = jp.toShortString();
		System.out.println("count oriMethod : " + oriMethod);
		
		int result = cdao.newBoard();
		System.out.println(oriMethod + " 의 결과 : " + result);
	}
	
	public void delBoard(JoinPoint jp) {
		String oriMethod = jp.toShortString();
		System.out.println("count oriMethod : " + oriMethod);
		
		int result = cdao.delBoard();
		System.out.println(oriMethod + " 의 결과 : " + result);		
	}
	
	public void newCo(JoinPoint jp) {
		String oriMethod = jp.toShortString();
		System.out.println("count oriMethod : " + oriMethod);
		
		int result = cdao.newCo();
		System.out.println(oriMethod + " 의 결과 : " + result);		
	}
	
	public void delCo(JoinPoint jp) {
		String oriMethod = jp.toShortString();
		System.out.println("count oriMethod : " + oriMethod);
		
		int result = cdao.delCo();
		System.out.println(oriMethod + " 의 결과 : " + result);		
	}
}
