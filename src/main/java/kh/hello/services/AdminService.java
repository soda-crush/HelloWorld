package kh.hello.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.AdminDAO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adao;
	
	public int validLogin(String adminId, String password) {
		return adao.validLogin(adminId, password);
	}
}
