package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.CodeCommentsDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.ScrapDTO;

@Repository
public class CodeDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	//글쓰기
	public int insert(CodeQuestionDTO dto) {
		return jdbc.insert("Code.insert",dto);
	}
	
	//게시판전체(답글수)
//	public List<CodeQuestionDTO> selectAll() throws Exception{
//		return jdbc.selectList("Code.selectAll");
//	}
	
	//게시판전체(페이징)
	public List<CodeQuestionDTO> selectQuestionAll(int start,int end) {
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Code.selectQuestionAll",param);
	}
	
	public int codeQuestionCount() {//총 게시글 수
		return jdbc.selectOne("Code.codeQuestionCount");
	}

	//가장 최신 글 번호 찾기
//	public int selectSeq(String id) {
//		return jdbc.selectOne("Code.selectSeq",id);
//	}
	
	//디테일
	public CodeQuestionDTO detailQuestion(int seq) {
		return jdbc.selectOne("Code.detailQuestion",seq);
	}
	
	//조회수 증가
	public int incrementViewCount(int seq) {
		return jdbc.update("Code.incrementViewCount",seq);
	}
	
	//게시판 삭제
	public int delete(int seq) {
		return jdbc.delete("Code.delete",seq);
	}
	
	public void modify(CodeQuestionDTO dto) {
		jdbc.update("Code.modify", dto);
	}
	
	//포인트
	public void writePoint(String id) {
		jdbc.update("Code.writePoint", id);
	}
	
	public void deleteWritePoint(String id) {
		jdbc.update("Code.deleteWritePoint", id);
	}
	
	//답글 ( CodeReply ) 
	public int insertR(CodeReplyDTO dto) {
		return jdbc.insert("CodeR.insert",dto);
	}
	
	public List<CodeReplyDTO> selectReplyAll() {
		return jdbc.selectList("CodeR.selectReplyAll");
	}
	
	public List<CodeReplyDTO> detailReply(int queSeq) {
		return jdbc.selectList("CodeR.detailReply",queSeq);
	}
	
	public int deleteR(int seq) {
		return jdbc.delete("CodeR.deleteR",seq);
	}
	
	public int replyOneCount(int queSeq,String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("queSeq", queSeq);
		map.put("id", id);
		return jdbc.selectOne("CodeR.replyOneCount",map);
	}
	
	public CodeReplyDTO selectOneDetail(int seq) {
		return jdbc.selectOne("CodeR.selectOneDetail",seq);
	}
	
	public void modifyR(CodeReplyDTO dto) {
		jdbc.update("CodeR.modifyR", dto);
	}
	
	
	//CodeComment
	
	public int selectRepSeq(int queSeq,String id) { //repSeq구하기
		Map<String,Object> param = new HashMap<>();
		param.put("queSeq", queSeq);
		param.put("id", id);
		Object result = jdbc.selectOne("CodeC.selectRepSeq",param);
		if(result == null) { //int null값 방지
			return 0;
		}
		return (int)result;
	}
	
	public List<CodeCommentsDTO> commentsList(int queSeq){
		return jdbc.selectList("CodeC.commentsList", queSeq);
	}
	public List<CodeCommentsDTO> commentsListUpdate(int repSeq){
		return jdbc.selectList("CodeC.commentsList", repSeq);
	}
	public int insertComment(CodeCommentsDTO dto) {
		return jdbc.insert("CodeC.insertComment", dto);
	}
//	public CodeCommentsDTO getComment(int repSeq) {
//		return jdbc.selectOne("CodeC.getComment", repSeq);
//	}
	public int updateComment(CodeCommentsDTO dto) {
		return jdbc.update("CodeC.updateComment", dto);
	}	
	public int deleteComment(int seq) {
		return jdbc.delete("CodeC.deleteComment", seq);
	}
	public int deleteReplyAllCo(int repSeq) {
		return jdbc.delete("CodeC.deleteReplyAllCo", repSeq);
	}
	//댓글 포인트
	public void writeCoPoint(String id) {
		jdbc.update("CodeC.writeCoPoint", id);
	}
	
	public void deleteCoPoint(String id) {
		jdbc.update("CodeC.deleteCoPoint", id);
	}
	
	
	//조건별 게시판목록 검색
	public int codeSearchTotalCount(String value,String search) {
		Map<String, String> param = new HashMap<>();
		param.put("value", value);
		param.put("search", search);
		return jdbc.selectOne("Code.codeSearchTotalCount", param);
	}
	public List<CodeQuestionDTO> codeSearchByPage (String start, String end, String value, String search) {//검색한 목록 페이지네비
		Map<String, String> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		param.put("value", value);
		param.put("search", search);
		return jdbc.selectList("Code.codeSearchByPage",param);
	}
	
	//이미지업로드 질문
		public int getCodeSeq() {
			return jdbc.selectOne("Code.getCodeSeq");
		}
		public int insertImg(int queSeq, String fileName) {
			Map<String, Object> param = new HashMap<>();
			param.put("queSeq", queSeq);
			param.put("fileName", fileName);
			return jdbc.insert("Code.insertImg", param);
		}
		
	//이미지업로드 답글
		public int getCodeRSeq() {
			return jdbc.selectOne("CodeR.getCodeRSeq");
		}
		public int insertRImg(int repSeq, String fileName) {
			Map<String, Object> param = new HashMap<>();
			param.put("repSeq", repSeq);
			param.put("fileName", fileName);
			return jdbc.insert("CodeR.insertRImg", param);
		}
		
	//스크랩
		public int scrapDupCheck(ScrapDTO dto) {
			return jdbc.selectOne("Code.scrapDupCheck", dto);
		}
		
		public int earlierSeq() {
			return jdbc.selectOne("Code.earlierSeq");
		}
		
		public int scrapCode(ScrapDTO dto) {
			return jdbc.insert("Code.scrapCode", dto);
		}
		
//		채택
		public int replyCount(int queSeq) {
			return jdbc.selectOne("CodeR.replyCount",queSeq);
		}
		
		public int selectPoint(String id) {
			return jdbc.selectOne("CodeR.selectPoint",id);
		}
	
}
