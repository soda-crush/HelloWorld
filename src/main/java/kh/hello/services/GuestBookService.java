package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.dao.GuestBookDAO;
import kh.hello.dto.GuestBookDTO;

@Service
public class GuestBookService {
	
	@Autowired
	private GuestBookDAO gdao;
	
	public void insertWrite(GuestBookDTO gdto) {
		gdao.insertWrite(gdto);
	}

	public List<GuestBookDTO> selectList(){
		return gdao.selectList();
	}
}
