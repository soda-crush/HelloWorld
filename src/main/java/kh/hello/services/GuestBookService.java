package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.configuration.Configuration;
import kh.hello.dao.GuestBookDAO;
import kh.hello.dao.MemberDAO;
import kh.hello.dto.GuestBookDTO;

@Service
public class GuestBookService {
	
	@Autowired
	private GuestBookDAO gdao;
	
	@Autowired
	private MemberDAO mdao;
	
	public void insert(GuestBookDTO gdto) {
		mdao.getPoint(gdto.getWriter(),5);
		gdao.insert(gdto);
	}

	public List<GuestBookDTO> selectListByPage(String ownerID, int start, int end){
		return gdao.selectListByPage(ownerID,start,end);
	}
	
	//페이지 네비
	public List<String> getGuestBookPageNavi (String ownerID, int currentPage) {
		int recordTotalCount = gdao.TotalCount(ownerID);
		int pageTotalCount = 0;

		if(recordTotalCount% Configuration.pLogProjectRecordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.pLogProjectRecordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.pLogProjectRecordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / Configuration.pLogProjectNaviCountPerPage * Configuration.pLogProjectNaviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.pLogProjectNaviCountPerPage - 1);

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
		if(needPrev) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/GuestBook/selectList.do?cpage=" + (startNavi - 1) + "'>< </a></div>");

		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/GuestBook/selectList.do?cpage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a></div>");
			pages.add(sb.toString());
		}

		if(needNext) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/GuestBook/selectList.do?cpage=" + (endNavi + 1) + "'>> </a></div>");

		return pages;
	}
	
	public void delete(int seq) {
		String id = gdao.selectBySeq(seq);
		mdao.minusPoint(id, 5);
		gdao.delete(seq);
	}
	
	public void update(GuestBookDTO gdto) {
		gdao.update(gdto);
	}
	
}
