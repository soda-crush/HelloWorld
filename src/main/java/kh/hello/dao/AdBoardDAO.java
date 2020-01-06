package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;

@Repository
public class AdBoardDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	// 프로젝트 게시판 관리
	public List<ProjectDTO> getProjectListPerPage(int start, int end){//페이지 별로 목록 가져오기
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("AdBoard.projectListByPage", param);
	}
	
	public int getProjectTotal() {//게시물 수 받아오기
		return jdbc.selectOne("AdBoard.getProjectTotal");
	}
	
	public int delProjectAllCo(int seq) {
		return jdbc.delete("AdBoard.delProjectAllCo", seq);
	}
	
	public int delProject(int seq) {//게시글 삭제
		return jdbc.delete("AdBoard.delProject", seq);
	}
	
	public ProjectDTO detailViewProject(int seq) {
		return jdbc.selectOne("AdBoard.detailViewProject", seq);
	}
	
	public List<ProjectCoDTO> getProjectCo(int projectSeq){
		return jdbc.selectList("AdBoard.getProjectCo", projectSeq);
	}
	
	public int delProjectCo(int seq) {
		return jdbc.delete("AdBoard.delProjectCo", seq);
	}
}
