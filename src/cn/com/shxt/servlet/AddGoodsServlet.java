package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.model.GoodsInfo;
import cn.com.shxt.service.GoodsService;
import cn.com.shxt.utils.FileUploadUtil;

public class AddGoodsServlet extends HttpServlet {

	GoodsService  service=new GoodsService();
	private static final long serialVersionUID = -874307926633662721L;

	
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
		
		
		Map<String, String>  formMap=FileUploadUtil.fileUpload(request, response);
		
		String goodsName=formMap.get("goodsName");
		String discount=formMap.get("discount");
		String pinpai=formMap.get("pinpai");
		String category=formMap.get("category");
		String childcate=formMap.get("childId");
 		String update_=formMap.get("update_");
		String color=formMap.get("color");
		String firstPrice=formMap.get("firstPrice");
		
		
		String provinceId=formMap.get("provinceId");
		String cityId=formMap.get("cityId");
		String areaId=formMap.get("areaId");
		if(cityId==null) {
			cityId="1";
			
		}
		if(areaId==null) {
			areaId="1";
		}
		
		
		String guige=formMap.get("guige");
		String price=formMap.get("price");
		String num=formMap.get("num");
		String img=formMap.get("img");
		String info=formMap.get("info");
		
		
		String province = service.getProvince(provinceId);
		String city = service.getCity(cityId);

		System.out.println("--city--"+city);
		String area = service.getArea(areaId);
	
		System.out.println("--area--"+area);
		String proArea = ""+province+city+area;
		System.out.println("proArea------"+proArea);
		
		GoodsInfo goodsInfo=new GoodsInfo();
		goodsInfo.setGoodsName(goodsName);
		goodsInfo.setDiscount(discount);
		goodsInfo.setPinpai(pinpai);
		goodsInfo.setCategory(category);
		goodsInfo.setUpdate_(update_);
		goodsInfo.setColor(color);
		goodsInfo.setFirstPrice(firstPrice);
		goodsInfo.setProvinceId(provinceId);
		goodsInfo.setCityId(cityId);
		goodsInfo.setAreaId(areaId);
		goodsInfo.setGuige(guige);
		goodsInfo.setPrice(price);
		goodsInfo.setNum(num);
		goodsInfo.setImg(img);
		goodsInfo.setInfo(info);
		goodsInfo.setProArea(proArea);
		goodsInfo.setChildcate(childcate);
	
		System.out.println("goodsName: "+goodsName+"  update_:"+update_+"  img"+img);
		
		boolean  isSuccess=service.addGoods(goodsInfo);
		if(isSuccess){
			//response.sendRedirect("/jx06fileUpload/Success.jsp");
			request.setAttribute("goodsInfo", goodsInfo);
			System.out.println("成功");
			request.getRequestDispatcher("/admin/zhubankuai.jsp").forward(request, response);
			
		}else{
			System.out.println("失败");
			response.sendRedirect("/myshoppingsys/admin/zhubankuai.jsp");
		}
		 
	
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
