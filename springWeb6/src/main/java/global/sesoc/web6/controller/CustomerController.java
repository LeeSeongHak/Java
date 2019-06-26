package global.sesoc.web6.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web6.dao.CustomerDAO;
import global.sesoc.web6.vo.CustomerVO;

@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//Autowired 안쓰고 그냥 객체 생성하면 null exception error가 발생함. 꼭 써주자.
	@Autowired
	CustomerDAO dao;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join1(){
		return "customer/joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join2(CustomerVO vo){
		logger.debug("vo : {}", vo);
		dao.insert(vo);
		return "redirect:/";
	}
	
	//ID 중복확인
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public String idCheck(){
		return "customer/idCheck";
	}
	
	//ID 중복확인2
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public String idCheck2(String searchId, Model model){
		//ID를 전달하여 검색 결과를 VO 객체로 받음
		CustomerVO vo = dao.getCustomer(searchId);
		//검색 결과를 Model에 저장하고 JSP로 다시 이동
		model.addAttribute("searchId", searchId);
		//검색한 결과를 담아 리턴.
		model.addAttribute("searchResult", vo);
		//검색해서 null인지, 검색안해서 null인지 확인하기 위해 search 하나 더 만든 것. result와 search 모두 null이면 검색조차 안한것.
		model.addAttribute("search", true);
		return "customer/idCheck";
	}
}
