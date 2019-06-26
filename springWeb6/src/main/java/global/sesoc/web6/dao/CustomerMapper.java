package global.sesoc.web6.dao;

import global.sesoc.web6.vo.CustomerVO;

public interface CustomerMapper {
	public int insert(CustomerVO vo);
	public CustomerVO getCustomer(String custid);
	public int update(CustomerVO vo);
}
