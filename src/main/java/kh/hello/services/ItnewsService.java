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
import kh.hello.dto.ItnewsImgDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.dto.ScrapDTO;

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
	
	public List<ItnewsDTO> itnewsListTrimSrch(int start, int end, String cate, String search){
		return dao.selectByPageSearch(start, end, cate, search);
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
		sb.append("<ul class='pagination justify-content-center'>");
		if(needPrev) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/itnews/itnewsList?cpage="+(startNavi-1)+"' aria-label='Previous'>"); 
			sb.append("<span aria-hidden='true'>&laquo;</span></a></li>");			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/itnews/itnewsList?cpage="+i+"'>"+i+"</a></li>");			
		}
		if(needNext) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/itnews/itnewsList?page="+(endNavi+1)+"' aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&raquo;</span></a></li>");			
		}
		sb.append("</ul>");
		return sb.toString();
	}
	
	public String getPageNaviSrch(int cpage, String cate,String search) {
		int recordTotalCount = dao.getItnewsTotalSearch(cate, search);
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
		sb.append("<ul class='pagination justify-content-center'>");
		if(needPrev) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/itnews/searchList?cpage="+(startNavi-1)+"&cate="+cate+"&search="+search+"' aria-label='Previous'>"); 
			sb.append("<span aria-hidden='true'>&laquo;</span></a></li>");			
		}
		for(int i=startNavi;i<=endNavi;i++) {
			sb.append("<li class='page-item pNavi"+i+"'><a class='page-link' href='/itnews/searchList?cpage="+i+"&cate="+cate+"&search="+search+"'>"+i+"</a></li>");			
		}
		if(needNext) {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='/itnews/searchList?page="+(endNavi+1)+"&cate="+cate+"&search="+search+"' aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&raquo;</span></a></li>");			
		}
		sb.append("</ul>");
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
		//포인트 증가
		dao.increPoint(dto.getId());
		
		return boardSeq;
	}
	
	@Transactional("txManager")
	public int modifyItnews(String path, ItnewsDTO dto) throws Exception{
		//1. 이미지 저장하고 주소 변환
		String content = this.imgUpload(path, dto.getSeq(), dto.getContent());
		dto.setContent(content);
		//2. 글 업데이트
		dao.modifyItnews(dto);
		return dto.getSeq();
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
			int result = dao.insertImg(new ItnewsImgDTO(0,boardSeq, oriName, sysName));
			if(result > 0) {
				content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/itnews/"+sysName);
			}
		}
		return content;
	}
	
	@Transactional("txManager")
	public int removeItnews(int seq) {
		//시퀀스로 아이디 받아오기
		String id = dao.getIdBySeq(seq);
		//포인트 차감
		dao.decrePoint(id);
		//포인트 확인
		dao.pointCheck(id);
		//글삭제
		dao.removeItnews(seq);
		//댓글 삭제
		return dao.removeItnewsCoAll(seq);
	}
	
	@Transactional("txManager")
	public int coWrite(ItnewsCoDTO dto, String seq) {
		dto.setItSeq(Integer.parseInt(seq));
		//포인트 증가
		dao.increCoPoint(dto.getId());
		
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
	
	public String coWriteAfter(int seq) {
		List<ItnewsCoDTO> list = commentList(seq);
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	@Transactional("txManager")
	public int removeItnewsCo(String itSeq, String seq) {
		int seq2 = Integer.parseInt(seq);
		int itSeq2 = Integer.parseInt(itSeq);
		
		//시퀀스로 아이디 받아오기
		String id = dao.getIdByCoSeq(seq2);
		//포인트 차감
		dao.decreCoPoint(id);
		//포인트 확인
		dao.pointCheck(id);
		
		return dao.removeItnewsCo(itSeq2, seq2);
	}
	
	public int modifyItnewsCo(ItnewsCoDTO dto) {
		return dao.modifyItnewsCo(dto);
	}
	
	public int getItSeqBySeq(int seq) {
		return dao.getItSeqBySeq(seq);
	}
	
	public String scrap(ScrapDTO dto){
		int scrapDupResult = dao.scrapDupCheck(dto);
		if(scrapDupResult > 0) {
			//중복
			return "already";
		}else {
			dto.setSeq(dao.earlierSeq());
			int scrapResult = dao.scrapItnews(dto);
			if(scrapResult > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
	}
	
	public int increViewCount(int seq) {
		return dao.increViewCount(seq);
	}
	
	public String getImgByWriter(String writer) {
		return dao.getImgByWriter(writer);
	}
//	게시글신고
	public int reportDuplCheck(String id, int seq) {
		return dao.reportDuplCheck(id, seq);
	}
	public int reportProject(ReportDTO dto) {
		return dao.insertReport(dto);					
	}
	
}
