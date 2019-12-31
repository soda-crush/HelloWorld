package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.BambooDAO;
import kh.hello.dto.BambooDTO;

@Service
public class BambooService {
	@Autowired
	private BambooDAO dao;
	
	public List<BambooDTO> bambooList(){
		return dao.selectAll();
	}
}
