package global.sesoc.web3.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web3.vo.PersonVO;

@Controller
public class ParamController {
	private static final Logger logger = LoggerFactory.getLogger(ParamController.class);
	
	@RequestMapping(value = "/param1", method = RequestMethod.GET)
	public String param1method(String name, String num) {
		logger.info("param1 실행됨");
		logger.debug("name:{}, num:{}", name, num);
		return "param1output";
	}
	
	@RequestMapping(value = "/param2", method = RequestMethod.GET)
	public String param2method(){
		logger.info("param2 실행됨");
		return "param2output";
	}
	
	@RequestMapping(value = "/param2Post", method = RequestMethod.POST)
	public String param2send(String str, String num, String radio, String sel, String text, String check[]){
		logger.info("가입");
		logger.debug("str:{}, num:{}, radio:{}, sel:{}, text:{}, check:{}", str, num, radio, sel, text, check);
		
		if(check != null){
			for(int i = 0;i < check.length;i++){
				logger.debug("check:{}", check[i]);
			}	
		}	
		return "redirect:/";
	}
	
	@RequestMapping(value = "/param3" , method = RequestMethod.GET)
	public String param3method(){
		logger.info("param3 실행됨");
		return "param3output";
	}
	
/*	@RequestMapping(value = "/param3form", method = RequestMethod.POST)
	public String param3form(String name, String age, String phone, String address){
		logger.debug("이름:{}, 나이:{}, 전화번호:{}, 주소:{}", name, age, phone, address);
		
		PersonVO vo = new PersonVO();
		
		vo.setName(name);
		vo.setAge(age);
		vo.setPhone(phone);
		vo.setAddress(address);
		
		return "redirect:/";
	}*/
	
/*	@RequestMapping(value = "/param3form", method = RequestMethod.POST)
	public String param3form(PersonVO p){
		logger.debug("PersonVO:{}", p);
			
		return "redirect:/";
	}*/
	
	@RequestMapping(value = "/param3form", method = RequestMethod.POST)
	public String param3form(PersonVO p, String textarea){
		logger.debug("PersonVO:{}, textarea:{}", p, textarea);
		return "redirect:/";
	}
	
}
