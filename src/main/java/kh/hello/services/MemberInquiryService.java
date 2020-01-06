package kh.hello.services;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import kh.hello.configuration.Configuration;
import kh.hello.dao.MemberInquiryDAO;
import kh.hello.dto.InquiryDTO;

@Service
public class MemberInquiryService {

	@Autowired
	private MemberInquiryDAO dao;
	
	private String imgUpload(String path, int boardSeq, String content) throws Exception{
		File imgPath = new File(path + "/inquiry");
		if(!imgPath.exists()) {
			imgPath.mkdirs();
		}
		
		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(content);
		
		while(m.find()) {
			String oriName = m.group(2);
			String sysName = System.currentTimeMillis() + "_" + oriName;
			
			String imgString = m.group(1).split(",")[1];
			byte[] imgByte = Base64Utils.decodeFromString(imgString);
			
			FileOutputStream fos = new FileOutputStream(new File(imgPath + "/" + sysName));
			DataOutputStream dos = new DataOutputStream(fos);
			
			dos.write(imgByte);
			dos.flush();
			dos.close();
							
			//DB에 이미지 목록 저장하기
			int result = dao.insertImg(boardSeq, sysName);
			if(result > 0) {
				content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/inquiry/"+sysName);
			}
		}
		return content;
	}
	
	public List<InquiryDTO> getMyInquiryByPage(String id, int start, int end){
		return dao.getMyInquiryByPage(id, start, end);
	}
	
	public List<String> getMyInquiryPageNavi(String id, int currentPage){
		int myInquiryTotalCount = dao.getMyInquiryTotal(id);
		int pageTotalCount = 0;
		
		if(myInquiryTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = myInquiryTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = myInquiryTotalCount / Configuration.recordCountPerPage;
		}
		
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		if(startNavi == 1) needPrev = false;

		boolean needNext = true;
		if(endNavi == pageTotalCount) needNext = false;
		
		List<String> pages = new ArrayList<>();

		if(needPrev) pages.add("<a class=page-link href='/member1/myInquiry?id="+id+"&page=" + (startNavi - 1) + "'>< </a>");
		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='/member1/myInquiry?id="+id+"&page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			
			pages.add(sb.toString());
		}
		if(needNext) pages.add("<a class=page-link href='/member1/myInquiry?id="+id+"&page=" + (endNavi + 1) + "'>> </a>");
		
		return pages;
	}
	
	@Transactional("txManager")
	public int writeInquiry(String path, InquiryDTO dto) throws Exception{
		//1. boardSeq 받아오기
		int boardSeq = dao.getInquirySeq();
		//2. 이미지 저장하고 주소 변환
		String content = imgUpload(path, boardSeq, dto.getContent());
		dto.setContent(content);
		//3. 글 업로드
		return dao.writeInquiry(dto);
	}
	

}
