package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.GuestBookDTO;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsCoDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;

@Repository
public class AdBoardDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	/* 
	 * 프로젝트 
	 */
	public List<ProjectDTO> getProjectListPerPage(int start, int end){//페이지 별로 목록 가져오기
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("AdBoard.projectListByPage", param);
	}
	
	public int getProjectTotal() {//게시물 수 받아오기
		return jdbc.selectOne("AdBoard.getProjectTotal");
	}
	
	public int delProjectAllCo(int projectSeq) {//게시물 지울 때 모든 댓글 삭제
		return jdbc.delete("AdBoard.delProjectAllCo", projectSeq);
	}
	
	public int delProject(int seq) {//게시글 삭제
		return jdbc.delete("AdBoard.delProject", seq);
	}
	
	public ProjectDTO detailViewProject(int seq) {//게시글 보기
		return jdbc.selectOne("AdBoard.detailViewProject", seq);
	}
	
	public List<ProjectCoDTO> getProjectCo(int projectSeq){//게시글에 있는 댓글 받아오기
		return jdbc.selectList("AdBoard.getProjectCo", projectSeq);
	}
	
	public int delProjectCo(int seq) {//댓글 하나 삭제(내용을 null로 set)
		return jdbc.update("AdBoard.delProjectCo", seq);
	}
	
	/* 
	 * 방명록
	 */	
	
	public List<GuestBookDTO> guestBookListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("AdBoard.guestBookListByPage", param);
	}
	
	public int getGuestBookTotal() {
		return jdbc.selectOne("AdBoard.getGuestBookTotal");
	}
	
	public int delGuestBook(int seq) {
		return jdbc.delete("AdBoard.delGuestBook", seq);
	}
	
	/*
	 * 대나무숲 
	 */
	
	public List<BambooDTO> bambooListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		
		return jdbc.selectList("AdBoard.bambooListByPage", param);
	}
	
	public int getBambooTotal() {
		return jdbc.selectOne("AdBoard.getBambooTotal");
	}
	
	public int delBambooAllCo(int bamSeq) {
		return jdbc.delete("AdBoard.delBambooAllCo", bamSeq);
	}
	
	public int delBamboo(int seq) {
		return jdbc.delete("AdBoard.delBamboo", seq);
	}
	
	public BambooDTO detailViewBamboo(int seq) {
		return jdbc.selectOne("AdBoard.detailViewBamboo", seq);
	}
	
	public List<BambooCoDTO> getBambooCo(int bamSeq){
		return jdbc.selectList("AdBoard.getBambooCo", bamSeq);
	}
	
	public int delBambooCo(int seq) {
		return jdbc.delete("AdBoard.delBambooCo", seq);
	}
	
	/* 
	 * 업계현황
	 */
	
	public List<IndustryStatusDTO> industryListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);		
		
		return jdbc.selectList("AdBoard.industryListByPage", param);
	}
	
	public int getIndustryTotal() {
		return jdbc.selectOne("AdBoard.getIndustryTotal");
	}
	
	public int delIndustryAllCo(int indSeq) {
		return jdbc.delete("AdBoard.delIndustryAllCo", indSeq);
	}
	
	public int delIndustry(int seq) {
		return jdbc.delete("AdBoard.delIndustry", seq);
	}
	
	public IndustryStatusDTO detailViewIndustry(int seq) {
		return jdbc.selectOne("AdBoard.detailViewIndustry", seq);
	}
	
	public List<IndustryStatusCoDTO> getIndustryCo(int indSeq){
		return jdbc.selectList("AdBoard.getIndustryCo", indSeq);
	}
	
	public int delIndustryCo(int seq) {
		return jdbc.delete("AdBoard.delIndustryCo", seq);
	}
		
	/* 
	 * IT뉴스
	 */
	
	public List<ItnewsDTO> itnewsListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);	
		return jdbc.selectList("AdBoard.itnewsListByPage", param);
	}
	
	public int getItnewsTotal() {
		return jdbc.selectOne("AdBoard.getItnewsTotal");
	}
	
	public int delItnewsAllCo(int itSeq) {
		return jdbc.delete("AdBoard.delItnewsAllCo", itSeq);
	}
	
	public int delItnews(int seq) {
		return jdbc.delete("AdBoard.delItnews", seq);
	}
	
	public ItnewsDTO detailViewItnews(int seq) {
		return jdbc.selectOne("AdBoard.detailViewItnews", seq);
	}
	
	public List<ItnewsCoDTO> getItnewsCo(int itSeq){
		return jdbc.selectList("AdBoard.getItnewsCo", itSeq);
	}
	
	public int delItnewsCo(int seq) {
		return jdbc.delete("AdBoard.delItnewsCo", seq);
	}

	/* 
	 * code-how
	 */
	
	public List<CodeQuestionDTO> cohowListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);			
		return jdbc.selectList("AdBoard.cohowListByPage", param);
	}
	
	public int getCohowTotal() {
		return jdbc.selectOne("AdBoard.getCohowTotal");
	}

}
