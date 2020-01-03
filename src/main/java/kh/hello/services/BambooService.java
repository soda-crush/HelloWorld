package kh.hello.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kh.hello.dao.BambooDAO;
import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;

@Service
public class BambooService {
	@Autowired
	private BambooDAO dao;
	
	//대나무숲 게시판 글
	public List<BambooDTO> bambooList(){
		return dao.selectAll();
	}
	
	@Transactional("txManager")
	public BambooDTO bambooDetailView(int seq) {
		dao.updateBambooViewCount(seq);
		return dao.getBambooDetailView(seq);
	}
	
	@Transactional("txManager")
	public int bambooWriteConfirm(BambooDTO dto) {
		dao.insertBamboo(dto);
		return dao.latestSeq(dto.getWriter());
	}
	
	public int bambooModifyConfirm(BambooDTO dto) {
		return dao.updateBamboo(dto);
	}
	
	@Transactional("txManager")
	public int bambooDeleteConfirm(int seq) {
		dao.deleteBambooAllCo(seq);
		return dao.deleteBamboo(seq);
	}
	
	//대나무숲 댓글
	
	public List<BambooCoDTO> commentList(int bamSeq) {
		return dao.getCoList(bamSeq);
	}
	
	@Transactional("txManager")
	public String commentWriteConfirm(BambooCoDTO dto) {
		dao.insertBambooCo(dto);
		BambooCoDTO comment = dao.getComment(dto.getBamSeq());
		JsonObject jobj = new JsonObject();
		jobj.addProperty("seq", comment.getSeq());
		jobj.addProperty("bamSeq", comment.getBamSeq());
		jobj.addProperty("writer", comment.getWriter());
		jobj.addProperty("content", comment.getContent());
		jobj.addProperty("writeDate", comment.getWriteDate().toString());
		
		return jobj.toString();
	}
	
	@Transactional("txManager")
	public String commentModifyConfirm(BambooCoDTO dto) {
		dao.updateBambooCo(dto);
		Gson gson = new Gson();
		JsonArray array = new JsonArray();
		List<BambooCoDTO> result = dao.getCoList(dto.getBamSeq());
		for(BambooCoDTO b : result) {
			array.add(gson.toJson(b));
		}
		return array.toString();
	}
	
	public int commentDeleteConfirm(int seq) {
		return dao.deleteBambooCo(seq);
	}
	
	public int commentsDeleteConfirm(int bamSeq) {
		return dao.deleteBambooAllCo(bamSeq);
	}
}
