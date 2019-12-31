package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.hello.dao.ProjectDAO;
import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO dao;
	
	
	/*
	 * 프로젝트 모집
	 */
	
	public List<ProjectDTO> projectList(){
		return dao.getProjectList();
	}
	
	@Transactional("txManager")
	public ProjectDTO ProjectDetailView(int seq) {
		dao.updateProjectViewCount(seq);
		return dao.getProjectDetailView(seq);
	}
	
	@Transactional("txManager")
	public int projectWriteConfirm(ProjectDTO dto) {
		dao.insertProject(dto);
		return dao.latestSeq(dto.getWriter());
	}
	
	public int projectModifyConfirm(ProjectDTO dto) {
		return dao.updateProject(dto);
	}
	
	@Transactional("txManager")
	public int projectDeleteConfirm(int seq) {
		dao.deleteProjectAllCo(seq);
		return dao.deleteProject(seq);
	}
	
	
	
	/*
	 * 댓글 
	 */
	
	public List<ProjectCoDTO> commentList(int projectSeq) {
		return dao.getCoList(projectSeq);
	}
	
	@Transactional("txManager")
	public String commentWriteConfirm(ProjectCoDTO dto) {
		dao.insertProjectCo(dto);
		Gson gson = new Gson();
		JsonArray array = new JsonArray();
		List<ProjectCoDTO> result = dao.getCoList(dto.getProjectSeq());
		for(ProjectCoDTO p : result) {
			array.add(gson.toJson(p));
		}
		return array.toString();
	}
	
	@Transactional("txManager")
	public String commentModifyConfirm(ProjectCoDTO dto) {
		dao.updateProjectCo(dto);
		Gson gson = new Gson();
		JsonArray array = new JsonArray();
		List<ProjectCoDTO> result = dao.getCoList(dto.getProjectSeq());
		for(ProjectCoDTO p : result) {
			array.add(gson.toJson(p));
		}
		return array.toString();
	}
	
	public int commentDeleteConfirm(int seq) {
		return dao.deleteProjectCo(seq);
	}
	
	public int commentsDeleteConfirm(int projectSeq) {
		return dao.deleteProjectAllCo(projectSeq);
	}
	
	
	
	/*
	 * 프로젝트 지원
	 */
	
	public String projectApplyWriteProc(ProjectApplyDTO dto) {
		int result = dao.insertProjectApply(dto);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	public List<ProjectApplyDTO> projectApplyList(int projectSeq) {
		return dao.getApplyList(projectSeq);
	}
	
	public ProjectApplyDTO ProjectApplyDetailView(int seq) {
		return dao.getProjectApplyDetailView(seq);
	}
	
	public int ProjectApplyDeleteConfirm(int seq) {
		return dao.deleteProjectApply(seq);
	}
}
