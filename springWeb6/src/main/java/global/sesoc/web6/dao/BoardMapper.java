package global.sesoc.web6.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.web6.vo.BoardVO;
import global.sesoc.web6.vo.ReplyVO;

public interface BoardMapper {
	public ArrayList<BoardVO> list(RowBounds rb, String text);
	public int getTotal(String text);
	public BoardVO read(int boardnum);
	//게시글 저장
	public int write(BoardVO vo);
	public void hits(int boardnum);
	//글번호로 해당 게시글 검색
	public BoardVO getBoard(int boardnum);
	public int edit(BoardVO vo);
	public int del(HashMap<String, Object> map);
	public BoardVO search(String searchText);
	public int replyWrite(ReplyVO reply);
	public ArrayList<ReplyVO> replyRead(int boardnum);
/*	public void replyEdit(HashMap<String, Object> map);*/
	public void replyDelete(HashMap<String, Object> map);
}