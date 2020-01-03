package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;
import kh.hello.dto.MemberDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int validLogin(String adminId, String password) {//관리자 로그인
		Map<String, String> param = new HashMap<>();
		param.put("adminId", adminId);
		param.put("password", password);
		return jdbc.selectOne("Admin.validLogin", param);
	}
	
	public int modifyInfo(String adminId, String password, String email) {//비밀번호/이메일 수정
		Map<String, String> param = new HashMap<>();
		param.put("adminId", adminId);
		param.put("password", password);
		param.put("email", email);
		return jdbc.update("Admin.modifyInfo", param);
	}
	
	public List<InquiryDTO> selectInquiryByPage(int start, int end){//일대일 문의 게시판 글 목록 받아오기(페이징O)
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Admin.selectInquiryByPage", param);		
	}
	
	public int getInquiryTotal() {//일대일 문의 총게시글 수
		return jdbc.selectOne("Admin.getInquiryTotal");
	}
	
	public InquiryDTO inquiryDetailView(int seq) {//일대일 문의 디테일뷰
		return jdbc.selectOne("Admin.inquiryDetailView", seq);
	}
	
	public List<InquiryReplyDTO> getInquiryReply(int boardSeq) {//게시글 댓글 받아오기
		return jdbc.selectList("Admin.getInquiryReply", boardSeq);
	}
	
	public int writeInquiry(String reply, int boardSeq) {//댓글쓰기(관리자만 가능)
		Map<String, Object> param = new HashMap<>();
		param.put("reply", reply);
		param.put("boardSeq", boardSeq);
		return jdbc.insert("Admin.writeInquiry", param);
	}
	
	public int updateInquiryState(int seq) {//일대일 문의 말머리 변경
		return jdbc.update("Admin.updateInquiryState", seq);
	}
	
	public int getLatestReplySeq() {
		return jdbc.selectOne("Admin.getLatestReplySeq");
	}
	
	public InquiryReplyDTO getLatestReply(int seq) {
		return jdbc.selectOne("Admin.getLatestReply", seq);
	}
	
	public int deleteInquiryReply(int seq) {
		return jdbc.delete("Admin.deleteInquiryReply", seq);
	}
	
	public List<MemberDTO> memberList(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Admin.memberList", param);
	}
	
	public int getMemberTotal(){
		return jdbc.selectOne("Admin.getMemberTotal");
	}
	
}
















