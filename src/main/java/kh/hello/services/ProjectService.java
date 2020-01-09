package kh.hello.services;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.hello.configuration.Configuration;
import kh.hello.dao.ProjectDAO;
import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.dto.ProjectImageDTO;

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
		
	public String getPageNavi(int currentPage) {
		int recordTotalCount = dao.getArticleCount();
		int pageTotalCount = 0;		
		if(recordTotalCount % Configuration.recordCountPerPage>0) {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage+1;
		}else {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage+1;
		int endNavi = startNavi+(Configuration.naviCountPerPage-1);		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<ul class='pagination justify-content-center'>");
		if(needPrev) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/project/list?page="+(startNavi-1)+"' aria-label='Previous'>"); 
			sb.append("<span aria-hidden='true'>&laquo;</span></a></li>");			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/project/list?page="+i+"'>"+i+"</a></li>");			
		}
		if(needNext) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/project/list?page="+(endNavi+1)+"' aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&raquo;</span></a></li>");			
		}
		sb.append("</ul>");
		return sb.toString();
	}
	
	public List<ProjectDTO> projectListPerPage(int start, int end){
		return dao.getProjectListPerPage(start, end);
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
	public int projectWriteConfirm(ProjectDTO dto,String path) throws Exception {
		String option = "articleAdd";
		File filePath = new File(path);
		if(!filePath.exists()) {			
			filePath.mkdirs();
		}
		String contents = dto.getContents();
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(contents);
		List<ProjectImageDTO> summers = new ArrayList<>();
		int projectSeq = 0;
			while(m.find()) {
				String oriName = m.group(2);
				String sysName = "summer_"+System.currentTimeMillis()+"_"+oriName;
				String imgString = m.group(1).split(",")[1];
				byte[] imgBytes = Base64Utils.decodeFromString(imgString);
				FileOutputStream fos = new FileOutputStream(path+"/"+sysName);
				DataOutputStream dos = new DataOutputStream(fos);
				dos.write(imgBytes);
				dos.flush();
				dos.close();
				contents = contents.replaceFirst(Pattern.quote(m.group(1)), "/attached/project/"+sysName);
				ProjectImageDTO summer = new ProjectImageDTO();
				summer.setOriName(oriName);
				summer.setSysName(sysName);
				summers.add(summer);
			}	
			dto.setContents(contents);
			dao.insertProject(dto);		
			projectSeq = dao.latestSeq(dto.getId());
			dao.updatePoint(option, dto.getId());			
			for(ProjectImageDTO s : summers) {
				s.setProjectSeq(projectSeq);
				dao.insertImage(s);
			}			
		return projectSeq;		
	}
	
	public int projectModifyConfirm(ProjectDTO dto) {
		return dao.updateProject(dto);
	}
	
	@Transactional("txManager")
	public int projectDeleteConfirm(int seq, String id) {
		String option = "articleDel";
		dao.deleteProjectAllCo(seq);
		dao.updatePoint(option, id);
		return dao.deleteProject(seq);
	}
	
	@Transactional("txManager")
	public void projectClose(int seq) {
		dao.closeProject(seq);
		dao.closeProjectApply(seq);
	}
	
	@Transactional("txManager")
	public String checkScrap(String id, int seq) {
		int result = dao.checkScrap(id, seq);
		if(result>0) {
			return "impossible";
		}else {
			return "possible";
		}
	}
	
	public int projectScrap(String id, int seq) {
		return dao.insertScrap(id, seq);
	}
	
	public int projectUnScrap(String id, int seq) {
		return dao.deleteScrap(id, seq);
	}
	
	/*
	 * 댓글 
	 */
	
	public List<ProjectCoDTO> commentList(int projectSeq) {
		return dao.getCoList(projectSeq);
	}
	
	@Transactional("txManager")
	public String commentWriteConfirm(ProjectCoDTO dto) {
		String option = "commentAdd";
		dao.insertProjectCo(dto);
		dao.updatePoint(option, dto.getId());
		Gson gson = new Gson();
		List<ProjectCoDTO> result = dao.getCoList(dto.getProjectSeq());
		for(ProjectCoDTO p : result) {
			p.setFormedWriteDate(p.getWriteDate());
			if(p.getChangeDate()!=null) {
				p.setFormedChangeDate(p.getChangeDate());
			}	
		}
		return gson.toJson(result);
	}
	
	@Transactional("txManager")
	public String commentModifyConfirm(ProjectCoDTO dto) {
		dao.updateProjectCo(dto);
		Gson gson = new Gson();
		List<ProjectCoDTO> result = dao.getCoList(dto.getProjectSeq());
		for(ProjectCoDTO p : result) {
			p.setFormedWriteDate(p.getWriteDate());
			if(p.getChangeDate()!=null) {
				p.setFormedChangeDate(p.getChangeDate());
			}			
		}
		return gson.toJson(result);
	}
	
	@Transactional("txManager")
	public String commentDeleteConfirm(int seq, int projectSeq, String id) {
		String option = "commentDel";
		dao.deleteProjectCo(seq);
		dao.updatePoint(option, id);
		Gson gson = new Gson();
		List<ProjectCoDTO> result = dao.getCoList(projectSeq);
		for(ProjectCoDTO p : result) {
			p.setFormedWriteDate(p.getWriteDate());
			if(p.getChangeDate()!=null) {
				p.setFormedChangeDate(p.getChangeDate());
			}	
		}
		return gson.toJson(result);
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
	
	public int projectApplyApprove(int seq) {
		return dao.approveProjectApply(seq);
	}
	
	public int projectApplyDeny(int seq) {
		return dao.denyProjectApply(seq);
	}
	
	
//	
//	나의 프로젝트
//	
	
	
	public String getPLogProjectPageNavi(int currentPage, String id) {
		int recordTotalCount = dao.getMakeArticleCount(id);
		int pageTotalCount = 0;		
		if(recordTotalCount % Configuration.pLogProjectRecordCountPerPage>0) {
			pageTotalCount = recordTotalCount/Configuration.pLogProjectRecordCountPerPage+1;
		}else {
			pageTotalCount = recordTotalCount/Configuration.pLogProjectRecordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1) / Configuration.pLogProjectNaviCountPerPage * Configuration.pLogProjectNaviCountPerPage+1;
		int endNavi = startNavi+(Configuration.pLogProjectNaviCountPerPage-1);		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<ul class='pagination justify-content-center'>");
		if(needPrev) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/project/makeProjectList?page="+(startNavi-1)+"' aria-label='Previous'>"); 
			sb.append("<span aria-hidden='true'>&laquo;</span></a></li>");			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/project/makeProjectList?page="+i+"'>"+i+"</a></li>");			
		}
		if(needNext) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/project/makeProjectList?page="+(endNavi+1)+"' aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&raquo;</span></a></li>");			
		}
		sb.append("</ul>");
		return sb.toString();
	}
	
	public List<ProjectDTO> makeProjectListPerPage(int start, int end, String id){
		return dao.getMakeProjectListPerPage(start, end, id);
	}
	
//	public List<ProjectPLogDTO> applyProjectListPerPage(int start, int end, String id){
//		return 
//	}
}
