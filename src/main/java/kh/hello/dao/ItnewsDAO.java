package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ItnewsDTO;

@Repository
public class ItnewsDAO {
	
	@Autowired 
	private SqlSessionTemplate jdbc;
	
	public List<ItnewsDTO> getItnewsList()throws Exception{
		return jdbc.selectList("Itnews.getList");
	}
	
	public ItnewsDTO getItnewsDTO(int seq)throws Exception{
		return jdbc.selectOne("Itnews.getDTO", seq);
	}
	

}
