package kh.hello.dao;

import java.util.List;

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
	public List<BambooDTO> selectAll() {//대나무숲 게시판 목록
		return jdbc.selectList("Bamboo.selectAll");
	}
	
	public BambooDTO getBambooDetailView(int seq) {//대나무숲 상세보기
		return jdbc.selectOne("Bamboo.getBambooDetailView", seq);
	}
	public int latestSeq(String writer) {//작성자 가장 최근글(작성/수정 직후 디테일뷰)
		return jdbc.selectOne("Bamboo.latestSeq", writer);
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
}
