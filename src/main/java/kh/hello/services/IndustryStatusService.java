package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.hello.configuration.Configuration;
import kh.hello.dao.IndustryStatusDAO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;

@Service
public class IndustryStatusService {
	@Autowired
	private IndustryStatusDAO dao;
	
	//업계현황 게시판 글
	public List<IndustryStatusDTO> industryStatusList(){
		return dao.selectAll();
	}
	
	@Transactional("txManager")
	public IndustryStatusDTO industryStatusDetailView(int seq) {
		dao.updateIndustryStatusViewCount(seq);
		return dao.getIndustryStatusDetailView(seq);
	}
	
	@Transactional("txManager")
	public int industryStatusWriteConfirm(IndustryStatusDTO dto) {
		dao.insertIndustryStatus(dto);
		return dao.latestSeq(dto.getWriter());
	}
	
	public int industryStatusModifyConfirm(IndustryStatusDTO dto) {
		return dao.updateIndustryStatus(dto);
	}
	
	@Transactional("txManager")
	public int industryStatusDeleteConfirm(int seq) {
		dao.deleteIndustryStatusAllCo(seq);
		return dao.deleteIndustryStatus(seq);
	}
	
	
	//대나무숲 페이지네비

		public List<IndustryStatusDTO> industryListByPage(int start, int end) {// 10개씩
			return dao.industryListByPage(start, end);
		}
		public List<String> getIndustryListPageNavi (int currentPage) {
			int recordTotalCount = dao.recordIndustryListTotalCount();
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
			if(needPrev) pages.add("<li class=\"page-item\"><a class=page-link href='industryStatusList.do?cpage=" + (startNavi - 1) + "'>< </a></li>");

			for(int i = startNavi; i <= endNavi; i++) {
				StringBuilder sb = new StringBuilder();
				sb.append("<li class=\"page-item\"><a class=page-link href='industryStatusList.do?cpage="+ i +"'>");
				sb.append(i + " ");
				sb.append("</a></li>");
				pages.add(sb.toString());
			}

			if(needNext) pages.add("<li class=\"page-item\"><a class=page-link href='industryStatusList.do?cpage=" + (endNavi + 1) + "'>> </a></li>");

			return pages;
		}
	//업계현황 댓글
	
		public List<IndustryStatusCoDTO> commentList(int indSeq) {
			return dao.getCoList(indSeq);
		}
		
		@Transactional("txManager")
		public String commentWriteConfirm(IndustryStatusCoDTO dto) {
			dao.insertIndustryStatusCo(dto);
			Gson gson = new Gson();
			JsonArray array = new JsonArray();
			List<IndustryStatusCoDTO> result = dao.getCoList(dto.getIndSeq());
			for(IndustryStatusCoDTO i : result) {
				array.add(gson.toJson(i));
			}
			return array.toString();
		}
		
		@Transactional("txManager")
		public String commentModifyConfirm(IndustryStatusCoDTO dto) {
			dao.updateIndustryStatusCo(dto);
			Gson gson = new Gson();
			JsonArray array = new JsonArray();
			List<IndustryStatusCoDTO> result = dao.getCoList(dto.getIndSeq());
			for(IndustryStatusCoDTO i : result) {
				array.add(gson.toJson(i));
			}
			return array.toString();
		}
		
		public int commentDeleteConfirm(int seq) {
			return dao.deleteIndustryStatusCo(seq);
		}
		
		public int commentsDeleteConfirm(int indSeq) {
			return dao.deleteIndustryStatusAllCo(indSeq);
		}
}
