package kh.hello.utils;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import kh.hello.dao.CountDAO;

public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("세션생성");
		CountDAO dao = CountDAO.getInstance();
		try {
			dao.plusVisitCount();		
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {	}
}
