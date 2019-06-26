package global.sesoc.ajax.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class jQueryController {
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@RequestMapping(value="jq1", method=RequestMethod.GET)
	public String jq1(){
		return "jquery/jq1";
	}
	
	@RequestMapping(value="jq2", method=RequestMethod.GET)
	public String jq2(){
		return "jquery/jq2";
	}
	
	@RequestMapping(value="jq3", method=RequestMethod.GET)
	public String jq3(){
		return "jquery/jq3";
	}
}
