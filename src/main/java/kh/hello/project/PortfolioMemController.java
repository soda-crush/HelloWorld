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
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.dto.PortfolioDTO;
import kh.hello.services.MemberService;
import kh.hello.services.PortfolioService;

@Controller
@RequestMapping("/Portfolio")
public class PortfolioMemController {
	
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
		return "/files/"+sysName;
	}
	
	@RequestMapping("/insert.do")
	public String writeProcInsert(PortfolioDTO pdto,String startDateTemp,String endDateTemp) {
		try {
			request.setCharacterEncoding("UTF-8");

		    String startDate = startDateTemp + " 00:00:00.0";
		    String endDate = endDateTemp + " 00:00:00.0";
			pdto.setStartDate(Timestamp.valueOf(startDate));
			pdto.setEndDate(Timestamp.valueOf(endDate));
			pdto.setWriter(((OwnerInfoDTO)session.getAttribute("ownerInfo")).getId());
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
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		List<PortfolioDTO> list = ps.selectList(ownerInfo.getId());
		MemberDTO mdto = ms.selectMember(ownerInfo.getId());
		request.setAttribute("point", mdto.getPoint());
		request.setAttribute("list", list);
		return "/plog/plogPortfolio";
	}
	
	@RequestMapping("/toGuestPlogmain.do")
	public String toGuestPlogmain() {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("otherInfo");
		List<PortfolioDTO> list = ps.selectList(ownerInfo.getId());
		MemberDTO mdto = ms.selectMember(ownerInfo.getId());
		request.setAttribute("point", mdto.getPoint());
		request.setAttribute("list", list);
		return "/plog/guestPortfolio";
	}
	
	@RequestMapping("/toPlog.do")
	public String toPlog(String owner, String other) {
		MemberDTO mdto = ms.selectMember(owner);
		LoginInfoDTO ldto = (LoginInfoDTO)session.getAttribute("loginInfo");
		if(mdto.getIfmOpenCheck().equals("Y") || ldto.getId().equals(owner)) {
			OwnerInfoDTO odto = new OwnerInfoDTO();
			odto.setId(mdto.getId());	
			odto.setNickName(mdto.getNickName());
			odto.setProfileImg(mdto.getProfileImg());
			if(other.contentEquals("Y") && !(owner.contentEquals(ldto.getId()))) {
				session.setAttribute("otherInfo", odto);
				return "redirect:toGuestPlogmain.do";
			}else {
				session.setAttribute("ownerInfo", odto);
				return "redirect:toPlogmain.do";
			}
		}else {
			return "/plog/notOpenPage";
		}
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
		request.setAttribute("str", str);
		request.setAttribute("end", end);
		request.setAttribute("pdto", pdto);
		
		return "/plog/modifyPortfolio";
	}
	
	@RequestMapping("/update.do")
	public String update(PortfolioDTO pdto,String startDateTemp,String endDateTemp) {
		try {
			request.setCharacterEncoding("UTF-8");
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
	public String deleteProc(int seq) {
		ps.delete(seq);
		return "redirect:toPlogmain.do";
	}
}
