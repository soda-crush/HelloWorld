package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.hello.configuration.Configuration;
import kh.hello.dao.NoticeDAO;
import kh.hello.dto.NoticeDTO;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO ndao;
	
	public List<NoticeDTO> noticeListByPage(int start, int end, String searchOption, String keyword){
		if(keyword != null) {
			if(keyword.contains("'")) {
				keyword.replaceAll("'", "''");
			}			
		}
		return ndao.noticeListByPage(start, end, searchOption, keyword);
	}
	
	public List<String> getNoticePageNavi(int currentPage, String searchOption, String keyword){
		int recordTotalCount = ndao.getNoticeTotal(searchOption, keyword);
		int pageTotalCount = 0;
		
		if(recordTotalCount% Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();
		if(searchOption == null) {
			if(needPrev) pages.add("<a class=page-link href='noticeList?page=" + (startNavi - 1) + "'>< </a>");
			
			for(int i = startNavi; i <= endNavi; i++) {
				StringBuilder sb = new StringBuilder();
				sb.append("<a class=page-link href='noticeList?page="+ i +"'>");
				sb.append(i + " ");
				sb.append("</a>");
				pages.add(sb.toString());
			}
			
			if(needNext) pages.add("<a class=page-link href='noticeList?page=" + (endNavi + 1) + "'>> </a>");
			
		}else {
			if(needPrev) pages.add("<a class=page-link href='noticeList?searchOption="+searchOption+"&keyword="+keyword+"&page=" + (startNavi - 1) + "'>< </a>");
			
			for(int i = startNavi; i <= endNavi; i++) {
				StringBuilder sb = new StringBuilder();
				sb.append("<a class=page-link href='noticeList?searchOption="+searchOption+"&keyword="+keyword+"&page="+ i +"'>");
				sb.append(i + " ");
				sb.append("</a>");
				pages.add(sb.toString());
			}	
			
			if(needNext) pages.add("<a class=page-link href='noticeList?searchOption="+searchOption+"&keyword="+keyword+"&page=" + (endNavi + 1) + "'>> </a>");
		}
		return pages;		
	}
	
	@Transactional("txManager")
	public NoticeDTO detailViewNotice(int seq) {
		ndao.plusNoticeView(seq);
		return ndao.detailViewNotice(seq);
	}
}
