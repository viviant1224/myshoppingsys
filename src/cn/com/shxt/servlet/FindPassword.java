package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.service.UserService;
import cn.com.shxt.test.FaSong;

public class FindPassword extends HttpServlet {
	UserService service = new UserService();

	private static final long serialVersionUID = 1L;

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
		request.setCharacterEncoding("UTF-8");
		String findpw = "";
		String userName = request.getParameter("userName");
		ServletContext application=this.getServletContext();
		application.setAttribute("userNamepw", userName);
		System.out.println("userName="+userName);
		String sql = "select EMAIL from shopvip where USERNAME='"+userName+"'";
		List<Map<String,String>> userList = service.query(sql);
		String email = userList.get(0).get("EMAIL");
		findpw = request.getParameter("findpw");
		
		System.out.println(findpw);
		if(findpw.equals("1.通过邮件重新改密（推荐）")) {
			FaSong fs = new FaSong();
			fs.fasong(email,userName);
			String info="邮件已发送成功，请您尽快登录自己的邮箱修改信息。";
			request.getSession().setAttribute("info", info);
			request.getRequestDispatcher("message.jsp").forward(request, response);
			
		} else if(findpw.equals("2.通过密保问题找回")){
			System.out.println("2");
		} else {
			System.out.println("3");
		}
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
