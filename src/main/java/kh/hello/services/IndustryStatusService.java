package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.hello.dao.IndustryStatusDAO;
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
