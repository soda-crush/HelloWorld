package kh.hello.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.configuration.Configuration;
import kh.hello.dto.CodeCommentsDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;
import kh.hello.dto.ProjectCoDTO;

@Repository
public class CodeDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	//글쓰기
	public int insert(CodeQuestionDTO dto) throws Exception{
		return jdbc.insert("Code.insert",dto);
	}
	
	//게시판전체
	public List<CodeQuestionDTO> selectQuestionAll(int start,int end) throws Exception{
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
	
	//페이지 내비게이터
	public String getPageNavi(int currentPage,int Start,int end) throws Exception {
		//설정 값들은 지역변수로 말고 Static으로 만들어서 나중에 쓸때 쓰는게 좋다. 
		int recordTotalCount = this.selectQuestionAll(Start,end).size();  // 알아야할점 1 : 게시판 내의 총 글의 개수     ***DB에서 값 받아 오는 값 / 레코드 개수를 불러오는 함수 부르기
							// this.getArticleCount();
		//int recordCountPerPage = 10; // 알아야할점 2 : 한페이지에서 몇개의 글을 보여줄 지 설정
		//int naviCountPerPage = 10;   // 알아야할점 3 : 한페이지에서 몇개의 네비게이터를 보여줄 지 설정
		int pageTotalCount = 0; // 총 몇개의 페이지 인가
		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			//총 글의 개수를 페이지당 보여줄 개수로 나누었을때, 나머지가 생기면 총 페이지의 개수 +1을 한다.(143/10=15여야함)
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		//int currentPage = 7; // 현재 내가 위치하는 페이지,클릭하면 서블릿한테 전송해서 dao로 받아야함.
		
		// 페이지 1이하 숫자가 나올수가 없음, 보안 강화 
		if(currentPage < 1) { 
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {  // 현재 페이지 번호 비정상적인 숫자를 가질 때에 대한 보안 코드
			currentPage = pageTotalCount;
		}
		
		//현재 내가 위치하고 있는 페이지에 따라 네비게이터 시작 페이지 값을 구하는 공식
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1 ;
		// (30-1) / 10 * 10 +1 = 21
		int endNavi = startNavi + Configuration.naviCountPerPage - 1; // 21 + 10 -1 = 30
		
		// 페이지 끝 값이 비정상 값일 때 조정하는 보안 코드
		if(endNavi > pageTotalCount) { 
			endNavi = pageTotalCount;
		}

		boolean needPrev = true; // 이전이 필요한가
		boolean needNext = true; // 다음이 필요한가
		
		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		StringBuilder sb = new StringBuilder(); // 문자열 연결할때 플러스말고 세련되게 하기. ( 클래스로 만들어둠 )
		if(needPrev) {sb.append("<a href='codeQList.do?cpage="+(startNavi-1)+"'> < </a>");};
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a class='page' href='codeQList.do?cpage="+i+"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		if(needNext) {sb.append("<a class='page' href='codeQList.do?cpage="+(endNavi+1)+"'> > </a>");};
		return sb.toString();
	//------페이지 내비게이터
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

	public int insertComment(CodeCommentsDTO dto) {
		return jdbc.insert("CodeC.insertComment", dto);
	}
	public List<CodeCommentsDTO> commentsList(int repSeq){
		return jdbc.selectList("CodeC.commentsList", repSeq);
	}
	public int updateComment(CodeCommentsDTO dto) {
		return jdbc.update("CodeC.updateComment", dto);
	}	
	public int deleteComment(int seq) {
		return jdbc.delete("CodeC.deleteComment", seq);
	}
	
	
	
	
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
