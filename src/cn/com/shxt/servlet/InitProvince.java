package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.utils.DBUtil;

public class InitProvince extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String flag = request.getParameter("flag");
		
		if(flag==null) {
			flag="houtai";
		}
		System.out.println("flag="+flag);
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		DBUtil db = new DBUtil();
		String sql = "select t.*, t.rowid from PROVINCE t";
		List<Map<String,String>> provinceList = db.queryByList(sql);
		request.setAttribute("provinceList",provinceList );
		 if(flag.equals("null")||flag==null||flag.equals("houtai")) {
			
			request.getRequestDispatcher("/admin/addgoods.jsp?provinceList="+provinceList).forward(request, response);
		}else if(flag.equals("jiesuan")) {
			
			request.getRequestDispatcher("/web/verify_order.jsp?provinceList="+provinceList).forward(request, response);
		}  else if(flag.equals("buynow")) {
			request.getRequestDispatcher("/web/buynow.jsp?provinceList="+provinceList).forward(request, response);
		} 
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
