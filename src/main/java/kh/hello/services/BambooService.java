package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.hello.dao.BambooDAO;
import kh.hello.dto.BambooDTO;

public class BambooService {
	@Autowired
	private BambooDAO dao;
	
	public void bambooList(){
		
	}
}
