package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.configuration.Configuration;
import kh.hello.dao.ScrapDAO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectDTO;

@Service
public class ScrapService {

	@Autowired
	private ScrapDAO sdao;
	
	public List<IndustryStatusDTO> selectIndustryStatusByPage(String id, int start, int end) {
		return sdao.selectIndustryStatusByPage(id,start,end);
	}
	
	public List<CodeQuestionDTO> selectCodeQuestionByPage(String id, int start, int end) {
		return sdao.selectCodeQuestionByPage(id,start,end);
	}
	
	public List<ProjectDTO> selectProjectByPage(String id, int start, int end) {
		return sdao.selectProjectByPage(id,start,end);
	}
	
	public List<ItnewsDTO> selectItnewsByPage(String id, int start, int end) {
		return sdao.selectItnewsByPage(id,start,end);
	}
	
	//페이지 네비
		public List<String> getGuestBookPageNavi (String ownerID, int currentPage,String colum) {
			int recordTotalCount = sdao.TotalCount(ownerID,colum);
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
			if(needPrev) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Scrap/"+colum+".do?cpage=" + (startNavi - 1) + "'>< </a></div>");

			for(int i = startNavi; i <= endNavi; i++) {
				StringBuilder sb = new StringBuilder();
				sb.append("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Scrap/"+colum+".do?cpage="+ i +"'>");
				sb.append(i + " ");
				sb.append("</a></div>");
				pages.add(sb.toString());
			}

			if(needNext) pages.add("<div class=\"page-item\" style='width:30px;display:inline-block;'><a class=page-link  href='/Scrap/"+colum+".do?cpage=" + (endNavi + 1) + "'>> </a></div>");

			return pages;
		}
	
}
