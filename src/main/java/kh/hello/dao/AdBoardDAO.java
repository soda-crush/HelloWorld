package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ProjectDTO;

@Repository
public class AdBoardDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<ProjectDTO> getProjectListPerPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("AdBoard.projectListByPage", param);
	}
	
	public int getProjectTotal() {
		return jdbc.selectOne("AdBoard.getProjectTotal");
	}
}
