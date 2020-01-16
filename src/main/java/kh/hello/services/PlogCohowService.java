package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.configuration.Configuration;
import kh.hello.dao.PlogCohowDAO;
import kh.hello.dto.CodeQuestionDTO;

@Service
public class PlogCohowService {

	@Autowired
	private PlogCohowDAO pdao;
	
	public List<CodeQuestionDTO> selectMyQuestion(String id){
		return pdao.selectMyQuestion(id);
	}
	
	public List<CodeQuestionDTO> selectMyReply(String id){
		return pdao.selectMyReply(id);
	}
	
	public List<CodeQuestionDTO> selectMyQuestionListByPage(String ownerID, int start, int end){
		return pdao.selectMyQuestionListByPage(ownerID,start,end);
	}
	
	public List<CodeQuestionDTO> selectMyReplyListByPage(String ownerID, int start, int end){
		return pdao.selectMyReplyListByPage(ownerID,start,end);
	}
	
	//페이지 네비
	public List<String> getScrapPageNavi (String ownerID, int currentPage,String colum,int reversepage) {
		int qrecordTotalCount = pdao.TotalCount(ownerID,colum);
		int qpageTotalCount = 0;
			if(qrecordTotalCount% Configuration.pLogProjectRecordCountPerPage > 0) {
			qpageTotalCount = qrecordTotalCount / Configuration.pLogProjectRecordCountPerPage + 1;
		}else {
			qpageTotalCount = qrecordTotalCount / Configuration.pLogProjectRecordCountPerPage;
		}
			if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > qpageTotalCount) {
			currentPage = qpageTotalCount;
		}
			int qstartNavi = (currentPage - 1) / Configuration.pLogProjectNaviCountPerPage * Configuration.pLogProjectNaviCountPerPage + 1;
		int qendNavi = qstartNavi + (Configuration.pLogProjectNaviCountPerPage - 1);
			if(qendNavi > qpageTotalCount) {
			qendNavi = qpageTotalCount;
		}
			boolean qneedPrev = true;
		if(qstartNavi == 1) {
			qneedPrev = false;
		}
		boolean qneedNext = true;
		if(qendNavi == qpageTotalCount) {
			qneedNext = false;
		}
		
		int rrecordTotalCount = pdao.TotalCount(ownerID,colum);
		int rpageTotalCount = 0;
			if(rrecordTotalCount% Configuration.pLogProjectRecordCountPerPage > 0) {
			rpageTotalCount = rrecordTotalCount / Configuration.pLogProjectRecordCountPerPage + 1;
		}else {
			rpageTotalCount = rrecordTotalCount / Configuration.pLogProjectRecordCountPerPage;
		}
			if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > rpageTotalCount) {
			currentPage = rpageTotalCount;
		}
			int rstartNavi = (currentPage - 1) / Configuration.pLogProjectNaviCountPerPage * Configuration.pLogProjectNaviCountPerPage + 1;
		int rendNavi = rstartNavi + (Configuration.pLogProjectNaviCountPerPage - 1);
			if(rendNavi > rpageTotalCount) {
			rendNavi = rpageTotalCount;
		}
			boolean rneedPrev = true;
		if(rstartNavi == 1) {
			rneedPrev = false;
		}
		boolean rneedNext = true;
		if(rendNavi == rpageTotalCount) {
			rneedNext = false;
		}	
		
		List<String> pages = new ArrayList<>();
		if(colum =="Q"){
			if(qneedPrev) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Plog/toPlogCohow.do?qcpage=" + (qstartNavi - 1) + "&rcpage="+reversepage +"'>< </a></div>");
			for(int i = qstartNavi; i <= qendNavi; i++) {
				StringBuilder sb = new StringBuilder();
				sb.append("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Plog/toPlogCohow.do?qcpage="+ i +"&rcpage="+reversepage +"'>");
				sb.append(i + " ");
				sb.append("</a></div>");
				pages.add(sb.toString());
			}
			if(qneedNext) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Plog/toPlogCohow.do?qcpage=" + (qendNavi + 1) + "&rcpage="+reversepage +"'>> </a></div>");
			return pages;

		}else {
			if(rneedPrev) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Plog/toPlogCohow.do?rcpage=" + (rstartNavi - 1) +"&qcpage="+reversepage +"'>< </a></div>");
			for(int i = rstartNavi; i <= rendNavi; i++) {
			StringBuilder sb = new StringBuilder();
				sb.append("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Plog/toPlogCohow.do?rcpage="+ i +"&qcpage="+reversepage +"'>");
				sb.append(i + " ");
				sb.append("</a></div>");
				pages.add(sb.toString());
			}
			if(rneedNext) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Plog/toPlogCohow.do?rcpage=" + (rendNavi + 1) + "&qcpage="+reversepage +"'>> </a></div>");
			return pages;
		}
	}	
}
