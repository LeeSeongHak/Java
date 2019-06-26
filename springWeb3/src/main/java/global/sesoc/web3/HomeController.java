package global.sesoc.web3;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(
			Locale locale
			, Model model
			, HttpServletResponse response
			, @CookieValue(value="count", defaultValue="0") int ct) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
/*		if(ct == 0){
			Cookie cnt = new Cookie("count", "0");
			model.addAttribute("cnt",cnt.getValue());
			ct++;
			cnt.setValue(String.valueOf(ct));
			response.addCookie(cnt);
		}
		else {
			Cookie cnt = new Cookie("count", String.valueOf(ct));
			model.addAttribute("cnt",cnt.getValue());
			ct++;
			cnt.setValue(String.valueOf(ct));
			response.addCookie(cnt);
		}*/
		
/*		ct++;
		Cookie cnt = new Cookie("count", String.valueOf(ct));
		response.addCookie(cnt);
		model.addAttribute("cnt", cnt.getValue());*/
		
		Cookie c = new Cookie("count", Integer.toString(ct + 1));
		response.addCookie(c);
		model.addAttribute("cnt", ct + 1);
		
		return "home";
	}
	
}
