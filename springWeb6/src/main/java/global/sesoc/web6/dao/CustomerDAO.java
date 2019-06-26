package global.sesoc.web6.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web6.vo.CustomerVO;

/**
 * 회원 관련 DAO
 */
@Repository
public class CustomerDAO {
	@Autowired
	SqlSession sqlSession;
	
	public int insert(CustomerVO vo){
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int cnt = 0;
		cnt = mapper.insert(vo);
		return cnt;
	}
	
	public CustomerVO getCustomer(String custid){
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		CustomerVO vo = null;
		vo = mapper.getCustomer(custid);
		return vo;
	}
	
	public int update(CustomerVO vo){
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		int cnt = 0;
		cnt = mapper.update(vo);
		return cnt;
	}
}
