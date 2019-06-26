package global.sesoc.ajax.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ajax.vo.CommentVO;

@Repository
public class CommentDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int write(CommentVO vo){
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		int cnt = 0;
		cnt = mapper.insert(vo);
		return cnt;
	}
	
	public ArrayList<CommentVO> list(){
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		ArrayList<CommentVO> ar;
		ar = mapper.list();
		return ar;
	}
	
	public void delete(int num){
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		mapper.delete(num);		
		return;
	}
	
	public void edit(CommentVO vo){
		CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
		mapper.edit(vo);
		return;
	}
}
