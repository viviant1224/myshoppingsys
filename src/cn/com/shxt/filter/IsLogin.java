package cn.com.shxt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IsLogin implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//获取request 和response 
				HttpServletResponse resp =	(HttpServletResponse)response;
				HttpServletRequest req = (HttpServletRequest)request;
				
				
				
				String urlPath=req.getServletPath();
				System.out.println("IsLoginFilter    urlPath:  "+urlPath);
				
				
				HttpSession sess = req.getSession();
				
				String userName = (String)sess.getAttribute("userName");
				if(urlPath!=null) {
					if(urlPath.endsWith("findpwmessage.jsp")||urlPath.endsWith("findfrommibao.jsp")||urlPath.endsWith("login.jsp")||urlPath.startsWith("/admin/img")||urlPath.startsWith("/admin/images")||urlPath.startsWith("/admin/style")){
						
						chain.doFilter(request, response);
					}
					else if(userName!=null) {
						chain.doFilter(request, response);
					} else {
						sess.setAttribute("info", "抱歉，您没有该权限，请登录后操作");
						
					resp.sendRedirect("../message.jsp");
					//	resp.sendRedirect("login.jsp");
					}
					
				}  else {
					sess.setAttribute("info", "抱歉，您没有该权限，请登录后操作");
					
						resp.sendRedirect("../message.jsp");
					//	resp.sendRedirect("login.jsp");
				}

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
