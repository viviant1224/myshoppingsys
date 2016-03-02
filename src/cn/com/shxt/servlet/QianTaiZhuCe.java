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

public class QianTaiZhuCe extends HttpServlet {

	UserService service = new UserService();
	private static final long serialVersionUID = -4600225437770131132L;

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
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

		//解决post提交方式中传递中文乱码的问题
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				
				String userName = request.getParameter("userName");
				String validateCode = request.getParameter("validateCode");
				
				HttpSession session = request.getSession();
				String validateCode_ = (String)session.getAttribute("validateCode");
				System.out.println("validateCode"+validateCode+"validateCode_"+validateCode_);
				
				
				
				
				System.out.println("----userName"+userName);
				 //接收ajax传递过来的参数
				DBUtil db = new DBUtil();
				String sql = "select * from SHOPVIP t where USERNAME = '"+userName+"'";
				

			
				System.out.println("-"+sql);
				 List<Map<String, String>> userList=service.query(sql);
				 System.out.println("-"+userList.size());
				 
				 if(validateCode!=null) {
					 
					 
						if(userList.size()>0&&validateCode.equals(validateCode_)) {
							System.out.println("ssss");
							out.print(3);
						} else if(userList.size()==0&&validateCode.equals(validateCode_)){
							System.out.println("ssss");
							out.println(1);
						} else if(userList.size()==0&&!validateCode.equals(validateCode_)) {
							
							out.print(2);
						} else if(userList.size()>0&&!validateCode.equals(validateCode_)) {
							out.println(4);
						}
					 
				 } else {
					 
					 
					 if(userList.size()>0) {
							System.out.println("ssss");
							out.print(3);
						} else if(userList.size()==0){
							System.out.println("ssss");
							out.println(1);
						}
					 
				 }
				
				 
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
