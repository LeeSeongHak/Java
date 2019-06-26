package global.sesoc.web3.controller;

import java.util.ArrayList;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web3.vo.PersonVO;

@Controller
public class JSPController {
	private static final Logger logger = LoggerFactory.getLogger(JSPController.class);
			
	@RequestMapping(value = "/jsp1", method = RequestMethod.GET)
	public String jsp1method(){
		logger.info("jsp1 실행됨");
		return "jsp1output";
	}
	
	@RequestMapping(value = "/jstl1", method = RequestMethod.GET)
	public String jstl1method(Model model){
		logger.info("jstl1 실행됨");
		
		int number = 1000000;
		
		String str = "<marquee direction=up scrollamount=9 > abcd </marquee>";
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("<marquee direction=up scrollamount=9 > aaa </marquee>");
		list.add("<marquee direction=down scrollamount=9 > bbb </marquee>");
		list.add("<marquee direction=left scrollamount=9 > ccc </marquee>");
		list.add("<marquee direction=right scrollamount=9 > ddd </marquee>");
		
		String phone = "<marquee behavior=alternate direction=right bgcolor=red scrollamount=9> 010-1111-2222 </marquee>";
		
		String phone1 = "010-1111-2222";
		
		String data = "<marquee scrollamount=9> 글자가 날아다닌다 </marquee>";
		
		ArrayList<PersonVO> plist = new ArrayList<PersonVO>();
		plist.add(new PersonVO("김", 20, "1111", "서울"));
		plist.add(new PersonVO("이", 30, "2222", "광주"));
		plist.add(new PersonVO("박", 40, "3333", "부산"));
		
		PersonVO person = new PersonVO("홍길동", 50, "4444", "대구");
		
		model.addAttribute("number", number);
		model.addAttribute("str", str);
		model.addAttribute("list", list);
		model.addAttribute("phone", phone);
		model.addAttribute("phone1", phone1);
		model.addAttribute("data", data);
		model.addAttribute("plist", plist);
		model.addAttribute("person", person);
		
		return "jstl1output";
	}
	
	@RequestMapping(value = "/jstl2", method= RequestMethod.GET)
	public String jspl2method(Model model){
		logger.info("jspl2 실행됨");
		
		Date today = new Date();
		double num1 = 12345.678;
		double num2 = 99.9;
		double num3 = 0.1;
		
		model.addAttribute("today", today);
		model.addAttribute("num1", num1);
		model.addAttribute("num2", num2);
		model.addAttribute("num3", num3);
		return "jstl2output";
	}
	
	@RequestMapping(value = "/jstl3", method = RequestMethod.GET)
	public String jspl3method(Model model){
		logger.info("jspl3 실행됨");
		String str = "abc ABC 가나다";
		model.addAttribute("str", str);
		return "jstl3output";
	}
}
