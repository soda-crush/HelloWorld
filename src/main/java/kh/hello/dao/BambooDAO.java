package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;

@Repository
public class BambooDAO {
	@Autowired
	private SqlSessionTemplate jdbc;

	//대나무숲 글


	public BambooDTO getBambooDetailView(int seq) {//대나무숲 상세보기
		return jdbc.selectOne("Bamboo.getBambooDetailView", seq);
	}
	//글쓰기 누를 때 실무자 유무 검사
	public int getMemLevel (String id) {
		return jdbc.selectOne("Bamboo.getMemLevel",id);
	}
	public int insertBamboo(BambooDTO dto) {//대나무숲 글작성
		return jdbc.insert("Bamboo.insertBamboo", dto);
	}	
	public int updateBamboo(BambooDTO dto) {//대나무숲 글수정
		return jdbc.update("Bamboo.updateBamboo", dto);
	}
	public int updateBambooViewCount(int seq) {//대나무숲 조회수+1
		return jdbc.update("Bamboo.updateBambooViewCount", seq);
	}
	public int deleteBamboo(int seq) {//대나무숲 글삭제
		return jdbc.delete("Bamboo.deleteBamboo", seq);
	}


	public int recordBambooListTotalCount () {//대나무숲 전체리스트 수
		return jdbc.selectOne("Bamboo.recordBambooListTotalCount");
	}
	public List<BambooDTO> bambooListByPage (int start, int end) {//대나무숲 목록 페이지네비
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Bamboo.bambooListByPage",param);
	}

	//대나무숲 댓글

	public List<BambooCoDTO> getCoList(int bamSeq){//대나무숲 댓글리스트
		return jdbc.selectList("BambooCo.getList", bamSeq);
	}
	public int insertBambooCo(BambooCoDTO dto) {//대나무숲 댓글작성
		return jdbc.insert("BambooCo.insertBambooCo", dto);
	}
	public BambooCoDTO getComment(int bamSeq) {
		return jdbc.selectOne("BambooCo.getComment", bamSeq);
	}
	public int updateBambooCo(BambooCoDTO dto) {//대나무숲 댓글수정
		return jdbc.update("BambooCo.updateBambooCo", dto);
	}	
	public int deleteBambooCo(int seq) {//대나무숲 댓글 삭제(개별)
		return jdbc.delete("BambooCo.deleteBambooCo", seq);
	}
	public int deleteBambooAllCo(int bamSeq) {//대나무숲 댓글 삭제(글에 달린 모든댓글)
		return jdbc.delete("BambooCo.deleteBambooAllCo", bamSeq);
	}

	//조건별 게시판목록 검색
	public int bambooSearchTotalCount(String value,String search) {
		Map<String, String> param = new HashMap<>();
		param.put("value", value);
		param.put("search", search);
		return jdbc.selectOne("Bamboo.bambooSearchTotalCount", param);
	}
	public List<BambooDTO> bambooSearchListByPage (String start, String end, String value, String search) {//검색한 대나무숲 목록 페이지네비
		Map<String, String> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("value", value);
		param.put("search", search);
		return jdbc.selectList("Bamboo.bambooSearchByPage",param);
	}

	//이미지업로드
	public int getBambooSeq() {
		return jdbc.selectOne("Bamboo.getBambooSeq");
	}
	public int insertImg(int bamSeq, String fileName) {
		Map<String, Object> param = new HashMap<>();
		param.put("bamSeq", bamSeq);
		param.put("fileName", fileName);
		return jdbc.insert("Bamboo.insertImg", param);
	}

	//포인트
	public void writePoint(String writer) {
		jdbc.update("Bamboo.writePoint", writer);
	}
	public void deleteWritePoint(String writer) {
		jdbc.update("Bamboo.deleteWritePoint", writer);
	}
}
