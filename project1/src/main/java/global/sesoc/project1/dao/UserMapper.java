package global.sesoc.project1.dao;

import java.util.HashMap;

import global.sesoc.project1.vo.UserVO;

public interface UserMapper {
	public UserVO login(HashMap<String, Object> map);
	public int join(UserVO vo);
	public UserVO getCustomer(String id);
}
