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

import com.google.gson.Gson;

public class findareaServlet extends HttpServlet {

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
		
		String cityId=request.getParameter("cityId");
		System.out.println("cityId:"+cityId);
		PrintWriter out = response.getWriter();
		//根据指定的id得到所属的city
		String sql="  select * from area  where fatherid="+Integer.parseInt(cityId);
		DBUtil dbUtil=new DBUtil();
		List<Map<String, String>>  areaList=dbUtil.queryByList(sql);
		 
	   out.print("<area>");
		   for (int i = 0; i < areaList.size(); i++) {
			String areaId=areaList.get(i).get("AREAID");
			String area=areaList.get(i).get("AREA");
			System.out.println(area+"------"+areaId);
			out.print("<id>"+areaId+"</id>");
			out.print("<name>"+area+"</name>");
		}
		out.print("</area>");
		
		 
		//将List转成JSON格式的字符串
		/*Gson gson=new Gson();
		String  jsonString=gson.toJson(cityList);
		this.log("city:"+jsonString);
		out.print(jsonString);*/
		out.flush();
		out.close();
		
		
		
		
		
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
