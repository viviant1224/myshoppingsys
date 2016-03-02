package cn.com.shxt.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.shxt.model.GoodsInfo;
import cn.com.shxt.service.GoodsService;
import cn.com.shxt.service.UserService;
import cn.com.shxt.utils.FileUploadUtil;

public class updateGoodsServlet extends HttpServlet {
	GoodsService  service=new GoodsService();

	private static final long serialVersionUID = -57930320183683340L;

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

		response.setContentType("text/html;charset=UTF-8");
		goodsUpdateExec(request,response);
		
	}
	public void goodsUpdateExec(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, String>  formMap=FileUploadUtil.fileUpload(request, response);

				String goodsid=formMap.get("goodsId");
				String goodsName=formMap.get("goodsName");
				String discount=formMap.get("discount");
				String pinpai=formMap.get("pinpai");
				String category=formMap.get("category");
				String update_=formMap.get("update_");
				String color=formMap.get("color");
				String firstPrice=formMap.get("firstPrice");
				String provinceId=formMap.get("provinceId");
				String cityId=formMap.get("cityId");
				String areaId=formMap.get("areaId");
				String guige=formMap.get("guige");
				String price=formMap.get("price");
				String num=formMap.get("num");
				String img=formMap.get("img");
				String info=formMap.get("info");
				
				
				String province = service.getProvince(provinceId);
				String city = service.getCity(cityId);
				String area = service.getArea(areaId);
				String proArea = ""+province+city+area;
				
				GoodsInfo goodsInfo=new GoodsInfo();
				
				
				goodsInfo.setGoodsId(goodsid);
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
			
				System.out.println("goodsid:"+goodsid+"goodsName: "+goodsName+"  update_:"+update_+"  img"+img);
				
				boolean res=service.updateGoods(goodsInfo, goodsid);
				
				if(res){
					request.setAttribute("message","恭喜，用户信息更改成功!");
				}else{
					request.setAttribute("message","Sorry，用户信息更改失败!");
				}
				try {
					request.getRequestDispatcher("/admin/commonMessage.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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
