package cn.com.shxt.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.model.PageBean;

public class PageTiaojian {
	public List<Map<String,String>> pageTiaojian(HttpServletRequest request, HttpServletResponse response,String baseSql) {
		/**
		 * 分页所需参数
		 */
		int rows=0;    //总记录数
		int pages;   //总页数
		int nowPage=1;//当前页
		int iRows=6; //每页显示记录数
		
		//接收传递过来的页数
		String  newPage=request.getParameter("nextPage");
		System.out.println("newPage:  "+newPage);
		if(newPage!=null&&!"".equals(newPage)){
			nowPage=Integer.parseInt(newPage);
		}
		
		
		//查询总记录数
		String  countSql=" select count(*) totalNum from ("+baseSql+")";
		DBUtil dbUtil=new DBUtil();
		DbUtils du = new DbUtils();
		
		
		List<Map<String, Object>> totalNumList=du.query(countSql);
		System.out.println("num=====num"+totalNumList.size());
		
		
		if(totalNumList!=null&&totalNumList.size()>0){
			//获取得到总记录数
			
			rows = Integer.parseInt(totalNumList.get(0).get("TOTALNUM").toString());
			
		}
		
		//总页数
		pages=rows%iRows==0?rows/iRows:(rows/iRows+1);
		System.out.println("pages"+pages);
		
		
		//创建pageBean对象，对分页数据进行封装
		PageBean pageBean = new PageBean();
		pageBean.setBaseSql(baseSql);
		
		
		
		pageBean.setNowPage(nowPage);
		pageBean.setiRows(iRows);
		pageBean.setPages(pages);
		pageBean.setRows(rows);
		
		System.out.println("pageBean.getBaseSql:  "+pageBean.getBaseSql());
		 
		
		
		String sqlString=" select A.* from (  select ROWNUM ROWNO,t.* from ("+baseSql+") t where ROWNUM<="+iRows*nowPage+"  )A  where a.ROWNO >="+((nowPage-1)*iRows+1);
		 System.out.println("执行分页的sql: "+sqlString);
		 
		 
		
		 List<Map<String, String>> goodsList = (List<Map<String, String>>) dbUtil.queryByList(sqlString);
		 return goodsList;
	}

}
