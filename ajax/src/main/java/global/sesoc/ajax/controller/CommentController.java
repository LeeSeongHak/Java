package global.sesoc.ajax.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.ajax.dao.CommentDAO;
import global.sesoc.ajax.vo.CommentVO;

@Controller
public class CommentController {
	public static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	CommentDAO dao;
	
	@RequestMapping(value="comment", method=RequestMethod.GET)
	public String comment(){
		return "ajax/comment";
	}
	
	@ResponseBody
	@RequestMapping(value="write", method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	public void write(CommentVO vo){
		logger.debug("vo : {}", vo);
		int cnt;
		dao.write(vo);
		return;
	}
	
	@ResponseBody
	@RequestMapping(value="list", method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	public ArrayList<CommentVO> list(){
		ArrayList<CommentVO> ar;
		ar = dao.list();
		return ar;
	}
	
	@ResponseBody
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public void delete(int num){
		dao.delete(num);
		return;
	}
	
	@ResponseBody
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public void edit(int num, String name, String text){
		CommentVO vo = new CommentVO();
		vo.setNum(num);
		vo.setName(name);
		vo.setText(text);
		dao.edit(vo);
		return;
	}
}
