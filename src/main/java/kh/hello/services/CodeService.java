package kh.hello.services;

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.hello.configuration.Configuration;
import kh.hello.dao.CodeDAO;
import kh.hello.dto.CodeCommentsDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;


@Service
public class CodeService {
	@Autowired
	private CodeDAO dao;
	
	//질문 CodeQuestion
//	public List<CodeQuestionDTO> selectAll() throws Exception{
//		return dao.selectAll();
//	}
	
	public List<CodeQuestionDTO> selectQuestionAll(int start,int end) throws Exception{
			return dao.selectQuestionAll(start,end);
	}
	
	public void insert(CodeQuestionDTO dto) throws Exception{
		dao.insert(dto);
	}
	
	public void imageUpload(CodeQuestionDTO dto,String path) throws Exception{
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
	public CodeQuestionDTO detailQuestion(int seq) throws Exception{
		dao.incrementViewCount(seq);
		return dao.detailQuestion(seq);
	}
	
	public void delete(int seq) throws Exception{
		dao.delete(seq);
	}
	
	public void modify(CodeQuestionDTO dto) throws Exception{
		dao.modify(dto);
	}
	
	public int replyOneCount(int queSeq,String writer) throws Exception{
		return dao.replyOneCount(queSeq, writer);
	}
	
	//답글 CodeReply
//	public int selectParentSeq(int seq) throws Exception{
//		return dao.selectParentSeq(seq);
//	}
	
	public void insertR(CodeReplyDTO dto) throws Exception{
		dao.insertR(dto);
	}
	
	public List<CodeReplyDTO> selectReplyAll() throws Exception{
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
	
	public void deleteR(int seq) throws Exception{
		dao.delete(seq);
	}
	
	public List<CodeReplyDTO> detailReply(int queSeq) throws Exception{
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
	
	
	// 댓글 CodeComments
	@Transactional("txManager")
	public String insertComment(CodeCommentsDTO dto) {
		dao.insertComment(dto);
		Gson gson = new Gson();
		JsonArray array = new JsonArray();
		List<CodeCommentsDTO> result = dao.commentsList(dto.getRepSeq());
		for(CodeCommentsDTO c : result) {
			array.add(gson.toJson(c));
		}
		return array.toString();
	}
	
	public List<CodeCommentsDTO> commentList(int repSeq) {
		return dao.commentsList(repSeq);
	}
		
	@Transactional("txManager")
	public String updateComment(CodeCommentsDTO dto) {
		dao.updateComment(dto);
		Gson gson = new Gson();
		JsonArray array = new JsonArray();
		List<CodeCommentsDTO> result = dao.commentsList(dto.getRepSeq());
		for(CodeCommentsDTO c : result) {
			array.add(gson.toJson(c));
		}
		return array.toString();
	}
	
	public int deleteComment(int seq) {
		return dao.deleteComment(seq);
	}
	

}
