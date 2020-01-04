package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.hello.configuration.Configuration;
import kh.hello.dao.AdminDAO;
import kh.hello.dto.ForcedOutMemberDTO;
import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;
import kh.hello.dto.MemberDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adao;
	
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
		//테이블에 입력하기		
		return adao.memberOutList(id, reason);		 
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
		return adao.forcedOutDel(seq);
	}
}





