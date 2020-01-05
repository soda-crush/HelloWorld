package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public String getPageNavi(int cpage)throws Exception{
		return "";
	}
	
	public List<ItnewsDTO> selectByPage(int start, int end)throws Exception{
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Itnews.selectByPage", param);
	}

	public int getItnewsTotal()throws Exception{
		return jdbc.selectOne("Itnews.getTotal");
	}
	
}
