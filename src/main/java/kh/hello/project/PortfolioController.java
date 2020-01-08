package kh.hello.project;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.PortfolioDTO;
import kh.hello.services.MemberService;
import kh.hello.services.PortfolioService;

@Controller
@RequestMapping("/Portfolio")
public class PortfolioController {
	
	@Autowired
	private PortfolioService ps;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/toInsert.do")
	public String toInsert() {
		return "/plog/writePortfolio";
	}
	
	@RequestMapping(value ="/fileUpload1.do",produces="text/html;charset=utf8")
	@ResponseBody
	public String image1(MultipartFile fileUpload1) {
		String oriName = fileUpload1.getOriginalFilename();
		String sysName = System.currentTimeMillis()+"_"+oriName;
		String path = session.getServletContext().getRealPath("files");
		File filePath = new File(path);
		if (!filePath.exists()) {
			filePath.mkdir();
		}
		try {
			fileUpload1.transferTo(new File(path+"/"+sysName));
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		System.out.println("파일업로드 완료");
		return "/files/"+sysName;
	}
	
	@RequestMapping(value ="/fileUpload2.do",produces="text/html;charset=utf8")
	@ResponseBody
	public String image2(MultipartFile fileUpload2) {
		String oriName = fileUpload2.getOriginalFilename();
		String sysName = System.currentTimeMillis()+"_"+oriName;
		String path = session.getServletContext().getRealPath("files");
		File filePath = new File(path);
		if (!filePath.exists()) {
			filePath.mkdir();
		}
		try {
			fileUpload2.transferTo(new File(path+"/"+sysName));
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		System.out.println("파일업로드 완료");
		return "/files/"+sysName;
	}
	
	@RequestMapping(value ="/fileUpload3.do",produces="text/html;charset=utf8")
	@ResponseBody
	public String image3(MultipartFile fileUpload3) {
		String oriName = fileUpload3.getOriginalFilename();
		String sysName = System.currentTimeMillis()+"_"+oriName;
		String path = session.getServletContext().getRealPath("files");
		File filePath = new File(path);
		if (!filePath.exists()) {
			filePath.mkdir();
		}
		try {
			fileUpload3.transferTo(new File(path+"/"+sysName));
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		System.out.println("파일업로드 완료");
		return "/files/"+sysName;
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
			pdto.setWriter(((LoginInfoDTO)session.getAttribute("loginInfo")).getId());
			ps.insertWrite(pdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:toPlogmain.do";
	}
	
	@RequestMapping("/toPlogmain.do")
	public String toPlogmain() {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
		List<PortfolioDTO> list = ps.selectList(info.getId());
		MemberDTO mdto = ms.selectMember(info.getId());
		request.setAttribute("point", mdto.getPoint());
		request.setAttribute("list", list);
		return "/plog/plogPortfolio";
	}
	
	
	
	@RequestMapping("detail.do")
	public String viewDetail(int seq) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
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
	
	@RequestMapping("/toModify.do")
	public String toUpdate(int seq) {
		PortfolioDTO pdto = ps.selectBySeq(seq);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(pdto.getStartDate());
		String end = sdf.format(pdto.getEndDate());
		System.out.println(str);
		System.out.println(end);
		request.setAttribute("str", str);
		request.setAttribute("end", end);
		request.setAttribute("pdto", pdto);
		
		return "/plog/modifyPortfolio";
	}
	
	@RequestMapping("/update.do")
	public String update(PortfolioDTO pdto,String startDateTemp,String endDateTemp) {
		try {
			request.setCharacterEncoding("UTF-8");
			System.out.println("st"+ startDateTemp);
			System.out.println("end"+ endDateTemp);
		    String startDate = startDateTemp + " 00:00:00.0";
		    String endDate = endDateTemp + " 00:00:00.0";
			pdto.setStartDate(Timestamp.valueOf(startDate));
			pdto.setEndDate(Timestamp.valueOf(endDate));
			pdto.setWriter(session.getAttribute("loginInfo").toString());
			ps.update(pdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:toPlogmain.do";
	}
	
	@RequestMapping("/delete.do")
	public String delete(int seq) {
		ps.delete(seq);
		return "redirect:toPlogmain.do";
	}
}
