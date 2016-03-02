package cn.com.shxt.model;

import java.util.List;
import java.util.Map;

/**
 * @说明：分页实体类
 * @author 王宗超
 *2013-8-6下午4:09:32
 * version 1.0
 */
public class PageBean {
	
	int rows=0;    //总记录数
	int pages;   //总页数
	int nowPage=1;//当前页
	int iRows=5; //每页显示记录数
	 List<Map<String, String>> resList;//查询结果集
    private  String  baseSql;
	 
	public String getBaseSql() {
		return baseSql;
	}
	public void setBaseSql(String baseSql) {
		this.baseSql = baseSql;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getiRows() {
		return iRows;
	}
	public void setiRows(int iRows) {
		this.iRows = iRows;
	}
	public List<Map<String, String>> getResList() {
		return resList;
	}
	public void setResList(List<Map<String, String>> resList) {
		this.resList = resList;
	}
	  

}
