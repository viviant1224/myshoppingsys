package cn.com.shxt.utils;

import java.util.List;
import java.util.Map;

import cn.com.shxt.model.PageBean;
import cn.com.shxt.service.UserService;

/**
 * @说明：分页的工具类
 * @author 王宗超 
 *2013-8-7下午2:50:26
 * version 1.0
 */
public class PageUtilliuyan {
	
	UserService service=new UserService();
	
	/**
	 * @param tableName
	 * @param nowPage
	 * @param iRows
	 * @return
	 */
	public PageBean queryByPage(String tableName,int nowPage,int iRows,String state){
		/**
		 * 分页所需参数
		 */
		int rows=0;    //总记录数
		int pages;   //总页数
		if(nowPage<=0){
			nowPage=1;
		}
	   
		//查询总记录数
		String  countSql=" select count(*) totalNum from "+tableName+" where STATE='"+state+"'" ;
		DBUtil dbUtil=new DBUtil();
		List<Map<String, String>> totalNumList=dbUtil.queryByList(countSql);
		if(totalNumList!=null&&totalNumList.size()>0){
			//获取得到总记录数
			rows=Integer.parseInt( totalNumList.get(0).get("TOTALNUM") );
		}
		//总页数
		pages=rows%iRows==0?rows/iRows:(rows/iRows+1);
		//创建pageBean对象，对分页数据进行封装
		PageBean pageBean=new PageBean();
		pageBean.setNowPage(nowPage);
		pageBean.setiRows(iRows);
		pageBean.setPages(pages);
		pageBean.setRows(rows);
		 String sqlString=" select a.* from( select rownum rowno,t.* from (select * from SHOPLIUYAN t  order by    LIUYANDATE  desc) t where rownum<="+iRows*nowPage+"" +
		 		" order by LIUYANDATE desc )a where a.rowno>="+((nowPage-1)*iRows+1);
		 System.out.println("执行分页的sql: "+sqlString);
		 List<Map<String, String>> userList=service.query(sqlString);
		 
		 pageBean.setResList(userList);
		return pageBean;
	}
	 
	 
}
