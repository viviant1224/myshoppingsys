package cn.com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.service.GoodsService;

public class isChat extends HttpServlet {

	GoodsService service = new GoodsService();
	private static final long serialVersionUID = -5800090034967166179L;

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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String goodsId = request.getParameter("goodsId");// 货物ID

		String loName = request.getParameter("loName");// 购买人 、登录人
		String  sql = "select * from SHOPDINDAN where BUYNAME='"+loName+"' and STATE='已完成' " +
				" and GOODSCODE='"+goodsId+"'";
		List<Map<String,String>> dindanList = service.query(sql);
		if(dindanList==null||dindanList.size()==0) {
			System.out.println("1");
			out.print("1");
		} else {
			System.out.println("2");
			out.print("2");
		}
	
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
