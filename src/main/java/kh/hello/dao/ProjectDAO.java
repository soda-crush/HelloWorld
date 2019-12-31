package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.dto.ProjectListDTO;

@Repository
public class ProjectDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	
	//project 테이블
	public List<ProjectDTO> getProjectList(){//프로젝트 모집글 전체리스트
		return jdbc.selectList("Project.getList");
	}	
	public int insertProject(ProjectDTO dto) {//프로젝트 모집글 작성
		return jdbc.insert("Project.insertProject", dto);
	}	
	public int updateProject(ProjectDTO dto) {//프로젝트 모집글 수정
		return jdbc.update("Project.updateProject", dto);
	}	
	public int deleteProject(int seq) {//프로젝트 모집글 삭제
		return jdbc.delete("Project.deleteProject", seq);
	}
	
	
	//projectComment 테이블
	public List<ProjectCoDTO> getCoList(int projectSeq){//프로젝트 모집댓글 전체리스트(해당글에 대한)
		return jdbc.selectList("ProjectCo.getList", projectSeq);
	}
	public int insertProjectCo(ProjectCoDTO dto) {//프로젝트 모집댓글 작성
		return jdbc.insert("ProjectCo.insertProjectCo", dto);
	}	
	public int updateProjectCo(ProjectCoDTO dto) {//프로젝트 모집댓글 수정
		return jdbc.update("ProjectCo.updateProjectCo", dto);
	}	
	public int deleteProjectCo(int seq) {//프로젝트 모집댓글 삭제
		return jdbc.delete("ProjectCo.deleteProjectCo", seq);
	}
	
	
	//projectApply 테이블
	public List<ProjectApplyDTO> getApplyList(int projectSeq){//프로젝트 모집댓글 전체리스트(해당글에 대한)
		return jdbc.selectList("ProjectApply.getList", projectSeq);
	}
	public int insertProjectApply(ProjectApplyDTO dto) {//프로젝트 모집댓글 작성
		return jdbc.insert("ProjectApply.insertProjectApply", dto);
	}	
	public int updateProjectApply(ProjectApplyDTO dto) {//프로젝트 모집댓글 수정
		return jdbc.update("ProjectApply.updateProjectApply", dto);
	}	
	public int deleteProjectApply(int seq) {//프로젝트 모집댓글 삭제
		return jdbc.delete("ProjectApply.deleteProjectApply", seq);
	}
	
	
	//projectList 테이블
	public List<ProjectListDTO> getMyList(String id){//나의 프로젝트 전체리스트
		return jdbc.selectList("ProjectList.getList", id);
	}
	public int insertProjectList(ProjectListDTO dto) {//나의 프로젝트 등록
		return jdbc.insert("ProjectList.insertProjectList", dto);
	}
	public int deleteProjectList(int seq) {//나의 프로젝트 삭제
		return jdbc.delete("ProjectList.deleteProjectList", seq);
	}
}
