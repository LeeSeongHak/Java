package global.sesoc.web5.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.web5.vo.BoardVO;

/**
 * 회원정보 관련 Mybatis 사용 메서드.
 * customerMapper.xml의 id와 매핑
 */
public interface BoardMapper {
	//글목록 출력
	public ArrayList<BoardVO> list();
	//글쓰기
	public int write(BoardVO vo);
	//글삭제하기
	public int delete(BoardVO vo);
	//글삭제하기2
	public int del(BoardVO vo);
	//글삭제하기3
	public int del2(HashMap<String, Object> map);
}
