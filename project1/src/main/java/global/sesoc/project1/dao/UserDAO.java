package global.sesoc.project1.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project1.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	
	//login
	public UserVO login(String id, String password){
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		
		UserVO vo = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		
		vo = mapper.login(map);
		return vo;
	}
	
	//join
	public int join(UserVO vo){
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		
		int cnt = 0;
		cnt = mapper.join(vo);
		return cnt;
	}
	
	//ID check
	public UserVO getCustomer(String id){
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		UserVO vo = null;
		vo = mapper.getCustomer(id);
		return vo;
	}
}
