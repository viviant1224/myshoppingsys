package cn.com.shxt.service;

import java.util.List;
import java.util.Map;

import cn.com.shxt.dao.UserDao;
import cn.com.shxt.utils.DBUtil;

public class UserService implements UserDao {
	DBUtil dbUtil = new DBUtil();

	@Override
	public List<Map<String, String>> query(String sql) {
		// TODO Auto-generated method stub
		List<Map<String, String>>  resList=	dbUtil.queryByList(sql);
		return resList; 
	}

	@Override
	public int update(String sql) {
		
		int i = dbUtil.update(sql);
		return i;
		
	}

}
