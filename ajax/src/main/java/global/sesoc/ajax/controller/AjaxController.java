package global.sesoc.ajax.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.ajax.vo.Person;

@Controller
public class AjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@RequestMapping(value="aj1", method=RequestMethod.GET)
	public String aj1(){
		return "ajax/ajax1";
	}
	
	//responsebody - ajax를 쓰기 위해 설정하는 것.
	@ResponseBody
	@RequestMapping(value="ajaxtest1", method=RequestMethod.GET)
	public void ajaxtest1(){
		logger.debug("AjaxController의 ajaxtest1() 실행됨");
	}
	
	//produces - javascript에서 java에서 보낸 신호를 한글이나 기타 언어까지 안깨지고 읽도록 설정하는 것.
	@ResponseBody
	@RequestMapping(value="ajaxtest2", method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	public String ajaxtest2(String str){
		logger.debug("클라이언트에서 보낸 값 : {} ", str);
		String text = "hiㅇㅇ123私は★";
		return text;
	}
	
	@RequestMapping(value="aj2", method=RequestMethod.GET)
	public String aj2(){
		return "ajax/ajax2";
	}
	
	@ResponseBody
	@RequestMapping(value="insert1", method=RequestMethod.POST)
	public void insert1(String name, int age, String phone){
		logger.debug("name : {}, age : {}, phone : {}", name, age, phone);
	}
	
	@ResponseBody
	@RequestMapping(value="insert2", method=RequestMethod.POST)
	public void insert2(Person vo){
		logger.debug("person : {}", vo);
		logger.debug("name : {}, age : {}, phone : {}", vo.getName(), vo.getAge(), vo.getPhone());
	}
	
	@ResponseBody
	@RequestMapping(value="insert3", method=RequestMethod.POST)
	public void insert3(Person vo){
		logger.debug("name : {}, age : {}, phone : {}", vo.getName(), vo.getAge(), vo.getPhone());
	}
	
	@ResponseBody
	@RequestMapping(value="jsontest", method=RequestMethod.GET)
	public Person jsontest(){
		Person person = new Person("홍길동", 20, "010-1111-2222");
		return person;
	}
	
}