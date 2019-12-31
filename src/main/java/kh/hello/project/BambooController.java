package kh.hello.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bamboo/")
public class BambooController {
	@RequestMapping("/bamboolist.do")
	public String bamboolistView () {
		return "/bamboo/bambooList";
	}
}
