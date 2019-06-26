package global.sesoc.web6.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web6.vo.BoardVO;
import global.sesoc.web6.vo.ReplyVO;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<BoardVO> list(int start, int count, String text){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		
		//RowBounds = start부터 count 갯수만큼 가져오는 함수.
		RowBounds rb = new RowBounds(start, count);
		
		ArrayList<BoardVO> boardlist = mapper.list(rb, text);
		return boardlist;
	}
	
	public int getTotal(String text){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = 0;
		cnt = mapper.getTotal(text);
		return cnt;
	}
	
	public BoardVO read(int boardnum){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = null;
		vo = mapper.read(boardnum);
		return vo;
	}
	
	public BoardVO search(String searchText){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = mapper.search(searchText);
		return vo;
	}
	
	public int write(BoardVO vo){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = 0;
		cnt = mapper.write(vo);
		return cnt;
	}
	
	public void hits(int boardnum){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.hits(boardnum);
	}
	
	public BoardVO get(int boardnum) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		//해당 번호의 글정보 읽기
		BoardVO board = mapper.getBoard(boardnum);
		return board;
	}
	
	public int edit(BoardVO vo){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = 0;
		cnt = mapper.edit(vo);
		return cnt;
	}
	
	public int delete(String id, int boardnum){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("boardnum", boardnum);
		
		cnt = mapper.del(map);
		
		return cnt;
	}
	
	public int replyWrite(ReplyVO reply){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int cnt = mapper.replyWrite(reply);
		return cnt;
	}
	
	public ArrayList<ReplyVO> replyRead(int boardnum){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<ReplyVO> reply = null;
		reply = mapper.replyRead(boardnum);
		return reply;
	}
	
/*	public void replyEdit(int replynum, String id){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replynum", replynum);
		map.put("id", id);
		mapper.replyEdit(map);
	}*/
	
	public void replyDelete(int replynum, String id){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replynum", replynum);
		map.put("id", id);
		mapper.replyDelete(map);
	}
}
