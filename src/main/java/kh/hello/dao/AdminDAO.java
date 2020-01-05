package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ForcedOutMemberDTO;
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
	public int plusInquiryCount(int seq) {//일대일 문의 댓글수 +1
		return jdbc.update("Admin.plusInquiryCount", seq);
	}
	public int getLatestReplySeq() {//일대일문의 가장 마지막 댓글  seq 받아오기
		return jdbc.selectOne("Admin.getLatestReplySeq");
	}
	
	public InquiryReplyDTO getLatestReply(int seq) {//일대일문의 가장 마지막 댓글 받아오기
		return jdbc.selectOne("Admin.getLatestReply", seq);
	}
	
	public int deleteInquiryReply(int seq) {//일대일문의 댓글 삭제
		return jdbc.delete("Admin.deleteInquiryReply", seq);
	}
	
	public int minusInquiryCount(int seq) {
		return jdbc.update("Admin.minusInquiryCount", seq);
	}
	
	public List<MemberDTO> memberListByPage(int start, int end){//회원목록 페이지별로 받아오기
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Admin.memberListByPage", param);
	}
	
	public int getMemberTotal(){//총 회원수
		return jdbc.selectOne("Admin.getMemberTotal");
	}
	
	public MemberDTO getMemberInfo(String id) {//회원 정보 받기
		return jdbc.selectOne("Admin.getMemberInfo", id);
	}
	
	public int memberModify(String id, String email, String phone) {//회원 이메일,전화번호 수정
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("email", email);
		param.put("phone", phone);
		return jdbc.update("Admin.memberModify", param);
	}
	
	public int memberStop(String id) {//활동정지(레벨1로 만들기)
		return jdbc.update("Admin.memberStop", id);
	}
	
	public int memberStart(String id) {//활동정지 해제(레벨2로 만들기)
		return jdbc.update("Admin.memberStart", id);
	}
	
	public int memberOut(String id) {//회원 강제탈퇴
		return jdbc.delete("Admin.memberOut", id);
	}
	
	public int memberOutList(String id, String reason) {//강제탈퇴 리스트
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("reason", reason);		
		return jdbc.insert("Admin.memberOutList", param);				
	}
	
	public List<ForcedOutMemberDTO> forcedOutListByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Admin.forcedOutListByPage", param);
	}
	
	public int getForcedOutTotal() {
		return jdbc.selectOne("Admin.getForcedOutTotal");
	}
	
	public int forcedOutDel(int seq) {
		return jdbc.delete("Admin.forcedOutDel", seq);
	}
	
	public List<MemberDTO> getSearchMemberListByPage(String col, String searchWord, int start, int end){
		Map<String, Object> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("col", col);
		param.put("searchWord", "%"+searchWord+"%");
		return jdbc.selectList("Admin.getSearchMemberListByPage", param);
	}
	
	public int getSearchMemberResultTotal(String col, String searchWord) {
		Map<String, String> param = new HashMap<>();
		param.put("col", col);
		param.put("searchWord", "%"+searchWord+"%");
		return jdbc.selectOne("Admin.getSearchMemberResultTotal", param);
	}
}
















