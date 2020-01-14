package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.services.PlogCohowService;

@Controller
@RequestMapping("/Plog")
public class PlogMemController {

	@Autowired
	private PlogCohowService pcs;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/toPlogCohow.do")
	public String toPlogCohow(String qcpage,String rcpage) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String id = ownerInfo.getId();
		int qcurrentPage = 1;
		if(qcpage != null) qcurrentPage = Integer.parseInt(qcpage);
		int qend = qcurrentPage * Configuration.pLogProjectRecordCountPerPage;
		int qstart = qend - (Configuration.pLogProjectRecordCountPerPage - 1);
		int rcurrentPage = 1;
		if(rcpage != null) rcurrentPage = Integer.parseInt(rcpage);
		int rend = rcurrentPage * Configuration.pLogProjectRecordCountPerPage;
		int rstart = rend - (Configuration.pLogProjectRecordCountPerPage - 1);
		List<CodeQuestionDTO> qlist = pcs.selectMyQuestionListByPage(id,qstart,qend);
		List<CodeQuestionDTO> rlist = pcs.selectMyReplyListByPage(id,rstart,rend);
		List<String> qpageNavi = pcs.getScrapPageNavi(id, qcurrentPage, "Q",rcurrentPage);
		List<String> rpageNavi = pcs.getScrapPageNavi(id, rcurrentPage, "R",qcurrentPage);
		request.setAttribute("qlist", qlist);
		request.setAttribute("qpageNavi", qpageNavi);
		request.setAttribute("rlist", rlist);
		request.setAttribute("rpageNavi", rpageNavi);
		return "/plog/plogCohow";
	}

	@RequestMapping("/toPlogProject.do")
	public String toPlogProject() {
		return "/plog/plogProject";
	}

}
