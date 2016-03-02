package cn.com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.utils.DBUtil;



public class findchildServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1317247394042459100L;

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/xml;charset=UTF-8");
		//response.setContentType("text/html;charset=UTF-8");
		String categoryName = request.getParameter("categoryName");
	
		PrintWriter out = response.getWriter();
		//根据指定的id得到所属的city
		String sql="  select * from CHILDCATE  where FATHER='"+categoryName+"'";
		DBUtil dbUtil=new DBUtil();
		List<Map<String, String>>  childList=dbUtil.queryByList(sql);
		 
	   out.print("<child>");
		   for (int i = 0; i < childList.size(); i++) {
			String childName =childList.get(i).get("CHILD");
			System.out.println("---"+childName);
			out.print("<name>"+childName+"</name>");
		}
		out.print("</child>");
		
		out.flush();
		out.close();
		
		
		
		
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
