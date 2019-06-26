package global.sesoc.web6.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.web6.dao.BoardDAO;
import global.sesoc.web6.util.FileService;
import global.sesoc.web6.util.PageNavigator;
import global.sesoc.web6.vo.BoardVO;
import global.sesoc.web6.vo.ReplyVO;

@Controller
@RequestMapping("board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//페이지당 글 수
	private static final int countPerPage = 10;
	
	//페이지 이동 링크 그룹당 페이지 수
	private static final int pagePerGroup = 10;
	
	//업로드할 파일 경로
	final String uploadPath = "/boardfile";
	
	@Autowired
	BoardDAO dao;
	
	/**
	 * 게시판 페이지 만들기
	 */
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String boardHome(
			@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String text
			, Model model){
			//@RequestParam은 default값을 정할 필요가 있을 때 쓰는 것이다.
		int total = dao.getTotal(text); // 현재 전체 글 개수
		PageNavigator navi =
				new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<BoardVO> vo = null;
		vo = dao.list(navi.getStartRecord(), navi.getCountPerPage(), text);
		
		model.addAttribute("list", vo);
		model.addAttribute("total", total);
		model.addAttribute("navi", navi);
		model.addAttribute("text", text);
		
		logger.debug("page: {}, text: {}", page, text);
		
		return "board/boardForm";
	}
	
	@RequestMapping(value="/readForm", method=RequestMethod.GET)
	public String readForm(int boardnum, Model model, HttpSession session){
		session.setAttribute("boardNum", boardnum);
		BoardVO vo = null;
		//전달받은 번호의 글 정보 읽기
		vo = dao.read(boardnum);
		//해당 글의 조회수 1증가
		dao.hits(boardnum);
		logger.debug("vo : {}", vo);
		
		vo.setContent(vo.getContent().replaceAll("\r\n", "<br>"));
		vo.setContent(vo.getContent().replaceAll("\r", "<br>"));
		vo.setContent(vo.getContent().replaceAll("\n", "<br>"));
		
		//해당 글에 달린 리플 목록 읽기
		ArrayList <ReplyVO> reply = null;
		reply = dao.replyRead(boardnum);
		
		model.addAttribute("num", boardnum);
		model.addAttribute("read", vo);
		model.addAttribute("reply", reply);
		return "board/readForm";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeForm(){
		return "board/writeForm";
	}
	
	@RequestMapping(value="/write2", method=RequestMethod.POST)
	public String writeForm2(
			BoardVO vo
			, HttpSession session
			, MultipartFile upload){
		String id = (String) session.getAttribute("loginId");
		vo.setId(id);
		int cnt = 0;
		
		//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 Board객체에 세팅
		//&&연산자는 앞에서부터 하기 때문에, null 처리를 맨 앞에 써주어야한다. 안그러면 nullpoint exception 발생.
		if (upload != null && !upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			vo.setOriginalfile(upload.getOriginalFilename());
			vo.setSavedfile(savedfile);
		}
		
		cnt = dao.write(vo);
		if(cnt == 0){
			return "board/writeForm";
		}
		else{
			return "redirect:board";
		}
	}
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(int boardnum, Model model, HttpServletResponse response) {
		BoardVO board = dao.get(boardnum);		//글 1개에 대한 정보
		
		//원래의 파일명
		String originalfile = new String(board.getOriginalfile());
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + board.getSavedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String edit1(HttpSession session, BoardVO vo, Model model){
		int bnum = (int)session.getAttribute("boardNum");
		vo = dao.read(bnum);
		model.addAttribute("edit", vo);
		return "board/editForm";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit2(HttpSession session, BoardVO vo, MultipartFile upload){
		int bnum = (int)session.getAttribute("boardNum");
		vo.setBoardnum(bnum);
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		
		//업로드 파일 수정하기
		if (upload != null && !upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			vo.setOriginalfile(upload.getOriginalFilename());
			vo.setSavedfile(savedfile);
		}

		int cnt = dao.edit(vo);
		
		if(cnt == 0){
			return "redirect:/edit";
		}
		else{
		return "redirect:readForm?boardnum=" + vo.getBoardnum();
		}
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteForm(HttpSession session){
		String id = (String) session.getAttribute("loginId");
		int boardnum = (int) session.getAttribute("boardNum");
		logger.debug("loginid:{},boardnum:{}",id, boardnum);
			
		dao.delete(id, boardnum);
		return "redirect:board";
	}
	
	/**
	 * 리플을 저장하고 원래 글로 되돌아간다.
	 */
	@RequestMapping(value="/replyWrite", method=RequestMethod.POST)
	public String replyWrite(HttpSession session, ReplyVO reply, Model model){
		String id = (String) session.getAttribute("loginId");//세션에서 로그인한 아이디를 읽는다.
		reply.setId(id);//아이디를 reply객체에 추가
		//리플 정보를 테이블에 저장한다.
		int result = dao.replyWrite(reply);
		
		if(result == 0){
			//저장 실패하면 글목록으로 돌아간다.
			return "redirect:list";
		}
		else{
			return "redirect:readForm?boardnum=" + reply.getBoardnum();
		}
	}
	
/*	@RequestMapping(value="/replyEdit", method=RequestMethod.GET)
	public String replyEdit(HttpSession session, int replynum, String id, int i, Model model){
		int num = (int) session.getAttribute("replynum");
		String loginId = (String) session.getAttribute("loginId");
		
		if(id == loginId){
			model.addAttribute("replyNum", num);
			model.addAttribute("loginId", loginId);
			model.addAttribute("ii",i);
			return "replyEditForm";
		}
		
		return "redirect:readForm?boardnum=" + num;
	}*/
	
/*	@RequestMapping(value="/replyEdit", method=RequestMethod.POST)
	public String replyEdit2(HttpSession session, int replynum, String id){
		int num = (int) session.getAttribute("replynum");
		dao.replyEdit(replynum, id);
		return "redirect:readForm?boardnum=" + num;
	}*/
	
	@RequestMapping(value="/replyDelete", method=RequestMethod.GET)
	public String replyDelete(HttpSession session, int replynum, String id, int boardnum, Model model){
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId", loginId);
		if(id.equals(loginId)){
			dao.replyDelete(replynum, id);
		}
		return "redirect:readForm?boardnum=" + boardnum;
	}
}
