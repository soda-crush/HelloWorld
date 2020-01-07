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
import kh.hello.dto.InquiryReplyDTO;

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
				int result = dao.insertImg(boardSeq, sysName);
				if(result > 0) {
					content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/inquiry/"+sysName);
				}
			}			
		}
		return content;
	}
	
	private void imgDelete(String path, int boardSeq) throws Exception{
		List<String> imgs = dao.getImgsByBoardSeq(boardSeq);
		for(String tmp:imgs) {
			System.out.println(path + " : " + tmp);
			File file = new File(path+"/"+tmp);
			if(file.exists()) {
				file.delete();
			}
		}
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
		dto.setSeq(boardSeq);
		//2. 이미지 저장하고 주소 변환
		String content = imgUpload(path, boardSeq, dto.getContent());
		dto.setContent(content);
		//3. 글 업로드
		dao.writeInquiry(dto);
		//4. 디테일뷰로 이동하기 위해 boardSeq 리턴
		return boardSeq;
	}
	
	public InquiryDTO getMyInquiryBySeq(int seq) {
		return dao.getMyInquiryBySeq(seq);
	}
	
	public List<InquiryReplyDTO> getMyInquiryCo(int boardSeq){
		return dao.getMyInquiryCo(boardSeq);
	}
	
	public int modifyInquiry(String path, InquiryDTO dto) throws Exception{
		String content = imgUpload(path, dto.getSeq(), dto.getContent());
		dto.setContent(content);
		return dao.modifyInquiry(dto);
	}
	
	@Transactional("txManager")
	public int deleteInquiry(String path, int seq) throws Exception{
		//글 삭제하기
		//이미지 파일은 transaction관리 안되서 글 먼저 지움
		int result = dao.deleteInquiry(seq);
		if(result > 0) {
			//이미지 파일 삭제하기
			imgDelete(path, seq);
			//이미지 기록 DB에서 삭제하기
			dao.delImgsByBoardSeq(seq);
		}
		return result;
	}
	

}
