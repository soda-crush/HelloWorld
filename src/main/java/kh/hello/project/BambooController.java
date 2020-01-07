package kh.hello.project;

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.services.BambooService;

@Controller
@RequestMapping("/bamboo")
public class BambooController {
	@Autowired
	private HttpSession session;
	@Autowired
	private BambooService service;


	//대나무숲 게시판
	@RequestMapping("/bambooList.do")
	public String bamboolistView (String cpage, Model m) {//대나무숲 게시판목록
		session.setAttribute("loginInfo", "moon");
		//List<BambooDTO> list = service.bambooList();


		//페이지네비
		int currentPage = 1;		

		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<BambooDTO> list = service.bambooListByPage(start, end);
		m.addAttribute("bambooList", list);

		List<String> pageNavi = service.getBambooListPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);

		m.addAttribute("cpage", currentPage);







		//m.addAttribute("bambooList", list);
		return "/bamboo/bambooList";
	}
	@RequestMapping("/bambooDetailView.do")
	public String bambooDetailView (int seq, Model m) {//대나무숲 글보기
		BambooDTO result = service.bambooDetailView(seq);
		List<BambooCoDTO> coResult = service.commentList(seq);
		m.addAttribute("bPage", result);
		m.addAttribute("comments", coResult);
		return "/bamboo/bambooDetailView";
	}

	@RequestMapping("/bambooWrite.do")
	public String bambooWrite() {
		return "/bamboo/bambooWrite";
	}

//	@RequestMapping("/bambooWriteProc.do")
//	public String bambooWriteConfirm(BambooDTO dto) {
//		dto.setWriter((String)session.getAttribute("loginInfo"));
//		service.bambooWriteConfirm(dto);
//		return "redirect:/bamboo/bambooList.do";
//	}
	@RequestMapping("/bambooWriteProc.do")
	public String bambooWriteConfirm(BambooDTO dto) {//섬머노트
		dto.setWriter((String)session.getAttribute("loginInfo"));
		service.bambooWriteConfirm(dto);
		
		//썸머노트 이미지 서버에 저장하고 띄우기
				String path = session.getServletContext().getRealPath("resources/img");
				
				Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
				Matcher m = p.matcher(dto.getContent());
				try {
					while(m.find()) {
						String oriName = m.group(2);
						String sysName = System.currentTimeMillis() + "_" + oriName;
						String imageString = m.group(1).split(",")[1];
						byte[] imgBytes = Base64Utils.decodeFromString(imageString);
						FileOutputStream fos = new FileOutputStream(path + "/" + sysName);
						DataOutputStream dos = new DataOutputStream(fos);
						dos.write(imgBytes);
						dos.flush();
						dos.close();

						System.out.println(dto.getContent().replaceFirst(Pattern.quote(m.group(1)), "/files/"+sysName));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		
		return "redirect:/bamboo/bambooList.do";
	}
	
	@RequestMapping("/bambooModify.do")
	public String bambooModify(int seq, Model m) {
		BambooDTO result = service.bambooDetailView(seq);
		m.addAttribute("bPage", result);
		return "/bamboo/bambooModify";
	}

	@RequestMapping("/bambooModifyProc.do")
	public String bambooModifyConfirm(BambooDTO dto) {
		System.out.println(dto.toString());
		service.bambooModifyConfirm(dto);
		int seq = dto.getSeq();
		return "redirect:/bamboo/bambooDetailView.do?seq="+seq;
	}

	@RequestMapping("/bambooDeleteProc.do")
	public String bambooDeleteConfirm(int seq) {
		service.bambooDeleteConfirm(seq);
		return "redirect:/bamboo/bambooList.do";
	}

	//댓글

	@ResponseBody
	@RequestMapping(value="/comment/writeProc.do",produces="text/html;charset=utf8")
	public String commentWriteConfirm(BambooCoDTO dto) {
		return service.commentWriteConfirm(dto);
	}

	@ResponseBody
	@RequestMapping(value="/comment/modifyProc.do",produces="text/html;charset=utf8")
	public String commentModifyConfirm(BambooCoDTO dto) {
		System.out.println("댓글수정 도착 + " + dto.getSeq() + " : " + dto.getBamSeq() + " : " +dto.getWriter());
		return service.commentModifyConfirm(dto);
	}

	@RequestMapping("/comment/deleteProc.do")
	public String commentDeleteConfirm(int bamSeq,int seq) {
		service.commentDeleteConfirm(seq);
		return "redirect:/bamboo/bambooDetailView.do?seq="+bamSeq;
	}


	//게시판 목록 검색
	@RequestMapping("/bambooSearch.do")
	public String bambooSearch(String search, HttpServletRequest request, Model m, String cpage) {
		System.out.println(request.getParameter("value")+" - "+search);
		String value = request.getParameter("value");
		//m.addAttribute("bambooList", service.bambooSearchTotalCount(value, search));


		//페이지네비
		int currentPage = 1;		

		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<BambooDTO> list = service.bambooSearchListByPage(start, end, value, search);
		m.addAttribute("bambooList", list);

		List<String> pageNavi = service.getBambooSearchListPageNavi(currentPage, value, search);
		m.addAttribute("pageNavi", pageNavi);

		m.addAttribute("cpage", currentPage);


		return "/bamboo/bambooList";
	}
}
