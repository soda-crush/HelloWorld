package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hello.configuration.Configuration;
import kh.hello.dao.ItnewsDAO;
import kh.hello.dto.ItnewsDTO;

@Service
public class ItnewsService {

	@Autowired
	private ItnewsDAO dao;
	
	public List<ItnewsDTO> itnewsList(){
		return dao.getItnewsList();
	}
	
	public ItnewsDTO itnewsDetail(int seq){
		return dao.getItnewsDTO(seq);
	}
	
	public List<ItnewsDTO> itnewsListTrim(int start, int end){
		return dao.selectByPage(start, end);
	}
	
	public String getPageNavi(int cpage){
		int recordTotalCount = dao.getItnewsTotal();
		int pageTotalCount = 0;
		
		if(recordTotalCount% Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		
		if(cpage < 1) {
			cpage = 1;
		}else if(cpage > pageTotalCount) {
			cpage = pageTotalCount;
		}
		
		int startNavi = (cpage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
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

		StringBuilder sb = new StringBuilder();
		if(needPrev) sb.append("<a href='itnewsList?cpage=" + (startNavi - 1) + "'>< </a>");
		
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a id=page"+i+" href='itnewsList?cpage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		
		if(needNext) sb.append("<a href='itnewsList?cpage=" + (endNavi + 1) + "'>> </a>");
	
		System.out.println(sb.toString());
		return sb.toString();
	}
	
	
	
}
