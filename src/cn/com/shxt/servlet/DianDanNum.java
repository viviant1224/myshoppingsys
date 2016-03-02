package cn.com.shxt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.service.GoodsService;

public class DianDanNum extends HttpServlet {
	GoodsService  service=new GoodsService();
	
	private static final long serialVersionUID = 4111816625853350361L;


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
		
		PrintWriter out = response.getWriter();
		String num_ = request.getParameter("num");//改变后的数量
		String goodsId = request.getParameter("goodsId");
		String loName = request.getParameter("loName");
		
		
		
		
		int num = Integer.parseInt(num_);
		
		
		System.out.println("num-------"+num_);
		System.out.println("goodsId-------"+goodsId);
		System.out.println("loName-------"+loName);
	
		String sql1 = "select * from SHOPGOODS t where ID = '"+goodsId+"'";
		String sql2 = "select NUM from SHOPCAR t where BUYNAME='"+loName+"' and GOODSID = '"+goodsId+"'"; //吧NUM设为num
		String sql3 = "select CARNUM from SHOPVIP t where USERNAME = '"+loName+"'";
		
		
		String updateGoods = "";
		String updateCar = "";
		String updateVip = "";
		
		List<Map<String,String>> goodsList = service.query(sql1);
		String goodsNum_ = goodsList.get(0).get("NUM");
		int goodsNum1 = Integer.parseInt(goodsNum_);
		int goodsNum = goodsNum1-num;//最后数量
		System.out.println("goodsNum-------"+goodsNum);
		
		String goodsName = goodsList.get(0).get("GOODSNAME");
		String price = goodsList.get(0).get("PRICE");
		String img = goodsList.get(0).get("IMG");
		String discount = goodsList.get(0).get("DISCOUNT");
		if(discount==null) {
			discount="无";
		}
		
			
			updateGoods = "update  SHOPGOODS set NUM='"+goodsNum+"' where ID = '"+goodsId+"'";
		
		
		
		
		List<Map<String,String>> carList = service.query(sql2);
		if(carList!=null) {
			String carNum_ = carList.get(0).get("NUM");
			int carNum = Integer.parseInt(carNum_);
			int carNum1 = carNum+num;//最后数量
			System.out.println("carNum1-------"+carNum1);
			if(carNum1==0) {
				
				updateCar = "delete from SHOPCAR where BUYNAME='"+loName+"' and GOODSID = '"+goodsId+"'";
			} else {
				
				updateCar = "update  SHOPCAR set NUM='"+carNum1+"'where BUYNAME='"+loName+"' and GOODSID = '"+goodsId+"'";
			}
		} 
		
		
		List<Map<String,String>> vipList = service.query(sql3);
		String vipNum_ = vipList.get(0).get("CARNUM");
		int vipNum = Integer.parseInt(vipNum_);
		int vipNum1 = vipNum+num;//最后数量
		System.out.println("vipNum1-------"+vipNum1);
		
			
			updateVip = "update  SHOPVIP set CARNUM='"+vipNum1+"'where USERNAME='"+loName+"'";
		
		String[] arrUpdate = new String[]{updateGoods,updateCar,updateVip};
		int[] i = service.changeNum(arrUpdate);
		if(i.length!=3) {
			System.out.println("失败");
		} else {
			System.out.println("成功");
			request.getSession().setAttribute("loName", loName);
			request.getRequestDispatcher("goodsServlet?flag=gouwu").forward(request, response);
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
