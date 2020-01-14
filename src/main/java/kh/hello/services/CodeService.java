package kh.hello.services;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import com.google.gson.Gson;

import kh.hello.configuration.Configuration;
import kh.hello.dao.CodeDAO;
import kh.hello.dto.CodeCommentsDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.ScrapDTO;


@Service
public class CodeService {
	@Autowired
	private CodeDAO dao;
	
	//질문 CodeQuestion
//	public List<CodeQuestionDTO> selectAll() throws Exception{
//		return dao.selectAll();
//	}
	
	public List<CodeQuestionDTO> selectQuestionAll(int start,int end) {
			return dao.selectQuestionAll(start,end);
	}
	
//	@Transactional("txManager")
//	public void insert(CodeQuestionDTO dto,String id) {
//		dao.insert(dto);
//		dao.writePoint(id);
//	}
	
//	public void imageUpload(CodeQuestionDTO dto,String path) throws Exception{
//		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
//		Matcher m = p.matcher(dto.getContent());
//
//		String oriName = null;
//		String sysName = null;
//		while(m.find()) { 
//			oriName = m.group(2); 
//			if(oriName.equals("")) { 
//				break;
//			}
//			else {
//				sysName = System.currentTimeMillis() + "_" + oriName;
//				String imageString = m.group(1).split(",")[1];
//				byte[] imgByte = Base64Utils.decodeFromString(imageString); 
//				FileOutputStream fos = new FileOutputStream(path + "/" + sysName);
//				DataOutputStream dos = new DataOutputStream(fos);
//				dos.write(imgByte);
//				dos.flush();
//				dos.close();
//				String contents = dto.getContent().replaceFirst(Pattern.quote(m.group(1)), "/files/"+sysName);
//			}
//		}
//	}
	
	@Transactional("txManager")
	public CodeQuestionDTO detailQuestion(int seq) {
		dao.incrementViewCount(seq);
		return dao.detailQuestion(seq);
	}
	
	@Transactional("txManager")
	public void delete(int seq,String id,int point) {
		dao.delete(seq);
		dao.deleteWritePoint(id);
		// 글쓴이 point 계산
		int writePointStart = dao.selectPoint(id);
		int adoptPoint = point;
		int resultPoint = writePointStart - adoptPoint; 
		dao.pointQResult(resultPoint, id);
		dao.downLevel();
	}
	
	public void modify(CodeQuestionDTO dto) {
		dao.modify(dto);
	}
	
	public int replyOneCount(int queSeq,String id){
		return dao.replyOneCount(queSeq, id);
	}
	
	//조건별 게시판목록 검색
	public List<CodeQuestionDTO> codeSearchByPage(int start, int end,String value, String search) {//대나무숲 10개씩
		//System.out.println(dao.codeSearchByPage(Integer.toString(start), Integer.toString(end),value,search).toString());
		return dao.codeSearchByPage(Integer.toString(start), Integer.toString(end),value,search);
	}
	public List<String> getCodeSearchListPageNavi (int currentPage,String value, String search) {
		int recordTotalCount = dao.codeSearchTotalCount(value,search);
		//System.out.println("서비스에서"+recordTotalCount);
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
		if(needPrev) pages.add("<li class=\"page-item\"><a class=page-link href='codeSearch.do?value="+value+"&cpage=" + (startNavi - 1) + "' >< </a></li>");

		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<li class=\"page-item\"><a class=page-link href='codeSearch.do?value="+value+"&cpage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a></li>");
			pages.add(sb.toString());
		}

		if(needNext) pages.add("<li class=\"page-item\"><a class=page-link href='codeSearch.do?value="+value+"&cpage=" + (endNavi + 1) + "'>> </a></li>");

		return pages;
	}
	
	public int getMemLevel(String id) {
		return dao.getMemLevel(id);
	}
	
	//답글 CodeReply
//	public int selectParentSeq(int seq) throws Exception{
//		return dao.selectParentSeq(seq);
//	}
	
//	@Transactional("txManager")
//	public void insertR(CodeReplyDTO dto) {
//		dao.insertR(dto);
//		dao.writePoint(dto.getId());
//	}
	
	public List<CodeReplyDTO> selectReplyAll() {
		return dao.selectReplyAll();
	}
	
	public void imageUploadR(CodeReplyDTO dto,String path) throws Exception{
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(dto.getContent());

		String oriName = null;
		String sysName = null;
		while(m.find()) { 
			oriName = m.group(2); 
			if(oriName.equals("")) { 
				break;
			}
			else {
				sysName = System.currentTimeMillis() + "_" + oriName;
				String imageString = m.group(1).split(",")[1];
				byte[] imgByte = Base64Utils.decodeFromString(imageString); 
				FileOutputStream fos = new FileOutputStream(path + "/" + sysName);
				DataOutputStream dos = new DataOutputStream(fos);
				dos.write(imgByte);
				dos.flush();
				dos.close();
				String contents = dto.getContent().replaceFirst(Pattern.quote(m.group(1)), "/files/"+sysName);
			}
		}
	}
	
	@Transactional("txManager")
	public void deleteR(int seq,String id) {
		dao.deleteR(seq);
		dao.deleteWritePoint(id);
		dao.downLevel();
	}
	
	public List<CodeReplyDTO> detailReply(int queSeq) {
		return dao.detailReply(queSeq);
	}
	
	public List<String> getPageNavi(int currentPage) {				
		int recordTotalCount = dao.codeQuestionCount();
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
		if(needPrev) pages.add("<a class=page-link href='codeQList.do?page=" + (startNavi - 1) + "'>< </a>");
		
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='codeQList.do?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			pages.add(sb.toString());
		}
		
		if(needNext) pages.add("<a class=page-link href='codeQList.do?page=" + (endNavi + 1) + "'>> </a>");
	
		return pages;
	}
	
	public CodeReplyDTO selectOneDetail(int seq) {
		return dao.selectOneDetail(seq);
	}
	
	public void modifyR(CodeReplyDTO dto) {
		dao.modifyR(dto);
	}
	
//	답글에서 실무자 비실무자 구분
	public int selectMem(String id) {
		return dao.selectMem(id);
	}
	
	// 댓글 CodeComments
//	public int selectRepSeq(int queSeq,String id) {
//		return dao.selectRepSeq(queSeq,id);
//	}
	
	public List<CodeCommentsDTO> commentList(int queSeq) {
		return dao.commentsList(queSeq);
	}
	
	@Transactional("txManager")
	public String insertComment(CodeCommentsDTO dto) {
		dao.insertComment(dto);
		dao.writeCoPoint(dto.getId());
		Gson gson = new Gson();
		List<CodeCommentsDTO> result = dao.commentsListTwo(dto.getRepSeq());
		for (CodeCommentsDTO c : result) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			c.setFormedWriteDate(sdf.format(c.getWriteDate()));
		}
		return gson.toJson(result);
	}
	
//	@Transactional("txManager")
//	public String getComment(CodeCommentsDTO dto) {
//		dao.insertComment(dto);
//		CodeCommentsDTO comment = dao.getComment(dto.getRepSeq());
//		JsonObject jobj = new JsonObject();
//		jobj.addProperty("seq", comment.getSeq());
//		jobj.addProperty("repSeq", comment.getRepSeq());
//		jobj.addProperty("content", comment.getContent());
//		jobj.addProperty("writer", comment.getWriter());
//		jobj.addProperty("writeDate", comment.getWriteDate().toString());
//		
//		return jobj.toString();
//	}
		
	@Transactional("txManager")
	public String updateComment(CodeCommentsDTO dto) {
		dao.updateComment(dto);
		Gson gson = new Gson();
		List<CodeCommentsDTO> result = dao.commentsListTwo(dto.getRepSeq());
		for (CodeCommentsDTO c : result) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			c.setFormedWriteDate(sdf.format(c.getWriteDate()));
		}
		return gson.toJson(result);
		
//		System.out.println(dto.getRepSeq());
//		CodeCommentsDTO comment = dao.getComment(dto.getRepSeq());
//		System.out.println("서비스"+comment);
//		JsonObject jobj = new JsonObject();
//		jobj.addProperty("seq", comment.getSeq());
//		jobj.addProperty("repSeq", comment.getRepSeq());
//		jobj.addProperty("content", comment.getContent());
//		jobj.addProperty("writer", comment.getWriter());
//		jobj.addProperty("writeDate", comment.getWriteDate().toString());
	}
	
	public String deleteComment(CodeCommentsDTO dto) {
		dao.deleteComment(dto.getSeq());
		dao.deleteCoPoint(dto.getId());
		Gson gson = new Gson();
		List<CodeCommentsDTO> result = dao.commentsListTwo(dto.getRepSeq());
		for (CodeCommentsDTO c : result) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			c.setFormedWriteDate(sdf.format(c.getWriteDate()));
		}
		dao.downLevel();
		return gson.toJson(result);
	}
	
	public int deleteReplyAllCo(int repSeq) {
		return dao.deleteReplyAllCo(repSeq);
	}
	
	//이미지 업로드 섬머노트 파일명정리
	private String imgUpload(String path, int queSeq, String content) throws Exception{
		File imgPath = new File(path + "/code");
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
				int result = dao.insertImg(queSeq, sysName);
				if(result > 0) {
					content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/code/"+sysName);
				}
			}
		}
		return content;
	}
	
	@Transactional("txManager")
	public int writeCode(String path, CodeQuestionDTO dto,String id) throws Exception{
		//1. queSeq 받아오기
		int queSeq = dao.getCodeSeq();
		dto.setSeq(queSeq);
		//2. 이미지 저장하고 주소 변환
		String content = imgUpload(path, queSeq, dto.getContent());
		//System.out.println(content);
		dto.setContent(content);
		//3. 글 업로드
		dao.writePoint(id); //포인트
		
		// 글쓴이 point 계산
		int writePointStart = dao.selectPoint(id);
		int adoptPoint = dto.getPoint();
		int resultPoint = writePointStart - adoptPoint; 
		dao.pointQResult(resultPoint, id);	
		dao.downLevel(); 
		return dao.insert(dto);
	}
	
	//이미지 업로드 답변 섬머노트 파일명정리
		private String imgUploadR(String path, int repSeq, String content) throws Exception{
			File imgPath = new File(path + "/codeR");
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
					int result = dao.insertRImg(repSeq, sysName);
					if(result > 0) {
						content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/codeR/"+sysName);
					}
				}
			}
			return content;
		}
		
		@Transactional("txManager")
		public int writeCodeR(String path, CodeReplyDTO dto,String id) throws Exception{
			//1. repSeq 받아오기
			int repSeq = dao.getCodeRSeq();
			dto.setSeq(repSeq);
			//2. 이미지 저장하고 주소 변환
			String content = imgUploadR(path, repSeq, dto.getContent());
			//System.out.println(content);
			dto.setContent(content);
			//3. 글 업로드
			dao.writePoint(id); //포인트
			return dao.insertR(dto);
		}
	
	//스크랩
	public String scrap(ScrapDTO dto){
		int scrapDupResult = dao.scrapDupCheck(dto);
		if(scrapDupResult > 0) {
			//중복
			return "already";
		}else {
			dto.setSeq(dao.earlierSeq());
			int scrapResult = dao.scrapCode(dto);
			if(scrapResult > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
	}
	

	
//채택
	public int replyCount(int queSeq) {
		return dao.replyCount(queSeq);
	}
	
	public int selectPoint(String id) {
		return dao.selectPoint(id);
	}
	
	@Transactional("txManager")
	public void adopt(int adoptPoint,int queSeq,String writerId,String replyId){
		// -> 글 쓸때 포인트 차감으로 변경
//		int writePointStart = dao.selectPoint(writerId);
//		int resultPoint = writePointStart - adoptPoint; // 글쓴이 point 계산
//		dao.pointQResult(resultPoint, writerId);
		
		int writeReplyStart = dao.selectPoint(replyId); // 답글쓴사람 point 계산
		int resultPoint2 = writeReplyStart+adoptPoint;
		dao.pointRResult(resultPoint2, replyId);
		dao.updateRepCol(replyId,queSeq); // ADOPT 컬럼 Y로
		
		Map<String, Integer> param = new HashMap<>();
//		param.put("resultPoint", resultPoint);
		param.put("resultPoint2", resultPoint2);
	}
	
	public int adoptCount(int queSeq) {
		return dao.adoptCount(queSeq);
	}
}
