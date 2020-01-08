package kh.hello.services;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import com.google.gson.Gson;

import kh.hello.configuration.Configuration;
import kh.hello.dao.ItnewsDAO;
import kh.hello.dto.ItnewsCoDTO;
import kh.hello.dto.ItnewsDTO;

@Service
public class ItnewsService {

	@Autowired
	private ItnewsDAO dao;
	
	public List<ItnewsDTO> itnewsList(){
		return dao.getItnewsList();
	}
	
	public ItnewsDTO itnewsDetail(int seq){
		return dao.getItnewsDTO(seq);
	}
	
	public List<ItnewsDTO> itnewsListTrim(int start, int end){
		return dao.selectByPage(start, end);
	}
	
	public String getPageNavi(int cpage){
		int recordTotalCount = dao.getItnewsTotal();
		int pageTotalCount = 0;
		
		if(recordTotalCount% Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		
		if(cpage < 1) {
			cpage = 1;
		}else if(cpage > pageTotalCount) {
			cpage = pageTotalCount;
		}
		
		int startNavi = (cpage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
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

		StringBuilder sb = new StringBuilder();
		if(needPrev) sb.append("<a href='itnewsList?cpage=" + (startNavi - 1) + "'>< </a>");
		
		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a id=page"+i+" href='itnewsList?cpage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
		}
		
		if(needNext) sb.append("<a href='itnewsList?cpage=" + (endNavi + 1) + "'>> </a>");
	
		return sb.toString();
	}
	
	@Transactional("txManager")
	public int writeItnews(String path, ItnewsDTO dto) throws Exception{
		//1. boardSeq 받아오기
		int boardSeq = dao.getItnewsSeq();
		dto.setSeq(boardSeq);
		//2. 이미지 저장하고 주소 변환
		String content = this.imgUpload(path, boardSeq, dto.getContent());
		dto.setContent(content);
		//3. 글 업로드
		dao.writeItnews(dto);
		return boardSeq;
	}
	
	@Transactional("txManager")
	public int modifyItnews(String path, ItnewsDTO dto) throws Exception{
		//1. boardSeq 받아오기
		int boardSeq = dao.getItnewsSeq();
		dto.setSeq(boardSeq);
		//2. 이미지 저장하고 주소 변환
		String content = this.imgUpload(path, boardSeq, dto.getContent());
		dto.setContent(content);
		//3. 글 업로드
		dao.writeItnews(dto);
		return boardSeq;
	}
	
	private String imgUpload(String path, int boardSeq, String content) throws Exception{
		File imgPath = new File(path + "/itnews");
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
			//int result = dao.insertImg(boardSeq, sysName);
			//if(result > 0) {
				content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/itnews/"+sysName);
			//}
		}
		return content;
	}
	
	public int removeItnews(int seq) {
		return dao.removeItnews(seq);
	}
	
	public int coWrite(ItnewsCoDTO dto, String seq) {
		dto.setItSeq(Integer.parseInt(seq));
		return dao.coWrite(dto);
	}
	
	public List<ItnewsCoDTO> commentList(int seq){
		return dao.commentList(seq);
	}
	
	public String coWriteAfter(String seq) {
		List<ItnewsCoDTO> list = commentList(Integer.parseInt(seq));
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	public int removeItnewsCo(String itSeq, String seq) {
		int seq2 = Integer.parseInt(seq);
		int itSeq2 = Integer.parseInt(itSeq);
		
		return dao.removeItnewsCo(itSeq2, seq2);
	}
	
}
