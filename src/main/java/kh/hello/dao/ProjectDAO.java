package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.configuration.Configuration;
import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.dto.ProjectImageDTO;

@Repository
public class ProjectDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	
	//project 테이블
	public List<ProjectDTO> getProjectList(){//프로젝트 모집글 전체리스트
		return jdbc.selectList("Project.getList");
	}
	
	public int getArticleCount() {//프로젝트 모집글 전체 개수
		return jdbc.selectOne("Project.getArticleCount");
	}
	public List<ProjectDTO> getProjectListPerPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Project.getListByPage", param);
	}
	public ProjectDTO getProjectDetailView(int seq) {//프로젝트 모집글 상세보기
		return jdbc.selectOne("Project.getProjectDetailView", seq);
	}
	public int latestSeq(String id) {//작성자 가장 최근글(작성/수정 직후 디테일뷰)
		return jdbc.selectOne("Project.latestSeq", id);
	}
	public int insertProject(ProjectDTO dto) {//프로젝트 모집글 작성
		return jdbc.insert("Project.insertProject", dto);
	}	
	public int updateProject(ProjectDTO dto) {//프로젝트 모집글 수정
		return jdbc.update("Project.updateProject", dto);
	}
	public int updateProjectViewCount(int seq) {//프로젝트 모집글 조회수+1
		return jdbc.update("Project.updateProjectViewCount", seq);
	}
	public int deleteProject(int seq) {//프로젝트 모집글 삭제
		return jdbc.delete("Project.deleteProject", seq);
	}
	public int closeProject(int seq) {
		return jdbc.update("Project.closeProject", seq);
	}
	
	//projectImage 테이블
	public int insertImage(ProjectImageDTO dto) {
		return jdbc.insert("Project.insertImage",dto);
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
	public int deleteProjectCo(int seq) {//프로젝트 모집댓글 삭제(개별)
//		return jdbc.delete("ProjectCo.deleteProjectCo", seq);
		return jdbc.update("ProjectCo.updateNullProjectCo", seq);
	}
	public int deleteProjectAllCo(int projectSeq) {//프로젝트 모집댓글 삭제(글에 달린 모든댓글)
		return jdbc.delete("ProjectCo.deleteProjectAllCo", projectSeq);
	}
	
	
	//projectApply 테이블
	public List<ProjectApplyDTO> getApplyList(int projectSeq) {//프로젝트 지원 전체리스트(해당글에 대한)
		return jdbc.selectList("ProjectApply.getList", projectSeq);
	}
	public ProjectApplyDTO getProjectApplyDetailView(int seq) {//프로젝트 지원 상세보기
		return jdbc.selectOne("ProjectApply.getProjectApplyDetailView", seq);
	}
	public int insertProjectApply(ProjectApplyDTO dto) {//프로젝트 지원 작성
		return jdbc.insert("ProjectApply.insertProjectApply", dto);
	}	
	public int updateProjectApply(ProjectApplyDTO dto) {//프로젝트 지원 수정
		return jdbc.update("ProjectApply.updateProjectApply", dto);
	}	
	public int deleteProjectApply(int seq) {//프로젝트 지원 삭제
		return jdbc.delete("ProjectApply.deleteProjectApply", seq);
	}
	public int closeProjectApply(int seq) {//프로젝트 모집 마감
		return jdbc.update("ProjectApply.closeProjectApply", seq);
	}
//	public int getCountInApprove(String writer) {//승인된 개수가져오기
//		return jdbc.selectOne("ProjectApply.getCountInApprove", writer);
//	}
	public int approveProjectApply(int seq) {//프로젝트 지원 승인처리
		return jdbc.update("ProjectApply.approveApply", seq);
	}
	public int denyProjectApply(int seq) {//프로젝트 지원 승인거절
		return jdbc.update("ProjectApply.approveDeny", seq);
	}
	
	//PLog용(Project, ProjectComment, ProjectApply 등 참고)
	public List<ProjectDTO> getMakeProjectList(String id){//나의 프로젝트 전체리스트
		return jdbc.selectList("Project.getPLogMakeList", id);
	}
	public int getMakeArticleCount(String id) {
		return jdbc.selectOne("Project.getMakeArticleCount", id);
	}
	public List<ProjectDTO> getMakeProjectListPerPage(int start, int end, String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);		
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Project.getPLogMakeListByPage", param);
	}
//	public int insertProjectList(ProjectPlogDTO dto) {//나의 프로젝트 등록
//		return jdbc.insert("ProjectPlogList.insert", dto);
//	}
//	public int deleteProjectList(int seq) {//나의 프로젝트 삭제
//		return jdbc.delete("ProjectPlogList.delete", seq);
//	}
	
	
	
	
	//기타테이블들
	
	//member 테이블 (글/댓글 포인트 추가/차감)
	public int updatePoint(String option, String id) {
		int point = 0;
		if(option.contentEquals("articleAdd")) {
			point = Configuration.articleAddPoint;
		}else if(option.contentEquals("articleDel")) {
			point = Configuration.articleDelPoint;
		}else if(option.contentEquals("commentAdd")) {
			point = Configuration.commentAddPoint;
		}else if(option.contentEquals("commentDel")) {
			point = Configuration.commentDelPoint;
		}
		Map<String, Object> param = new HashMap<>();
		param.put("point", point);
		param.put("id", id);
		return jdbc.update("Project.articleAddPoint", param);
	}
	
	//scrap 테이블
	public int insertScrap(String id, int seq) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("categorySeq", seq);		
		return jdbc.insert("Project.scrap", param);
	}
	public int deleteScrap(String id, int seq) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("categorySeq", seq);		
		return jdbc.delete("Project.unScrap", param);
	}
	public int checkScrap(String id, int seq) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("categorySeq", seq);		
		return jdbc.selectOne("Project.scrapCheck", param);
	}
		
}
