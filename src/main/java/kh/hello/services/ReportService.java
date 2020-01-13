package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.hello.configuration.Configuration;
import kh.hello.dao.ReportDAO;
import kh.hello.dto.ReportDTO;

@Service
public class ReportService {

	@Autowired
	private ReportDAO rdao;
	
	public List<ReportDTO> reportListByPage(int start, int end){
		return rdao.reportListByPage(start, end);
	}
	
	public List<String> getReportPageNavi(int currentPage){
		int recordTotalCount = rdao.getReportTotal();
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
		
		List<String> pages = new ArrayList<>();

		if(needPrev) {
			pages.add("<a class=page-link href='../report/reportList?page=" + (startNavi - 1) + "'>< </a>");		
		}
		for(int i=startNavi;i<=endNavi;i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='../report/reportList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			pages.add(sb.toString());		
		}
		if(needNext) {
			pages.add("<a class=page-link href='../report/reportList?page=\" + (endNavi + 1) + \"'>> </a>");
		}
		return pages;		
	}
	
	@Transactional("txManager")
	public int updateReport(int seq, String result) {
		//1. 결과 update
		rdao.updateResult(seq, result);
		//2. 상태 update
		return rdao.updateState(seq);
	}
}
