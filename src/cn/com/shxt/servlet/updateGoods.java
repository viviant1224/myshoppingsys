package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.utils.DBUtil;

public class updateGoods extends HttpServlet {

	
	private static final long serialVersionUID = -2381815780039055410L;

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

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		DBUtil db = new DBUtil();
		String sql = "select t.*, t.rowid from PROVINCE t";
		List<Map<String,String>> provinceList = db.queryByList(sql);
		request.setAttribute("provinceList",provinceList );
		request.getRequestDispatcher("/admin/goodsUpdate.jsp?provinceList="+provinceList).forward(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
