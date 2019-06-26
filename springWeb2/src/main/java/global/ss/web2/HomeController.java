package global.ss.web2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("메인화면 접속");
		
		model.addAttribute("test", "뷰로 보내는 문자열" );
		return "home";
	}
	
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String test1() {
		logger.info("test1 지나감");
		return "test1";
	}
	
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String test2() {
		logger.info("test2 지나감");
		return "test2";
	}
	
	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String test3() {
		logger.info("test3 지나감");
		return "test/test3";
	}
	
	@RequestMapping(value = "/abc/test4", method = RequestMethod.GET)
	public String test4() {
		logger.info("test4 지나감");
		return "test4";
	}
}
