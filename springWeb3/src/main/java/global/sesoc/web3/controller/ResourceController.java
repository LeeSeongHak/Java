package global.sesoc.web3.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ResourceController {
	private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);
	
	@RequestMapping(value = "/res", method = RequestMethod.GET)
	public String resource1(){
		logger.info("res1 실행");
		return "web3/res";
	}
	
	//URL 연습
	@RequestMapping(value = "/test/urltest", method = RequestMethod.GET)
	public String urltest(Model model){
		return "web3/urltest";
	}
	
}
