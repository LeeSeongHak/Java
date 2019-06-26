package global.sesoc.web4;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web4.dao.MemberMapper;
import global.sesoc.web4.vo.Member;

/**
 * 회원 가입, 회원 목록 보기 컨트롤러
 */
@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//빈으로 등록된 것을 가져옴
	@Autowired
	SqlSession sqlSession;
	
	//가입 폼으로 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String viewJoinForm() {
		return "joinForm";
	}

	//가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Member member) {
		logger.info("전달된 param : {}", member);
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.insert(member);
		}
		catch (Exception e) {
			e.printStackTrace();
			return "joinForm";
		}
		if (result != 1) {
			return "joinForm";
		}
		return "home";
	}
	
	//로그인 하기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login1(){
		return "loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login2(Member member){
		logger.info("전달된 param : {}", member);
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		try{
		mapper.login(member);
		
		
		if(mapper.login(member).getId().equals(member.getId()) && mapper.login(member).getPassword().equals(member.getPassword())){
			return "home";
			
		}
		else
			return "loginForm";
		}
		catch(Exception e){
			return "loginForm";
		}
	}
	
	//모든 회원정보 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model){
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<Member> list = null;
		try{
			list = mapper.select();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "listForm";
	}
	
	//회원 검색하기
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(){
		return "searchForm";
	}
	
	//회원검색하기(2)
	@RequestMapping(value = "/search2", method = RequestMethod.POST)
	public String search2(String id, Model model){
		logger.debug(id);
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		Member member =	mapper.selectOne(id);
		
		model.addAttribute("member", member);
		return "selectOne";
	}
	
	//회원검색하기(3)
		@RequestMapping(value = "/search2", method = RequestMethod.GET)
		public String search3(String id, Model model){
			logger.debug(id);
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			Member member =	mapper.selectOne(id);
			
			model.addAttribute("member", member);
			return "selectOne";
		}
	
	//회원삭제하기
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete1(){
		return "deleteForm";
	}
	
	//회원삭제하기(2)
	@RequestMapping(value="/delete2", method=RequestMethod.POST)
	public String delete2(String id){
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int cnt = mapper.delete(id);
		
		if(cnt != 0){
			return "redirect:/";
		}
		else{
			return"deleteForm";
		}
	}
	
	//회원삭제하기(3)
	@RequestMapping(value="/delete2", method=RequestMethod.GET)
	public String delete3(String id){
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int cnt = mapper.delete(id);
		
		if(cnt != 0){
			return "redirect:/";
		}
		else{
			return"deleteForm";
		}
	}
}
