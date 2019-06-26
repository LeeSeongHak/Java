package global.sesoc.web6.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import global.sesoc.web6.dao.CustomerDAO;
import global.sesoc.web6.vo.CustomerVO;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	CustomerDAO dao;
	
	//로그인 폼으로 이동
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm(){
		return "customer/loginForm";
	}
	
	//로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String custid, String password, Model model, HttpSession session){
		//사용자가 입력한 id로 검색
		CustomerVO vo1 = null;
		vo1 = dao.getCustomer(custid);
		if(vo1 == null){
			return "customer/loginForm";
		}
		//비밀번호도 확인
		if(!vo1.getPassword().equals(password)){
			return "customer/loginForm";
		}
		//id, 비번 맞으면 세션에 "loginID"로 ID 저장, "loginName"으로 이름 저장(세션 이용)
		session.setAttribute("loginId", custid);
		session.setAttribute("loginName", vo1.getName());
		logger.debug("loginId:{}", session.getAttribute("loginId"));
		logger.debug("custid:{}", custid);
		return "redirect:/";
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}
