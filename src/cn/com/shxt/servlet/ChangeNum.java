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

public class ChangeNum extends HttpServlet {

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
		String shengyu = request.getParameter("shengyu");// 货物剩余数量
		String loName = request.getParameter("loName");// 购买人 、登录人
		String buynum_ = request.getParameter("buynum_");// 输入框的购买数量
		String goodsName = request.getParameter("goodsName");
		String price = request.getParameter("price");
		String discount = request.getParameter("discount");
	
		
		String findImg = "select IMG from SHOPGOODS where ID='"+goodsId+"' ";
		List<Map<String,String>> imgList = service.query(findImg);
		String img = imgList.get(0).get("IMG");
		
		String userNameIn = "select * from SHOPVIP where USERNAME='" + loName
				+ "'";
		List<Map<String, String>> userInList = service.query(userNameIn);

		String tel = userInList.get(0).get("TEL");//
		String address = userInList.get(0).get("ADDRESS");//
		String carnum_ = userInList.get(0).get("CARNUM"); // 用户的所有购物车商品数量

		int carnum = Integer.parseInt(carnum_);

		carnum = carnum + Integer.parseInt(buynum_);// 用户的所有购物车商品数量

		if (loName == null) {
			loName = (String) request.getSession().getAttribute(
					"userNameqiantai");
		}

		String sql3 = "";
		String sql1 = "select * from SHOPCAR where BUYNAME='" + loName
				+ "' and GOODSID='" + goodsId + "'";
		List<Map<String, String>> carNList = service.query(sql1);

		if (carNList.size() == 0) {
			sql3 = "insert into SHOPCAR "
					+ "(ID,BUYNAME,GOODSNAME,PRICE,NUM,GOODSID,IMG,DISCOUNT)"
					+ "values(shopcarn.nextval,'" + loName + "','" + goodsName
					+ "','" + price + "','" + buynum_ + "','" + goodsId + "','"+img+"','"+discount+"')";

		} else {

			// buynum_ 输入框
			String goodsNu = carNList.get(0).get("NUM");// 购物车中单个商品数量
			int number = Integer.parseInt(goodsNu) + Integer.parseInt(buynum_);

			sql3 = "update SHOPCAR set NUM='" + number + "' where BUYNAME='"
					+ loName + "' and GOODSID='" + goodsId + "'";
		}

		System.out
				.println("goodsId-----" + goodsId + "shengyu______" + shengyu);
		System.out.println("loName-----" + loName + "---carnum---" + carnum);
		System.out
				.println("goodsName-----" + goodsName + "--price----" + price);

		String sql = "update SHOPGOODS set NUM = '" + shengyu
				+ "' where ID = '" + goodsId + "'";
		String sql2 = "update SHOPVIP set CARNUM='" + carnum
				+ "' where USERNAME='" + loName + "'";

		String[] sqls = { sql, sql2, sql3 };
		int[] i = service.changeNum(sqls);
		if (i.length == 3) {
			System.out.println("yes");
		}

		out.print(goodsId);

		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
