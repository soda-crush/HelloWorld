package kh.hello.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.hello.configuration.Configuration;
import kh.hello.dao.AdminDAO;
import kh.hello.dao.ChartDAO;
import kh.hello.dao.CountDAO;
import kh.hello.dto.BoardLogDTO;
import kh.hello.dto.ChartGenderDTO;
import kh.hello.dto.ChartGenerationDTO;
import kh.hello.dto.ChartJoinPathDTO;
import kh.hello.dto.ChartVisitChangeDTO;
import kh.hello.dto.ChartWorkDTO;
import kh.hello.dto.CommentLogDTO;
import kh.hello.dto.ForcedOutMemberDTO;
import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;
import kh.hello.dto.MemberDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adao;
	
	@Autowired
	private ChartDAO cdao;
	
	@Autowired
	private CountDAO ctdao;
	
	public int validLogin(String adminId, String password) {
		return adao.validLogin(adminId, password);
	}
	
	public int modifyInfo(String adminId, String password, String email) {
		return adao.modifyInfo(adminId, password, email);
	}
	
	public List<InquiryDTO> selectInquiryByPage(int start, int end){			
		return adao.selectInquiryByPage(start, end);
	}
	
	public List<String> getInquiryPageNavi(int currentPage) {				
		int recordTotalCount = adao.getInquiryTotal();
		int pageTotalCount = 0;
		
		if(recordTotalCount% Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();
		if(needPrev) pages.add("<a class=page-link href='inquiryList?page=" + (startNavi - 1) + "'>< </a>");
		
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='inquiryList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			pages.add(sb.toString());
		}
		
		if(needNext) pages.add("<a class=page-link href='inquiryList?page=" + (endNavi + 1) + "'>> </a>");
	
		return pages;
	}
	
	public InquiryDTO inquiryDetailView(int seq) {
		return adao.inquiryDetailView(seq);
	}
	
	public List<InquiryReplyDTO> getInquiryReply(int boardSeq) {
		return adao.getInquiryReply(boardSeq);
	}
	
	@Transactional("txManager")
	public InquiryReplyDTO writeInquiry(String reply, int boardSeq) {
		//1. 댓글 입력
		int result = adao.writeInquiry(reply, boardSeq);
		//2. 일대일 문의글 댓글 수 +1
		result = adao.plusInquiryCount(boardSeq);
		if(result > 0) {
			//3. 댓글 내용 받아오기 (1. 마지막 시퀀스 2. 댓글 내용)
			int seq = adao.getLatestReplySeq();
			return adao.getLatestReply(seq);
		}else {
			return null;
		}
		
	}
	
	@Transactional("txManager")
	public int deleteInquiryReply(int seq, int boardSeq) {
		//댓글 삭제
		int result = adao.deleteInquiryReply(seq);
		//일대일문의글 댓글수 -1
		if(result > 0) {
			result = adao.minusInquiryCount(boardSeq);
		}
		return result;
	}
	
	public List<MemberDTO> memberListByPage(int start, int end){
		return adao.memberListByPage(start, end);
	}
	
	public List<String> getMemberPageNavi(int currentPage){
		int memberTotalCount = adao.getMemberTotal();
		int pageTotalCount = 0;
		if(memberTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = memberTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = memberTotalCount / Configuration.recordCountPerPage;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();
		if(needPrev) pages.add("<a class=page-link href='memberList?page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='memberList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='memberList?page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;
	}
	
	public MemberDTO getMemberInfo(String id) {
		return adao.getMemberInfo(id);
	}
	
	public int memberModify(String id, String email, String phone) {
		return adao.memberModify(id, email, phone);
	}
	
	public int memberStop(String id) {
		return adao.memberStop(id);
	}
	
	public int memberStart(String id) {
		return adao.memberStart(id);
	}
	
	@Transactional("txManager")
	public int memberOut(String id, String reason) {
		//강퇴시키고
		adao.memberOut(id);
		//이메일 정보 받아오기
		String email = adao.getEmailById(id);
		//테이블에 입력하기		
		return adao.memberOutList(id, email, reason);		 
	}
	
	public List<ForcedOutMemberDTO> forcedOutListByPage(int start, int end) {
		return adao.forcedOutListByPage(start, end);
	}
	
	public List<String> getForcedOutPageNavi(int currentPage){
		int outTotalCount = adao.getForcedOutTotal();
		int pageTotalCount = 0;
		
		if(outTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = outTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = outTotalCount / Configuration.recordCountPerPage;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();
		if(needPrev) pages.add("<a class=page-link href='forcedOutList?page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='forcedOutList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='forcedOutList?page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;
	}
	
	public int forcedOutDel(int seq) {
		//회원 정보에서 이메일 정보 지워주기(재가입 가능)
		adao.delEmail(seq);
		//강퇴 목록에서 지우기
		return adao.forcedOutDel(seq);		 
	}
	
	public List<MemberDTO> getSearchMemberListByPage(String col, String searchWord, int start, int end){
		return adao.getSearchMemberListByPage(col, searchWord, start, end);
	}
	
	public List<String> getSearchMemberListPageNavi(int currentPage, String col, String searchWord){
		int searchResultTotalCount = adao.getSearchMemberResultTotal(col, searchWord);
		int pageTotalCount = 0;
		
		if(searchResultTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = searchResultTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = searchResultTotalCount / Configuration.recordCountPerPage;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();

		if(needPrev) pages.add("<a class=page-link href='searchMember?col="+col+"&searchWord="+searchWord+"&page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='searchMember?col="+col+"&searchWord="+searchWord+"&page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='searchMember?col="+col+"&searchWord="+searchWord+"&page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;
	}
	
	public List<MemberDTO> getBlackList(int start, int end){
		return adao.getBlackList(start, end);
	}
	
	public List<String> getBlackListPageNavi(int currentPage){
		int blackListTotalCount = adao.getBlackListTotal();
		int pageTotalCount = 0;
		
		if(blackListTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = blackListTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = blackListTotalCount / Configuration.recordCountPerPage;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();

		if(needPrev) pages.add("<a class=page-link href='blackList?page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='blackList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='blackList?page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;		
	}
	
	public List<MemberDTO> searchBlackListByPage(String col, String searchWord, int start, int end){
		return adao.getSearchBlackListByPage(col, searchWord, start, end);
	}
	
	public List<String> getSearchBlackListPageNavi(int currentPage, String col, String searchWord){
		int searchBlackTotalCount = adao.getSearchBlackResultTotal(col, searchWord);
		int pageTotalCount = 0;
		
		if(searchBlackTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = searchBlackTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = searchBlackTotalCount / Configuration.recordCountPerPage;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();

		if(needPrev) pages.add("<a class=page-link href='searchBlack?col="+col+"&searchWord="+searchWord+"&page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='searchBlack?col="+col+"&searchWord="+searchWord+"&page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='searchBlack?col="+col+"&searchWord="+searchWord+"&page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;
	}
	
	public Map<String, Integer> getVisitorCount() throws Exception{		
		Map<String, Integer> result = new HashMap<>();
		result.put("today", ctdao.getVisitTodayCount());
		result.put("total", ctdao.getVisitTotalCount());
		return result;
	}
	
	public List<ChartVisitChangeDTO> getVisitChange(){
		return cdao.getVisitChange();
	}
	
	public List<ChartGenderDTO> getGenderRatio(){
		return cdao.getGenderRatio();
	}
	
	public List<ChartJoinPathDTO> getJoinPath(){
		return cdao.getJoinPath();
	}
	
	public List<ChartWorkDTO> getWorkRatio(){
		return cdao.getWorkRatio();
	}
	
	public List<ChartGenerationDTO> getGenerationRatio(){
		return cdao.getGenerationRatio();
	}
	
	public List<MemberDTO> getTop5List(){
		return cdao.getTop5List();
	}
	
	public List<BoardLogDTO> getBoardLog(){
		return cdao.getBoardLog();
	}
	
	public List<CommentLogDTO> getComLog(){
		return cdao.getComLog();
	}
}





