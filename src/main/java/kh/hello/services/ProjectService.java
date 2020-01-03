package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
	public ProjectDTO projectDetailView(int seq) {
		dao.updateProjectViewCount(seq);
		return dao.getProjectDetailView(seq);
	}
	
	public String projectWrite() {
		//String[] v = {"markup","css","sass","javascript","java","python","groovy","scala","php","bash","coffeescript","go","haskell","c","cpp","sql","ruby","aspnet","csharp","swift","objectivec"};
		String[] v = {"HTML/Markup","CSS","Sass","JavaScript","Java","Python","Groovy","Scala","PHP","Bash","CoffeeScript","Go","Haskell","C","C++","SQL","Ruby","ASP.NET","C#","Swift","Objective-C"};
		JsonArray array = new JsonArray();
		for(int i=0;i<v.length;i++) {
			JsonObject obj = new JsonObject();
			obj.addProperty("value", v[i]);
			obj.addProperty("text", v[i]);
			array.add(obj);
		}
		return array.toString();		
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
	
	@Transactional("txManager")
	public void projectClose(int seq) {
		dao.closeProject(seq);
		dao.closeProjectApply(seq);
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
	
	public ProjectApplyDTO projectApplyDetailView(int seq) {
		return dao.getProjectApplyDetailView(seq);
	}
	
	public int projectApplyDeleteConfirm(int seq) {
		return dao.deleteProjectApply(seq);
	}
}
