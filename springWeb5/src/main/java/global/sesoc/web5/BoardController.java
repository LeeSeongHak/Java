package global.sesoc.web5;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web5.dao.BoardMapper;
import global.sesoc.web5.vo.BoardVO;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	//글쓰기 폼으로 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm(){
		return "writeForm";
	}
	
	//글 저장 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String joinForm(BoardVO vo){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		int cnt = mapper.write(vo);
		
		if(cnt == 0){
			return "writeForm";
		}
		else{
		return "redirect:/bbslist";
		}
	}
	
	//글 목록 보기
	@RequestMapping(value = "/bbslist", method = RequestMethod.GET)
	public String bbsList(Model model){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> list = null;
		try{
			list = mapper.list();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "bbslist";
	}
	
	//글 삭제하기
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete1(){
		return "deleteForm";
	}
	
	//글 삭제하기2
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete2(BoardVO vo){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = mapper.delete(vo);
		if(cnt == 0){
			return "/delete";
		}
		else{
		return "redirect:/bbslist";
		}
	}
	
	//글 삭제하기3
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public String del(BoardVO vo){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = 0; 
		cnt = mapper.del(vo);
		return "redirect:/bbslist";
	}
	
	//글 삭제하기4
	@RequestMapping(value= "/del2", method = RequestMethod.POST)
	public String del2(int boardnum, String password){
		logger.debug("글번호:{},비밀번호:{}", boardnum, password);
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardnum", boardnum);
		map.put("password", password);
		
		cnt = mapper.del2(map);
		
		return "redirect:/bbslist";
	}
}
