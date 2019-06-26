package global.sesoc.web3.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CookieController {

	private static final Logger logger = LoggerFactory.getLogger(CookieController.class);
	
	@RequestMapping(value = "cookie1", method = RequestMethod.GET)
	public String cookie1(HttpServletResponse response){
		Cookie c1 = new Cookie("name", "abc");
		Cookie c2 = new Cookie("num", "123");
		
		response.addCookie(c1);
		response.addCookie(c2);
		c1.setMaxAge(365*24*60*60);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "cookie2", method = RequestMethod.GET)
	public String cookie2(HttpServletRequest request){
		Cookie cks[] = request.getCookies();
		String ip = request.getRemoteAddr();
		//이 사이트에서 저장된 모든 쿠키
		for(Cookie c : cks){
			logger.info("이름:{}, 값:{}", c.getName(), c.getValue());
		}
		/*for(int i = 0;i < cks.length - 1;i++){
			logger.debug("이름:{}, 값:{}", cks[i].getName(), cks[i].getValue());
			logger.debug(ip);
		}*/
		//클라이언트의 요청 IP
		logger.info("요청 IP : {}", ip);
		return "redirect:/";
	}
	
	//더 간단히 쿠키 읽기, 딱 필요한 메서드만 사용하는 방법(2개)
	@RequestMapping(value = "cookie3", method = RequestMethod.GET)
	public String cookie3(
			@CookieValue(value="name", defaultValue="") String name
			, @CookieValue(value="num", defaultValue="0") int num	){
		
		logger.debug("name:" + name);
		logger.debug("num:" + num);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "cookie4", method = RequestMethod.GET)
	public String cookie4(HttpServletRequest request, HttpServletResponse response){
		Cookie cks[] = request.getCookies();
		for(Cookie c : cks){
			c.setMaxAge(0);
			response.addCookie(c);
		}
		return "redirect:/";
	}
	
}
