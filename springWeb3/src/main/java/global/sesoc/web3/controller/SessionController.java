package global.sesoc.web3.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SessionController {
		private static final Logger logger = LoggerFactory.getLogger(SessionController.class);
		
		@RequestMapping(value = "/session1", method= RequestMethod.GET)
		public String session1(){
			logger.info("session1 실행됨");
			return "session/session1";
		}
		
		@RequestMapping(value = "/session2", method= RequestMethod.GET)
		public String session2(Model model, HttpSession session){
			logger.info("session2 실행됨");
			//model 값이므로 request객체임. 값 출력만 되고 저장 x.
			model.addAttribute("rvalue", "모델에 저장한 값");
			session.setAttribute("svalue", "세션에 저장한 값");
			return "session/session2";
		}
		
		@RequestMapping(value = "/session3", method = RequestMethod.GET)
		public String session3(HttpSession session){
			logger.info("session3 실행됨");
			//session 내에서 해당 이름을 가진 값만 초기화
			session.removeAttribute("svalue");
			//session 전체 초기화
			session.invalidate();
			return "redirect:/";
		}
	
		//로그인 폼으로 이동
		@RequestMapping(value = "/login", method= RequestMethod.GET)
		public String login(){
			logger.info("session2 실행됨");
			//model 값이므로 request객체임. 값 출력만 되고 저장 x.
			return "session/loginform";
		}
		
		//로그인 처리. method 방식이 다르기 때문에 로그인 폼과 value가 같아도 된다.
		@RequestMapping(value = "/login", method= RequestMethod.POST)
		public String loginProcess(HttpSession session, String id, String password, Model model){
			logger.info("session2 실행됨");
			//ID와 비밀번호를 확인하고
			if(!(id.equals("abc")) || !(password.equals("1234"))){	
				//틀리면 로그인 폼으로 되돌아감 (포워드)
				model.addAttribute("error", "ID 또는 비밀번호가 틀렸습니다.");
				return "session/loginform";
			}
			//맞으면 세션에 정보를 저장하고 메인화면으로 리다이렉트
			else{
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			return "redirect:/";
			}
		}
		
		@RequestMapping(value = "/logout", method=RequestMethod.GET)
		public String logout(HttpSession session){
			session.invalidate();
			return "redirect:/";
		}
}
