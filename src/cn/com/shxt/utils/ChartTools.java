package cn.com.shxt.utils;

import java.util.LinkedList;
import java.util.Map;

public class ChartTools {
 
	DBUtil dbUtil=new DBUtil();

	/**
	 * 获取规划师信息
	 * */
	 public LinkedList<Map<String, Object>> load() {
	//public LinkedList<Map<String, Object>> load(String begindate,String endDate) {
		LinkedList<Map<String, Object>> rsList = null;
		try {
			rsList = new LinkedList<Map<String, Object>>();
			//String sqlList = "SELECT COUNT(NUM) AS CNT,NUM FROM CHARTTABLE GROUP BY NUM ORDER BY NUM";
			String sql=" select GOODSNAME,SUM(GOODSCODENU) from SHOPDINDAN where STATE='已完成' group by GOODSNAME ";
			 
			rsList=dbUtil.queryByLinkedList(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rsList;
	}
	 
	 
	 public LinkedList<Map<String, Object>> loadlirun() {
			//public LinkedList<Map<String, Object>> load(String begindate,String endDate) {
				LinkedList<Map<String, Object>> rsList = null;
				try {
					rsList = new LinkedList<Map<String, Object>>();
					//String sqlList = "SELECT COUNT(NUM) AS CNT,NUM FROM CHARTTABLE GROUP BY NUM ORDER BY NUM";
					String sql="select GOODSCODE,SUM(GOODSCODENU) from SHOPDINDAN t where STATE='已完成' group by GOODSCODE order by SUM(GOODSCODENU)";
					 
					rsList=dbUtil.queryByLinkedList(sql);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return rsList;
			}

	public static void main(String[] args) {
		ChartTools ct = new ChartTools();
     

	}

}
