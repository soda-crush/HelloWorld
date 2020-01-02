package kh.hello.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.PortfolioDTO;
import kh.hello.services.PortfolioService;

@Controller
@RequestMapping("/Portfolio")
public class PortfolioController {
	
	@Autowired
	private PortfolioService ps;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toInsert.do")
	public String toInsert() {
		return "/plog/writePortfolio";
	}
	
	@RequestMapping("/insert.do")
	public String insertWrite(PortfolioDTO pdto) {
		ps.insertWrite(pdto);
		return "redirect:selectList.do";
	}
	
	@RequestMapping("/selectList.do")
	public String selectList() {
		ps.selectList();
		return "/plog/plogPortfolio";
	}
	
}
