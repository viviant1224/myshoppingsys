package cn.com.shxt.dao;

import java.util.List;
import java.util.Map;


public interface UserDao {
	
	/**
	 * @黄威威 Administrator
	 * @说明：查询结果集
	 * @return  返回一个List代表所查询的结果集
	 */
	public List<Map<String, String>> query(String sql);
	
	
	/**
	 * @黄威威 Administrator
	 * @说明：更新语句
	 * @return  返回0，更新失败，返回1，更新成功
	 */
	public int update(String sql);

}
