package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.dto.ScrapDTO;

@Repository
public class IndustryStatusDAO {

	@Autowired
	private SqlSessionTemplate jdbc;

	//업계현황 게시판

	public IndustryStatusDTO getIndustryStatusDetailView(int seq) {
		return jdbc.selectOne("Industry.getIndustryStatusDetailView", seq);
	}
	//글쓰기 누를 때 실무자 유무 검사
	public int getMemLevel (String id) {
		return jdbc.selectOne("Industry.getMemLevel",id);
	}
	public int insertIndustryStatus(IndustryStatusDTO dto) {
		return jdbc.insert("Industry.insertIndustryStatus", dto);
	}	
	public int updateIndustryStatus(IndustryStatusDTO dto) {
		return jdbc.update("Industry.updateIndustryStatus", dto);
	}
	public int updateIndustryStatusViewCount(int seq) {
		return jdbc.update("Industry.updateIndustryStatusViewCount", seq);
	}
	public int deleteIndustryStatus(int seq) {
		return jdbc.delete("Industry.deleteIndustryStatus", seq);
	}

	//페이지네비
	public int recordIndustryListTotalCount () {// 전체리스트 수
		return jdbc.selectOne("Industry.recordIndustryListTotalCount");
	}
	public List<IndustryStatusDTO> industryListByPage (int start, int end) {// 목록 페이지네비
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Industry.industryListByPage",param);
	}
	//업계현황 댓글

	public List<IndustryStatusCoDTO> getCoList(int indSeq){
		return jdbc.selectList("IndustryCo.getList", indSeq);
	}
	public int insertIndustryStatusCo(IndustryStatusCoDTO dto) {
		return jdbc.insert("IndustryCo.insertIndustryStatusCo", dto);
	}
	public IndustryStatusCoDTO getComment(int indSeq) {
		return jdbc.selectOne("IndustryCo.getComment", indSeq);
	}
	public int updateIndustryStatusCo(IndustryStatusCoDTO dto) {
		return jdbc.update("IndustryCo.updateIndustryStatusCo", dto);
	}	
	public int deleteIndustryStatusCo(int seq) {
		return jdbc.delete("IndustryCo.deleteIndustryStatusCo", seq);
	}
	public int deleteIndustryStatusAllCo(int indSeq) {
		return jdbc.delete("IndustryCo.deleteIndustryStatusAllCo", indSeq);
	}

	//조건별 게시판목록 검색
	public int industrySearchTotalCount(String value,String search) {
		Map<String, String> param = new HashMap<>();
		param.put("value", value);
		param.put("search", search);
		return jdbc.selectOne("Industry.industrySearchTotalCount", param);
	}
	public List<IndustryStatusDTO> industrySearchListByPage (String start, String end, String value, String search) {//검색한 업계현황 목록 페이지네비
		Map<String, String> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("value", value);
		param.put("search", search);
		return jdbc.selectList("Industry.industrySearchByPage",param);
	}

	//이미지업로드
	public int getIndustrySeq() {
		return jdbc.selectOne("Industry.getIndustrySeq");
	}
	public int insertImg(int indSeq, String fileName) {
		Map<String, Object> param = new HashMap<>();
		param.put("indSeq", indSeq);
		param.put("fileName", fileName);
		return jdbc.insert("Industry.insertImg", param);
	}

	//포인트
	public void writePoint(String id) {
		jdbc.update("Industry.writePoint", id);
	}
	public void deleteWritePoint(String id) {
		jdbc.update("Industry.deleteWritePoint", id);
	}

	//포인트 -면 강등
	public int downLevel() {
		return jdbc.update("Industry.downLevel");
	}

	//스크랩
	public int scrapDupCheck(ScrapDTO dto) {
		return jdbc.selectOne("Industry.scrapDupCheck", dto);
	}

	public int earlierSeq() {
		return jdbc.selectOne("Industry.earlierSeq");
	}

	public int scrapCode(ScrapDTO dto) {
		return jdbc.insert("Industry.scrapCode", dto);
	}

	//reportedBoard 테이블
	public int reportDuplCheck(String id, int seq) {
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("seq", seq);
		return jdbc.selectOne("Industry.reportDuplCheck", param);
	}
	public int insertReport(ReportDTO dto) {
		return jdbc.insert("Industry.insertReport", dto);
	}
}
