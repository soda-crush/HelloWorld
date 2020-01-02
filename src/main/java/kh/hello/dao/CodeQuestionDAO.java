package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.CodeQuestionDTO;

@Repository
public class CodeQuestionDAO {

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
}
