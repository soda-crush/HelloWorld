package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;

@Repository
public class MemberInquiryDAO {
	
	@Autowired
	private SqlSessionTemplate jdbc;
	
	public List<InquiryDTO> getMyInquiryByPage(String id, int start, int end){//페이지별로 게시글 목록 받아오기
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("MemberInquiry.getMyInquiryByPage", param);
	}
	
	public int getMyInquiryTotal(String id) {//내 일대일문의글 총 갯수
		return jdbc.selectOne("MemberInquiry.getMyInquiryTotal", id);
	}
	
	public int getInquirySeq() {//이미지 업로드용 게시글 seq 받아오기
		return jdbc.selectOne("MemberInquiry.getInquirySeq");
	}
	
	public int insertImg(int boardSeq, String sysName) {//이미지 파일 db기록
		Map<String, Object> param = new HashMap<>();
		param.put("boardSeq", boardSeq);
		param.put("sysName", sysName);
		return jdbc.insert("MemberInquiry.insertImg", param);
	}
	
	public int writeInquiry(InquiryDTO dto) {//일대일 문의글 쓰기
		return jdbc.insert("MemberInquiry.writeInquiry", dto);
	}
	
	public InquiryDTO getMyInquiryBySeq(int seq) {//시퀀스로 내 문의글 내용 가져오기
		return jdbc.selectOne("MemberInquiry.getMyInquiryBySeq", seq);
	}
	
	public List<InquiryReplyDTO> getMyInquiryCo(int boardSeq){//문의글에 달린 댓글 가져오기
		return jdbc.selectList("MemberInquiry.getMyInquiryCo", boardSeq);
	}
	public List<String> getImgsByBoardSeq(int boardSeq){//문의글에 포함된 이미지 기록 가져오기
		return jdbc.selectList("MemberInquiry.getImgsByBoardSeq", boardSeq);
	}
	
	public int delImgsByBoardSeq(int boardSeq) {//이미지 테이블에서 삭제
		return jdbc.delete("MemberInquiry.delImgsByBoardSeq", boardSeq);
	}
	
	public int modifyInquiry(InquiryDTO dto) {//문의글 수정하기
		return jdbc.update("MemberInquiry.modifyInquiry", dto);
	}
	
	public int deleteInquiry(int seq) {//문의글 삭제(답변이 없는 경우에만 삭제 가능)
		return jdbc.delete("MemberInquiry.deleteInquiry", seq);
	}
	

}
