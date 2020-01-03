package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;

@Repository
public class CodeDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	//글쓰기
	public int insert(CodeQuestionDTO dto) throws Exception{
		return jdbc.insert("Code.insert",dto);
	}
	
	//게시판전체
	public List<CodeQuestionDTO> selectQuestionAll() throws Exception{
		return jdbc.selectList("Code.selectQuestionAll");
	}
	
	//가장 최신 글 번호 찾기
	public int selectSeq(String writer) throws Exception{
		return jdbc.selectOne("Code.selectSeq",writer);
	}
	
	//디테일
	public CodeQuestionDTO detailQuestion(int seq) throws Exception{
		return jdbc.selectOne("Code.detailQuestion",seq);
	}
	
	//조회수 증가
	public int incrementViewCount(int seq) throws Exception{
		return jdbc.update("Code.incrementViewCount",seq);
	}
	
	//게시판 삭제
	public int delete(int seq) throws Exception{
		return jdbc.delete("Code.delete",seq);
	}
	
	//답글 ( CodeReply ) 
//	public int selectParentSeq(int seq) throws Exception{
//		return jdbc.selectOne("CodeR.selectParentSeq",seq);
//	}

	public int insertR(CodeReplyDTO dto) throws Exception{
		return jdbc.insert("CodeR.insert",dto);
	}
	
	public List<CodeReplyDTO> selectReplyAll() throws Exception{
		return jdbc.selectList("CodeR.selectReplyAll");
	}
	
	public List<CodeReplyDTO> detailReply(int seq) throws Exception{
		return jdbc.selectList("CodeR.detailReply",seq);
	}
	
	public int deleteR(int seq) throws Exception{
		return jdbc.delete("CodeR.deleteR",seq);
	}
	
	
	
	
	
	//CodeCommentsDAO
	
	
	
	
	
//	public List<CodeCommentsDTO> getCoList(int projectSeq){//프로젝트 모집댓글 전체리스트(해당글에 대한)
//		return jdbc.selectList("ProjectCo.getList", projectSeq);
//	}
//	public int insertProjectCo(CodeCommentsDTO dto) {//프로젝트 모집댓글 작성
//		return jdbc.insert("ProjectCo.insertProjectCo", dto);
//	}	
//	public int updateProjectCo(CodeCommentsDTO dto) {//프로젝트 모집댓글 수정
//		return jdbc.update("ProjectCo.updateProjectCo", dto);
//	}	
//	public int deleteProjectCo(int seq) {//프로젝트 모집댓글 삭제(개별)
//		return jdbc.delete("ProjectCo.deleteProjectCo", seq);
//	}
//	public int deleteProjectAllCo(int projectSeq) {//프로젝트 모집댓글 삭제(글에 달린 모든댓글)
//		return jdbc.delete("ProjectCo.deleteProjectAllCo", projectSeq);
//	}
	
}
