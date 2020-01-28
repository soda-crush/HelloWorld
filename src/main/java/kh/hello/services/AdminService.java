package kh.hello.services;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import kh.hello.configuration.Configuration;
import kh.hello.dao.AdminDAO;
import kh.hello.dao.ChartDAO;
import kh.hello.dao.CountDAO;
import kh.hello.dto.BoardLogDTO;
import kh.hello.dto.ChartGenderDTO;
import kh.hello.dto.ChartGenerationDTO;
import kh.hello.dto.ChartJoinPathDTO;
import kh.hello.dto.ChartMainDTO;
import kh.hello.dto.ChartVisitChangeDTO;
import kh.hello.dto.ChartWorkDTO;
import kh.hello.dto.CommentLogDTO;
import kh.hello.dto.ForcedOutMemberDTO;
import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.NoticeDTO;
import kh.hello.utils.Utils;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adao;
	
	@Autowired
	private ChartDAO cdao;
	
	@Autowired
	private CountDAO ctdao;
	
	@Autowired
	private JavaMailSender informMail;
	
	public int validLogin(String adminId, String password) throws Exception{
		return adao.validLogin(adminId, Utils.encrypt(password));
	}
	
	public String getAdminEmail(String adminId) {
		return adao.getAdminEmail(adminId);
	}
	
	public int modifyInfo(String adminId, String password, String email) throws Exception{
		return adao.modifyInfo(adminId, Utils.encrypt(password), email);
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
		//1-1. 댓글내용 xss
		reply = Utils.protectXss(reply);
		//1-2. 댓글 입력
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
	public int memberOut(String id, String reason) throws Exception{
		//존재하는 회원인지 확인하기
		MemberDTO dto = adao.getMemberInfo(id);
		if(dto.getPw() != null) {
			//강퇴사유 xss
			reason = Utils.protectXss(reason);
			//강퇴시키고
			adao.memberOut(id);
			//이메일 정보 받아오기
			String email = adao.getEmailById(id);
			//강퇴 회원에게 메일 보내기
			String setfrom = "hw.ad.inform@gmail.com";         
			String tomail  = email;     // 받는 사람 이메일
			String title   = "[Hello World!]에서 강제 탈퇴 당하셨습니다.";      // 제목
			String content = "강퇴사유 : " + reason;    // 내용		
			
	    	MimeMessage message = informMail.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		    
		    messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		    messageHelper.setTo(tomail);     // 받는사람 이메일
		    messageHelper.setSubject(MimeUtility.encodeText(title, "UTF-8", "B"));//메일 제목
		    message.setContent(content, "text/html; charset=utf-8");
		     
		    informMail.send(message);			
			
			//테이블에 입력하기		
			return adao.memberOutList(id, email, reason);				
		}else {
			return 0;
		}
	}
	
	public int memberUp(String id) {
		return adao.memberUp(id);
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
	
	public ChartMainDTO getVisitorCount() {		
		ChartMainDTO result = new ChartMainDTO();
		result.setToday(ctdao.getVisitTodayCount());
		result.setTotal(ctdao.getVisitTotalCount());
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
	
	public List<NoticeDTO> noticeMainListByPage(int start, int end){
		return adao.noticeMainListByPage(start, end);
	}
	
	public List<String> getNoticePageNavi(int currentPage){
		int recordTotalCount = adao.getNoticeTotal();
		int pageTotalCount = 0;
		
		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
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

		if(needPrev) pages.add("<a class=page-link href='noticeList?page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='noticeList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='noticeList?page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;		
	}
	
	public String imgUpload(String path, int boardSeq, String content) throws Exception{
		File imgPath = new File(path + "/notice");
		if(!imgPath.exists()) {
			imgPath.mkdirs();
		}
		
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(content);
		
		while(m.find()) {
			String oriName = m.group(2);
			String sysName = System.currentTimeMillis() + "_" + oriName;
			
			int need = m.group(1).split(",").length;
			
			if(need > 1) {
				String imgString = m.group(1).split(",")[1];
				byte[] imgByte = Base64Utils.decodeFromString(imgString);
				
				FileOutputStream fos = new FileOutputStream(new File(imgPath + "/" + sysName));
				DataOutputStream dos = new DataOutputStream(fos);
				
				dos.write(imgByte);
				dos.flush();
				dos.close();
								
				//DB에 이미지 목록 저장하기
				int result = adao.insertImg(boardSeq, sysName);
				if(result > 0) {
					content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/notice/"+sysName);
				}
			}			
		}
		return content;
	}
	
	@Transactional("txManager")
	public int writeNotice(NoticeDTO dto, String path) throws Exception{
		//1. boardSeq 받아오기
		int boardSeq = adao.getNoticeSeq();
		dto.setSeq(boardSeq);
		//2-1. 이미지 저장하고 주소 변환
		String content = imgUpload(path, boardSeq, dto.getContent());
		dto.setContent(content);
		//2-2. 제목 protectXss
		dto.setTitle(Utils.protectXss(dto.getTitle()));
		//3. 글 업로드
		adao.writeNotice(dto);
		//4. 디테일뷰로 이동하기 위해 boardSeq 리턴	
		return boardSeq;
	}
	
	public NoticeDTO noticeDetailView(int seq) {
		return adao.noticeDetailView(seq);
	} 
	
	public int modifyNotice(NoticeDTO dto, String path) throws Exception{
		//1. boardSeq 받아오기
		int boardSeq = dto.getSeq();
		//2-1. 이미지 저장하고 주소 변환
		String content = imgUpload(path, boardSeq, dto.getContent());
		dto.setContent(content);
		//2-2. 제목 protectXss
		dto.setTitle(Utils.protectXss(dto.getTitle()));
		//3. 글 업로드
		adao.modifyNotice(dto);
		//4. 디테일뷰로 이동하기 위해 boardSeq 리턴	
		return boardSeq;		
	}
	
	public void imgDelete(String path, int boardSeq) {
		List<String> imgs = adao.getImgsByBoardSeq(boardSeq);
		for(String tmp:imgs) {
			File file = new File(path+"/"+tmp);
			if(file.exists()) {
				file.delete();
			}
		}		
	}
	
	@Transactional("txManager")
	public int deleteNotice(String path, int seq) {
		//글 삭제하기
		//이미지 파일은 transaction관리 안되서 글 먼저 지움
		int result = adao.deleteNotice(seq);
		if(result > 0) {
			//이미지 파일 삭제하기
			imgDelete(path, seq);
			//이미지 기록 DB에서 삭제하기
			adao.delImgsByBoardSeq(seq);
		}
		return result;
	}
	
	public String ifmOpenModify(String id) {
		//1.  ifmOpenCheck  null값인지 체크(탈퇴여부)
		String check = adao.validOpen(id);
		//2.  ifmOpenCheck  변경
		if(check != null) {
			int result = adao.ifmOpenModify(id, check);
			if(result > 0) {
				if(check.equals("Y")) {
					return "비공개 상태로 변경되었습니다.";
				}else {
					return "공개 상태로 변경되었습니다.";
				}	
			}else {
				return "문제가 발생했습니다. 새로고침 후 다시 시도해주세요.";
			}
		}else {
			return "변경할 수 없습니다. 탈퇴한 회원입니다.";
		}		
	}
}





