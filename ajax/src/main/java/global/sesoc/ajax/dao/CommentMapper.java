package global.sesoc.ajax.dao;

import java.util.ArrayList;

import global.sesoc.ajax.vo.CommentVO;

public interface CommentMapper {
	public int insert(CommentVO vo);
	public ArrayList<CommentVO> list();
	public void delete(int num);
	public void edit(CommentVO vo);
}
