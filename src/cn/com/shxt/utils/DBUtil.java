package cn.com.shxt.utils;
  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

/**
 * @author ccitKing
 * @日期 : 2012-6-13
 * @描述 : 连接数据库工具类
 * @版本 : v0.1
 */
public class DBUtil {
	private Connection conn;
	private PreparedStatement statement;
	private Statement stmt;
	private ResultSet rs = null;
	/** 连接数据库URL thin连接方式 ： 协议＋主机地址＋资源名称 */ 
	private String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	 /** 用户名 */ 
	private String userName = "viviant";
	/** 密码 */
	private String password = "1224";

	/**
	 * 静态代码块
	 */
	static {
		try {
			// 直连接的方式加载驱动
			 //Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获得Connection
	 */
	public Connection getConn() {
		try {
			//直连接获得连接的方式
			 //conn = DriverManager.getConnection(url, userName, password);
			conn=DriverManager.getConnection("proxool.shxtPro");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 获取执行sql的Statement对象
	 * */
	public Statement getStmt() {
		try {
			conn = getConn();
			stmt = conn.createStatement();
			return stmt;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @param sql
	 *            采用预处理的PreparedStatement对象
	 * @return
	 */
	public PreparedStatement getPreStmt(String sql) {
		conn = getConn();
		try {
			statement = conn.prepareStatement(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return statement;
	}

	/**
	 * 使用Statement操作--查询
	 * 
	 * @param sql
	 * @return ResultSet
	 * */
	
	public ResultSet query(String sql) {
		try {
			rs = getStmt().executeQuery(sql);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			//colse();
		}
	}

	/**
	 * 执行数据更新的方法
	 * @param sql
	 *            String 的SQL语句
	 * @return Integer 类型的数据 表示受影响的行数
	 */
	public int update(String sql) {
		try {
			return getStmt().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			colse();
		}
	}

	/**
	 * 执行数据更新的方法
	 * @param sql params
	 *            String 的SQL语句
	 *            params 为传递的对象参数
	 * @return Integer 类型的数据 表示受影响的行数
	 */
	public int updateByPreparedStatement(String sql,String[] params) {
		int result= 0;
		try {
			//prepareStatement
			statement = getConn().prepareStatement(sql);
			if(params!=null){
			for (int i = 0; i < params.length; i++) {
				//statement.setString(i + 1, params[i]);
				statement.setObject(i + 1, params[i]);
			  }
			}
			result = statement.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			colse();
		}
		return result;
	}
	
	
	/**
	 * @param sql
	 *            执行查询的sql语句
	 * @return ResultSet对象
	 */
	public ResultSet queryByPreparedStatement(String sql) {
		 ResultSet 	res = null;
		statement = getPreStmt(sql);
		try {
		 res = statement.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * @param sql
	 *            执行查询的sql语句
	 * @return ResultSet对象
	 */
	public ResultSet queryByStatement(String sql) {
		stmt = this.getStmt();
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	/**
	 * 查询数据 返回的是一个ArrayList对象，对象中的每一个元素是一个HashMap对象
	 * 
	 * @param sql
	 *            String 查询语句
	 * @return ArrayList 结果集
	 * @throws Exception
	 *  
	 */

	public List<Map<String, String>> queryByList(String sql) {
		System.out.println("登陆的sql: "+sql);
		try {
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			rs = getStmt().executeQuery(sql);
			// 得到结果集(rs)的结构信息，比如字段数、字段名等
			ResultSetMetaData rsmd = rs.getMetaData();
			// 得到数据集的列数
			int columncount = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				for (int i = 0; i < columncount; i++) {
					String key = rsmd.getColumnName(i + 1);
					String value = rs.getString(key);
					map.put(key, value);
				}
				list.add(map);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			colse();
		}
	}
	
	public List<Map<String, Object>> queryByList_obj(String sql) {
		try {
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			rs = getStmt().executeQuery(sql);
			// 得到结果集(rs)的结构信息，比如字段数、字段名等
			ResultSetMetaData rsmd = rs.getMetaData();
			// 得到数据集的列数
			int columncount = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 0; i < columncount; i++) {
					String key = rsmd.getColumnName(i + 1);
					//String value = rs.getString(key);
					Object value = rs.getObject(key);
					map.put(key, value);
				}
				list.add(map);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			colse();
		}
	}
	
	
	/**
	 * 查找一个数据集
	 * @param sql 字符串，传入sql查询语句
	 * */
	public ArrayList<String[]> queryByArray(String sql) {
		ArrayList<String[]> aList = null;
		try {
			aList = new ArrayList<String[]>();
			
			
			/* 2.获取连接 */
		    conn = this.getConn();
			
			/* 3.语句对象 */
			Statement stmt = conn.createStatement();
			
			/* 4.执行查询 */
			ResultSet rs = stmt.executeQuery(sql);
			
			/** 如何获取到当前的sql语句到底查询了哪些字段 */
			ResultSetMetaData rsmd = rs.getMetaData();	//通过结果集对象rs获取它的结构对象 rsmd
			
			//获取到的是SQL语句查询的字段总数
			int columnCount = rsmd.getColumnCount();

			//在rs未关闭之前，将rs中的数据存储到数据结构中
			while (rs.next()) {
				//rs每next一次将得到一行数据
			//	System.out.println("rs.next()");
				String[] values = new String[columnCount];
				for (int i = 0; i < columnCount; i++) {
					values[i] = rs.getString(rsmd.getColumnName(i + 1));
			//		System.out.print(values[i]+" ");
				}
			//	System.out.println();
				aList.add(values);
			}
			
			/* 5.释放资源 */
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aList;
	}
	
	public LinkedList<Map<String, Object>> queryByLinkedList(String sql) {
		try {
			LinkedList<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
			rs = getStmt().executeQuery(sql);
			// 得到结果集(rs)的结构信息，比如字段数、字段名等
			ResultSetMetaData rsmd = rs.getMetaData();
			// 得到数据集的列数
			int columncount = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 0; i < columncount; i++) {
					String key = rsmd.getColumnName(i + 1);
					String value = rs.getString(key);
					map.put(key, value);
				}
				list.add(map);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			colse();
		}
	}
	
	
	/**
	 * 查找一个数据集
	 * @param sql 字符串，传入sql查询语句
	 * */
	public ArrayList<Map<String,String>> queryForMapList(String sql) {
		ArrayList<Map<String,String>> aList = null;
		try {
			aList = new ArrayList<Map<String,String>>();
			
			/* 2.获取连接 */
			conn = this.getConn();
			/* 3.语句对象 */
			Statement stmt = conn.createStatement();
			
			/* 4.执行查询 */
			ResultSet rs = stmt.executeQuery(sql);
			
			/** 如何获取到当前的sql语句到底查询了哪些字段 */
			ResultSetMetaData rsmd = rs.getMetaData();	//通过结果集对象rs获取它的结构对象 rsmd
			
			//获取到的是SQL语句查询的字段总数
			int columnCount = rsmd.getColumnCount();
			Map<String,String> map;
			//在rs未关闭之前，将rs中的数据存储到数据结构中
			while (rs.next()) {
				//rs每next一次将得到一行数据
			//	System.out.println("rs.next()");
				map=new HashMap<String,String>();
				for (int i = 0; i < columnCount; i++) {
					map.put(rsmd.getColumnName(i + 1),  rs.getString(rsmd.getColumnName(i + 1)));
				}
			//	System.out.println();
				aList.add(map);
			}
			
			/* 5.释放资源 */
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aList;
	}
	/**
	 * 查找一个数据集
	 * @param sql 字符串，传入sql查询语句
	 * */
	public int queryCount(String sql) {
		int count=0;
		try {
			/* 2.获取连接 */
			  conn = this.getConn();
			
			/* 3.语句对象 */
			Statement stmt = conn.createStatement();
			
			/* 4.执行查询 */
			ResultSet rs = stmt.executeQuery(sql);
		    count=rs.getRow();
			/* 5.释放资源 */
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			return count;
		}
		return count;
	}
	/**
	 * 增加,删除，修改一行数据 
	 * */
	public  int updateByStatement(String sql){
		
	int row=0;
		try {
			/* 2.获取连接 */
			  conn = this.getConn();
			
			/* 3.语句对象 */
			Statement stmt = conn.createStatement();
			
		 row=stmt.executeUpdate(sql);
			
			stmt.close();
			conn.close();
	  
			
		} catch (Exception e) {
			e.printStackTrace();
			return row;
		}
	      return row;
	}
 
	/**
	 * 批量更新
	 * 
	 * @param sqls
	 *            String 查询语句数组
	 * @return int[] 计数组成的数组
	 * @throws Exception
	 */
	public int[] updateBatch(String[] sqls) {
		stmt = getStmt();
		try {
			startTransaction();
			for (String sql : sqls) {
				stmt.addBatch(sql);// 将所有的SQL语句添加到Statement中
			}
			int[] batchResultList = stmt.executeBatch();
			endTransaction();
			return batchResultList; // 返回更新计数组成的数组。
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			colse();
		}
		return null;
	}
	
	
	/**
	 * 执行批量,在有sql语句不能执行的情况下回滚数据库
	 * @param sqls
	 * @return
	 */
	public  boolean executeBatch(Vector<String> sqls){
		//Connection conn=null;
		Statement stmt=null;
		try {
		//	conn=DriverManager.getConnection(url,userName,password);
			conn.setAutoCommit(false);
			stmt=conn.createStatement();
			int length=sqls.size();
			for(int i=0;i<length;i++){
				String sql=sqls.get(i);
				stmt.addBatch(sql);
			}
			stmt.executeBatch();
			
		} catch (Exception e) {
			try {
				conn.rollback();
				return false;
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try{
			conn.commit();
			stmt.close();
			conn.close();
			}catch(Exception e){
				e.getStackTrace();
			}
	}
		return true;
	}

	/**
	 * 预处理语句查询结果并封装到List. 
	 * @param
	 * 	sql语句. 
	 * @param 可变参数. 
	 * @return
	 * 返回List. 
	 * @throws SQLException when the query execution failed.
	 */
	public List<Map<String, String>> queryBy_PreparedStatement(String query,String[] params) throws SQLException {
		ResultSet resultSet = null;
		List<Map<String, String>> result;
		try {
			 System.out.println("querySql: "+query);
			 
			statement = getConn().prepareStatement(query);
			if(params!=null){
			for (int i = 0; i < params.length; i++) {
				statement.setString(i + 1, params[i]);
				System.out.println( " params["+i+"]: "+params[i]);
			 }
			}
			resultSet = statement.executeQuery();
			result = new ArrayList<Map<String, String>>();
			while (resultSet.next()) {
				Map<String, String> rowMap = new HashMap<String, String>();
				for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
					rowMap.put(resultSet.getMetaData().getColumnLabel(i),
					        resultSet.getString(i));
				}
				result.add(rowMap);
			}
		} finally {
			colse();
		}
		return result;
	}

	/**
	 * 结束事务
	 * */
	public void endTransaction() throws Exception {
		if (conn == null) {
			conn = getConn();
		}
		try {
			conn.commit();
			conn.close();
		} catch (Exception e) {
			conn.rollback();

		}
	}

	/**
	 * 开启事务
	 * */
	public void startTransaction() throws SQLException {
		if (conn == null) {
			conn = getConn();
		}
		try {
			conn.setAutoCommit(false);// 设置连接不自动提交，即用该连接进行的操作都不更新到数据库
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 数据库关闭操作
	 * 
	 * 要按照顺序关 rs-->stmt-->conn
	 * */
	public void colse() {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println("关闭结果集对象时出错！");
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				
				System.out.println("关闭语句对象时出错！");
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println("关闭连接对象时出错！");
				e.printStackTrace();
			}
		}
	}
	
	/*
	 * 知识扩展:getColumnLabel(int)返回该int所对应的列的显示标题 getColumnName(int)返回该int所对应的列的在数据库中的名称
	 */

}
