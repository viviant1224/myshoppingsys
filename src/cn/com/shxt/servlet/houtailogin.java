package cn.com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.shxt.service.UserService;
import cn.com.shxt.utils.DBUtil;

public class houtailogin extends HttpServlet {

	UserService service = new UserService();
	private static final long serialVersionUID = -307582570694275726L;

	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String sql = "select * from SHOPMANAGER t where USERNAME = '"+userName+"'";
		List<Map<String,String>> userList = service.query(sql);
		
		System.out.println("username"+userName+"password"+password);
		if(userList.size()>0) {
			if(userList.get(0).get("PASSWORD").equals(password)) {
				request.getSession().setAttribute("userName", userName);
				out.print(1);//登录成功
			} else {
				out.print(2);//密码错误
			}
			
		} else {
			
			out.print(3);//用户名不存在
		}
		out.flush();
		out.close();
	}

}
