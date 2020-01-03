package kh.hello.project;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/toInsert.do")
	public String toInsert() {
		return "/plog/writePortfolio";
	}
	
	@RequestMapping("/insert.do")
	public String insertWrite(PortfolioDTO pdto,String startDateTemp,String endDateTemp) {
		try {
			request.setCharacterEncoding("UTF-8");
			System.out.println("st"+ startDateTemp);
			System.out.println("end"+ endDateTemp);
		    String startDate = startDateTemp + " 00:00:00.0";
		    String endDate = endDateTemp + " 00:00:00.0";
			pdto.setStartDate(Timestamp.valueOf(startDate));
			pdto.setEndDate(Timestamp.valueOf(endDate));
			pdto.setWriter("test");
			ps.insertWrite(pdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:selectList.do";
	}
	
	@RequestMapping("/selectList.do")
	public String selectList() {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		String writer = session.getAttribute("loginInfo").toString();
		String writer = "test";
		List<PortfolioDTO> list = ps.selectList(writer);
		request.setAttribute("list", list);
		return "/plog/plogPortfolio";
	}
	
	@RequestMapping("detail.do")
	public String viewDetail(int seq) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PortfolioDTO pdto = ps.selectBySeq(seq);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(pdto.getStartDate());
		String end = sdf.format(pdto.getEndDate());
		
		request.setAttribute("str", str);
		request.setAttribute("end", end);
		request.setAttribute("pdto", pdto);
		return "/plog/viewPortfolio";
		
	}
	
}
