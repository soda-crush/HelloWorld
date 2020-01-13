package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.configuration.Configuration;
import kh.hello.dto.ItnewsCoDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ItnewsImgDTO;
import kh.hello.dto.ScrapDTO;

@Repository
public class ItnewsDAO {
	
	@Autowired 
	private SqlSessionTemplate jdbc;
	
	public List<ItnewsDTO> getItnewsList(){
		return jdbc.selectList("Itnews.getList");
	}
	
	public ItnewsDTO getItnewsDTO(int seq){
		return jdbc.selectOne("Itnews.getDTO", seq);
	}
	
	public String getPageNavi(int cpage){
		return "";
	}
	
	public List<ItnewsDTO> selectByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Itnews.selectByPage", param);
	}
	
	public List<ItnewsDTO> selectByPageSearch(int start, int end, String cate, String search){
		Map<String, Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("cate", cate);
		param.put("search", search);
		return jdbc.selectList("Itnews.selectByPageSrch", param);
	}

	public int getItnewsTotal(){
		return jdbc.selectOne("Itnews.getTotal");
	}
	
	public int getItnewsTotalSearch(String cate, String search) {
		Map<String, String> param = new HashMap<>();
		param.put("cate", cate);
		param.put("search", search);
		return jdbc.selectOne("Itnews.getTotalSearch", param);
	}
	
	public int getItnewsSeq() {
		return jdbc.selectOne("Itnews.getItnewsSeq");
	}
	
	public int writeItnews(ItnewsDTO dto) {
		return jdbc.insert("Itnews.writeItnews", dto);
	}
	
	public int modifyItnews(ItnewsDTO dto) {
		return jdbc.update("Itnews.updateItnews", dto);
	}
	
	public int removeItnews(int seq) {
		return jdbc.delete("Itnews.remove", seq);
	}
	
	public int coWrite(ItnewsCoDTO dto) {
		return jdbc.insert("Itnews.insertComment", dto);
	}
	
	public List<ItnewsCoDTO> commentList(int seq){
		return jdbc.selectList("Itnews.coList", seq);
	}
	
	public int removeItnewsCo(int itSeq, int seq) {
		Map<String, Integer> param = new HashMap<>(); 
		param.put("itSeq", itSeq);
		param.put("seq", seq);
		return jdbc.delete("Itnews.coRemove", param);
	}
	
	public int removeItnewsCoAll(int seq) {
		return jdbc.delete("Itnews.coAllRemove",seq);
	}
	
	public int modifyItnewsCo(ItnewsCoDTO dto) {
		return jdbc.delete("Itnews.coModify",dto);
	}
	
	public int getItSeqBySeq(int seq) {
		return jdbc.selectOne("Itnews.getItSeqBySeq", seq);
	}
	
	public int scrapDupCheck(ScrapDTO dto) {
		return jdbc.selectOne("Itnews.scrapDupCheck", dto);
	}
	
	public int earlierSeq() {
		return jdbc.selectOne("Itnews.earlierSeq");
	}
	
	public int scrapItnews(ScrapDTO dto) {
		return jdbc.insert("Itnews.scrapItnews", dto);
	}
	
	public int increViewCount(int seq) {
		return jdbc.update("Itnews.increViewCount", seq);
	}
	
	public int insertImg(ItnewsImgDTO dto){
		return jdbc.insert("Itnews.insertImg", dto);
	}
	
	//글쓰기 포인트 증가
	public int increPoint(String id) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("point",Configuration.articleAddPoint);
		
		return jdbc.update("Itnews.changePoint", param);
	}
	
	//글삭제 포인트 차감
	public int decrePoint(String id) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("point",Configuration.articleDelPoint);
		
		return jdbc.update("Itnews.changePoint", param);
	}
	
	//댓글쓰기 포인트 증가
	public int increCoPoint(String id) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("point",Configuration.commentAddPoint);
		
		return jdbc.update("Itnews.changePoint", param);
	}
	
	//댓글쓰기 포인트 차감
	public int decreCoPoint(String id) {
		Map<String,Object> param = new HashMap<>();
		param.put("id", id);
		param.put("point",Configuration.commentDelPoint);
		
		return jdbc.update("Itnews.changePoint", param);
	}
	
	//글 시퀀스로 아이디 불러오기
	public String getIdBySeq(int seq) {
		return jdbc.selectOne("Itnews.getIdBySeq", seq);
	}
	
	//댓글 시퀀스로 아이디 불러오기
	public String getIdByCoSeq(int seq) {
		return jdbc.selectOne("Itnews.getIdByCoSeq", seq);
	}
	
}
