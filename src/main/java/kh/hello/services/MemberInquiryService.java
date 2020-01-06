package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.configuration.Configuration;
import kh.hello.dao.MemberInquiryDAO;
import kh.hello.dto.InquiryDTO;

@Service
public class MemberInquiryService {

	@Autowired
	private MemberInquiryDAO dao;
	
	public List<InquiryDTO> getMyInquiryByPage(String id, int start, int end){
		return dao.getMyInquiryByPage(id, start, end);
	}
	
	public List<String> getMyInquiryPageNavi(String id, int currentPage){
		int myInquiryTotalCount = dao.getMyInquiryTotal(id);
		int pageTotalCount = 0;
		
		if(myInquiryTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = myInquiryTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = myInquiryTotalCount / Configuration.recordCountPerPage;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) needPrev = false;

		boolean needNext = true;
		if(endNavi == pageTotalCount) needNext = false;
		
		List<String> pages = new ArrayList<>();

		if(needPrev) pages.add("<a class=page-link href='${pageContext.request.contextPath}/member1/myInquiry?id="+id+"&page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='${pageContext.request.contextPath}/member1/myInquiry?id="+id+"&page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='${pageContext.request.contextPath}/member1/myInquiry?id="+id+"&page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;
	}
}
