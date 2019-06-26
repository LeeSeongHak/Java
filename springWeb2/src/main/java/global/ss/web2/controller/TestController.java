package global.ss.web2.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping(value = "/aaa/test5", method = RequestMethod.GET)
	public String test5(Model model) {
		
		logger.info("test5 지나감");
		
		String str = "서버에서 가져온 문자열";
		int num = 1000;
		
		String ar[] = {"aaa", "bbb", "ccc"};
		HashMap<String, Integer> map = new HashMap<>();
		map.put("one", 1);
		map.put("two", 2);
		
		ArrayList<String> arr = new ArrayList<>();
		for(int i = 0;i < 100;i++){
			arr.add("a");
		}
		String n = "홍길동";
		int k = 100;
		int e = 90;
		student st = new student(n, k, e);
		
		model.addAttribute("text",str);
		model.addAttribute("number", num);
		model.addAttribute("ar", ar);
		model.addAttribute("arr", arr);
		model.addAttribute("map", map);
		model.addAttribute("st", st);
		
		return "test5";
	}
	
	//Form으로 이동
	@RequestMapping(value = "/test6", method = RequestMethod.GET)
	public String test6(){
		logger.info("test6");
		return "test6";
	}
	
	//Form에서 입력된 데이터 처리
	//value 는 form의 action과, method는 form의 method와 맞춰줘야한다.
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(String name, int age){
		logger.debug("이름:" + name + ", 나이:" + age);
		logger.debug("이름:{}, 나이:{}" + name, age);
		return "redirect:/test1";
	}	
}