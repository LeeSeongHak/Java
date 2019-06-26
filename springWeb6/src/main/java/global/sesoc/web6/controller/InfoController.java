package global.sesoc.web6.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web6.dao.CustomerDAO;
import global.sesoc.web6.vo.CustomerVO;

/**
 * 개인정보 수정 컨트롤러
 */
@Controller
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@Autowired
	CustomerDAO dao;
	
	//개인정보 수정 폼으로 이동
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public String updateForm(HttpSession session, Model model){
		//세션에서 로그인아이디 읽기
		String id = session.getAttribute("loginId").toString();

		//그 아이디로 DB에서 개인정보 검색하여 VO객체로 리턴
		CustomerVO vo = dao.getCustomer(id);
		
		//VO객체를 모델에 저장하고 수정폼JSP로 포워딩
		model.addAttribute("customer",vo);
		return "customer/updateForm";
	}
	
	//사용자가 수정입력한 정보를 DB에 update
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(HttpSession session, CustomerVO vo){
		String custid = (String) session.getAttribute("loginId");
		vo.setCustid(custid);
		int cnt = dao.update(vo);
		
		if(cnt == 0){
			return "customer/updateForm";
		}
		else{
			session.setAttribute("loginName", vo.getName());
			return "redirect:/updateInfo";
		}
	}
	
	//수정된 결과를 보여주는 페이지로 이동
	@RequestMapping(value="/updateInfo", method=RequestMethod.GET)
	public String updateInfo(HttpSession session, Model model){
		
		String id = session.getAttribute("loginId").toString();

		CustomerVO vo = dao.getCustomer(id);
		
		model.addAttribute("customer",vo);
		logger.debug("customer : {}", model.containsAttribute("customer"));
		return "customer/updateInfo";
	}
}
