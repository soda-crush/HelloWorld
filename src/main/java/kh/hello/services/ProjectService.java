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
import kh.hello.dto.ProjectPLogDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.utils.Utils;

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
		
	public String getPageNavi(int currentPage, String pageOrder, String searchOption, String keyword) {
		int recordTotalCount = dao.getArticleCount(pageOrder, searchOption, keyword);
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
			if(pageOrder.contentEquals("startDate")) {
				if(searchOption!=null) {
					sb.append("<a class='page-link' href='/project/list?pageOrder=startDate&searchOption="+searchOption+"&keyword="+keyword+"&page="+(startNavi-1)+"' aria-label='Previous'>");
				}else {
					sb.append("<a class='page-link' href='/project/list?pageOrder=startDate&page="+(startNavi-1)+"' aria-label='Previous'>");
				}
			}else {
				sb.append("<a class='page-link' href='/project/list?page="+(startNavi-1)+"' aria-label='Previous'>");	
			}						 
			sb.append("<span aria-hidden='true'>&laquo;</span></a></li>");			
		}
		if(pageOrder.contentEquals("startDate")) {
			if(searchOption!=null) {
				for(int i=startNavi;i<=endNavi;i++) {
					sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/project/list?pageOrder=startDate&searchOption="+searchOption+"&keyword="+keyword+"&page="+i+"'>"+i+"</a></li>");			
				}
			}else {
				for(int i=startNavi;i<=endNavi;i++) {
					sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/project/list?pageOrder=startDate&page="+i+"'>"+i+"</a></li>");			
				}				
			}
		}else {
			for(int i=startNavi;i<=endNavi;i++) {
				sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/project/list?page="+i+"'>"+i+"</a></li>");			
			}			
		}
		if(needNext) {
			sb.append("<li class='page-item'>");
			if(pageOrder.contentEquals("startDate")) {
				if(searchOption!=null) {
					sb.append("<a class='page-link' href='/project/list?pageOrder=startDate&searchOption="+searchOption+"&keyword="+keyword+"&page="+(endNavi+1)+"' aria-label='Next'>");
				}else {
					sb.append("<a class='page-link' href='/project/list?pageOrder=startDate&page="+(endNavi+1)+"' aria-label='Next'>");
				}
			}else {
				sb.append("<a class='page-link' href='/project/list?page="+(endNavi+1)+"' aria-label='Next'>");	
			}			
			sb.append("<span aria-hidden='true'>&raquo;</span></a></li>");			
		}
		sb.append("</ul>");
		return sb.toString();
	}
	
	public List<ProjectDTO> projectListPerPage(int start, int end, String pageOrder, String searchOption, String keyword){
		return dao.getProjectListPerPage(start, end, pageOrder, searchOption, keyword);
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
	public int projectWriteConfirm(ProjectDTO dto, String path) throws Exception {
		String option = "articleAdd";
		File filePath = new File(path);
		if(!filePath.exists()) {			
			filePath.mkdirs();
		}
		dto.setTitle(Utils.protectXss(dto.getTitle()));
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
	
	@Transactional("txManager")
	public int projectModifyConfirm(ProjectDTO dto, String path, String headName) throws Exception {
		File filePath = new File(path);
		if(!filePath.exists()) {			
			filePath.mkdirs();
		}
		dto.setTitle(Utils.protectXss(dto.getTitle()));
		String contents = dto.getContents();
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(contents);
		
		int projectSeq = dto.getSeq();
		List<ProjectImageDTO> originImages = dao.getImages(projectSeq);
		List<String> originSysNames = new ArrayList<>();
		for(ProjectImageDTO i : originImages) {
			originSysNames.add(i.getSysName());
		}
		List<String> modiImageSysNames = new ArrayList<>();		
			while(m.find()) {
				if(!m.group(1).startsWith(headName)) {
					String oriName = m.group(2);
					String sysName = "summer_"+System.currentTimeMillis()+"_"+oriName;
					String imgString = m.group(1).split(",")[1];
					byte[] imgBytes = Base64Utils.decodeFromString(imgString);
					FileOutputStream fos = new FileOutputStream(path+"/"+sysName);
					DataOutputStream dos = new DataOutputStream(fos);
					dos.write(imgBytes);
					dos.flush();
					dos.close();
					contents = contents.replaceFirst(Pattern.quote(m.group(1)), headName+sysName);
					ProjectImageDTO summer = new ProjectImageDTO();
					summer.setOriName(oriName);
					summer.setSysName(sysName);
					summer.setProjectSeq(projectSeq);
					dao.insertImage(summer);
				}
				modiImageSysNames.add(m.group(1).substring(headName.length()));			
			}
			
			for(int i=0;i<modiImageSysNames.size();i++) {
				if(originSysNames.contains(modiImageSysNames.get(i))) {
					originSysNames.remove(modiImageSysNames.get(i));
				}
			}
			for(String s : originSysNames) {
				new File(path+"/"+s).delete();
				dao.deleteImage(s);
			}
			dto.setContents(contents);			
			return dao.updateProject(dto);
	}
	
	@Transactional("txManager")
	public int projectDeleteConfirm(int seq, String id, String path) {
		String option = "articleDel";
		List<ProjectImageDTO> imageList = dao.getImages(seq);
		for(ProjectImageDTO i : imageList) {
			new File(path+"/"+i.getSysName()).delete();
		}
		dao.deleteProjectAllCo(seq);
		dao.deleteImagesByProjectSeq(seq);
		dao.updatePoint(option, id);
		dao.checkPoint(id);
		return dao.deleteProject(seq);
	}
	
	@Transactional("txManager")
	public void projectClose(int seq) {
		dao.closeProject(seq);
		dao.closeProjectApply(seq);
	}
		
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
		dto.setContents(Utils.protectXss(dto.getContents()));
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
		dto.setContents(Utils.protectXss(dto.getContents()));
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
		dao.checkPoint(id);
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
		dto.setEmail(Utils.protectXss(dto.getEmail()));
		dto.setEtc(Utils.protectXss(dto.getEtc()));
		int result = dao.insertProjectApply(dto);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	public List<ProjectApplyDTO> projectApplyList(int start, int end, int projectSeq) {		
		return dao.getApplyList(start, end, projectSeq);
	}
	
	
	
	
	public String getApplyPageNavi(int currentPage, int projectSeq) {
		int recordTotalCount = dao.getApplyArticleCount(projectSeq);
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
			sb.append("<a class='page-link' href='/project/apply/list?page="+(startNavi-1)+"' aria-label='Previous'>");	
			sb.append("<span aria-hidden='true'>&laquo;</span></a></li>");			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/project/apply/list?page="+i+"'>"+i+"</a></li>");			
		}			
		
		if(needNext) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/project/apply/list?page="+(endNavi+1)+"' aria-label='Next'>");	
			sb.append("<span aria-hidden='true'>&raquo;</span></a></li>");			
		}
		sb.append("</ul>");
		return sb.toString();
	}
	
	
	
	
	public ProjectApplyDTO projectApplyDetailView(int seq) {
		return dao.getProjectApplyDetailView(seq);
	}
	
	public ProjectApplyDTO getApplyCheck(int projectSeq) {
		return dao.getApplyCheck(projectSeq);
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
	
	
	public String getPLogProjectPageNavi(int currentPage, String id, String listType, String searchOption, String keyword) {
		
		int recordTotalCount = 0;
		if(listType.contentEquals("makeProjectList")) {
			recordTotalCount = dao.getMakeArticleCount(id, searchOption, keyword);
		}else if(listType.contentEquals("applyProjectList")) {
			recordTotalCount = dao.getApplyArticleCount(id, searchOption, keyword);
		}
		
		
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
			sb.append("<a class='page-link' href='/project/pLog/"+listType+"?page="+(startNavi-1)+"' aria-label='Previous'>"); 
			sb.append("<span aria-hidden='true'>&laquo;</span></a></li>");			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/project/pLog/"+listType+"?page="+i+"'>"+i+"</a></li>");			
		}
		if(needNext) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/project/pLog/"+listType+"?page="+(endNavi+1)+"' aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&raquo;</span></a></li>");			
		}
		sb.append("</ul>");
		return sb.toString();
	}
	
	public List<ProjectDTO> makeProjectListPerPage(int start, int end, String id, String searchOption, String keyword){
		return dao.getMakeProjectListPerPage(start, end, id, searchOption, keyword);
	}
	
	public List<ProjectPLogDTO> applyProjectListPerPage(int start, int end, String id, String searchOption, String keyword){
		return dao.getApplyProjectListPerPage(start, end, id, searchOption, keyword);
	}
	
	
	
	
//	게시글신고
	public int reportDuplCheck(String id, int seq) {
		return dao.reportDuplCheck(id, seq);
	}
	public int reportProject(ReportDTO dto) {
		dto.setReason(Utils.protectXss(dto.getReason()));
		return dao.insertReport(dto);					
	}
}
