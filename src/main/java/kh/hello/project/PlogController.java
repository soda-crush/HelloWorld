package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.services.PlogCohowService;

@Controller
@RequestMapping("/Plog")
public class PlogController {

	@Autowired
	private PlogCohowService pcs;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/toPlogCohow.do")
	public String toPlogCohow() {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String id = ownerInfo.getId();
		List<CodeQuestionDTO> qlist = pcs.selectMyQuestion(id);
		List<CodeQuestionDTO> rlist = pcs.selectMyReply(id);

		request.setAttribute("qlist", qlist);
		request.setAttribute("rlist", rlist);
		return "/plog/plogCohow";
	}

	@RequestMapping("/toPlogProject.do")
	public String toPlogProject() {
		return "/plog/plogProject";
	}

}
