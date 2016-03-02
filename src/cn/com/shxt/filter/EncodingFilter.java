package cn.com.shxt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {


	String character=""; 


	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	
		// TODO Auto-generated method stub
		character=filterConfig.getInitParameter("character");

		
	}	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding(character);
		chain.doFilter(request, response);

	}
	
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
