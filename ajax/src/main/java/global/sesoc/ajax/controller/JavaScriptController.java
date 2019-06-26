package global.sesoc.ajax.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JavaScriptController {
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@RequestMapping(value="js1", method=RequestMethod.GET)
	public String js1(){
		return "javascript/js1";
	}
	
	@RequestMapping(value="js2", method=RequestMethod.GET)
	public String js2(){
		return "javascript/js2";
	}
	
	@RequestMapping(value="js3", method=RequestMethod.GET)
	public String js3(){
		return "javascript/js3";
	}
	
	@RequestMapping(value="js4", method=RequestMethod.GET)
	public String js4(){
		return "javascript/js4";
	}
	
	@RequestMapping(value="pc", method=RequestMethod.GET)
	public String pc(){
		return "javascript/pc";
	}
	
	@RequestMapping(value="mobile", method=RequestMethod.GET)
	public String mobile(){
		return "javascript/mobile";
	}
	
	@RequestMapping(value="js5", method=RequestMethod.GET)
	public String js5(){
		return "javascript/js5";
	}
	
	@RequestMapping(value="js5_1", method=RequestMethod.GET)
	public String js5_1(){
		return "javascript/js5_1";
	}
}
