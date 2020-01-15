package kh.hello.utils;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kh.hello.dao.CountDAO;

public class SessionListener implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("세션생성");
		getCountDAO(se).plusVisitCount();
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {	}
	
	private CountDAO getCountDAO(HttpSessionEvent se) {
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(se.getSession().getServletContext());
		return ctx.getBean(CountDAO.class);
	}
	
}
