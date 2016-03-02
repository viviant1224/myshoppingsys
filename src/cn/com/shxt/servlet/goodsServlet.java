package cn.com.shxt.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.shxt.model.GoodsInfo;
import cn.com.shxt.model.PageBean;
import cn.com.shxt.service.GoodsService;
import cn.com.shxt.utils.DBUtil;
import cn.com.shxt.utils.DbUtils;
import cn.com.shxt.utils.PageUtil;
import cn.com.shxt.utils.PageUtilchat;
import cn.com.shxt.utils.PageUtilliuyan;
import cn.com.shxt.utils.PageZhangdan;

public class goodsServlet extends HttpServlet {

	GoodsService service = new GoodsService();
	private static final long serialVersionUID = -155509937965703725L;

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
		String flag = request.getParameter("flag");

		System.out.println("flag:-------" + flag);
		if (flag != null) {
			if (flag.equals("goodsSearch")) {
				goodsSearch(request, response);
			} else if (flag.equals("goodsSearchTiJiao")) {
				goodsSearchTiaoJian(request, response);
			} else if (flag.equals("goodsUpdate")) {
				goodsUpdate(request, response);
			} else if (flag.equals("goodsShow")) {
				goodsShow(request, response);
			} else if (flag.equals("single")) {
				singleGoods(request, response);
			} else if (flag.equals("gouwu")) {
				gouwu(request, response);
			} else if (flag.equals("clear")) {
				clear(request, response);
			} else if (flag.equals("delOne")) {
				delOne(request, response);
			} else if (flag.equals("tijiaodindan")) {
				tijiaodindan(request, response);
			} else if (flag.equals("logout")) {
				logout(request, response);
			} else if (flag.equals("shangjia")) {
				shangjia(request, response);
			} else if (flag.equals("delBatch")) {
				delBatch(request, response);
			} else if (flag.equals("showMore")) {
				showMore(request, response);
			} else if (flag.equals("xiajiaByBatch")) {
				xiajiaByBatch(request, response);
			} else if (flag.equals("xiaoshouSerarch")) {
				xiaoshouSerarch(request, response);
			} else if (flag.equals("dindanQuerytiaojian")) {
				dindanQuerytiaojian(request, response);
			} else if (flag.equals("userInfozhangdan")) {
				userInfozhangdan(request, response);
			} else if (flag.equals("childCateSearch")) {
				search(request, response);
			} else if (flag.equals("cateSearch")) {
				search(request, response);
			} else if (flag.equals("search")) {
				search(request, response);
			} else if(flag.equals("searchOne")) {
				searchOne(request, response);
			}else if (flag.equals("jiage")) {
				search(request, response);
			} else if (flag.equals("tuihuo")) {
				tuihuo(request, response);
			} else if (flag.equals("quxiaodindan")) {
				quxiaodindan(request, response);
			} else if(flag.equals("fukuan")) {
				fukuan(request, response);
			} else if(flag.equals("userInfozhangdan_")) {
				userInfozhangdan_(request, response);
			} else if(flag.equals("buynow")) {
				buynow(request, response);
			} else if(flag.equals("tijiaodindanbuynow")) {
				tijiaodindanbuynow(request, response);
			} else if(flag.equals("addGoodsNum")) {
				addGoodsNum(request, response);
			} else if(flag.equals("houtaituihuoSearch")) {
				houtaituihuoSearch(request, response);
			} else if(flag.equals("zhixingtuihuo")) {
				zhixingtuihuo(request, response);
			} else if(flag.equals("quxiaotuihuo")) {
				quxiaotuihuo(request, response);
			} else if(flag.equals("huifu")) {
				huifu(request, response);
			} else if(flag.equals("pinglun")) {
				pinglun(request, response);
			} else if(flag.equals("liuyan")) {
				liuyan(request, response);
			} else if (flag.equals("duifangshouhuo")) {
				duifangshouhuo(request, response);
			} else if(flag.equals("biaojiyidu")) {
				biaojiyidu(request, response);
			} else if(flag.equals("deletexiaoxi")) {
				deletexiaoxi(request, response);
			} else if(flag.equals("delxiaoxiBatch")) {
				delxiaoxiBatch(request, response);
			} else if(flag.equals("biaojiBatch")) {
				biaojiBatch(request, response);
			} else if(flag.equals("houtailiuyan")) {
				houtailiuyan(request, response);
			} 
		} else {
			search(request, response);
		}

	}
	
	//后台留言查询
			public void houtailiuyan(HttpServletRequest request,
						HttpServletResponse response) {

				int nowPage = 1;// 当前页
				int iRows = 5; // 每页显示记录数
				
				// 接收传递过来的页数
				String newPage = request.getParameter("nextPage");
				System.out.println("newPage:  " + newPage);
				if (newPage != null && !"".equals(newPage)) {
					nowPage = Integer.parseInt(newPage);
				}
				String goodsId="";
				System.out.println("ss");
				
				PageUtilliuyan pageUtil = new PageUtilliuyan();
				PageBean pageBean12 = pageUtil.queryByPage("SHOPLIUYAN", nowPage, iRows,"正常");
				
				request.setAttribute("pageBean12", pageBean12);
				try {
					request.getRequestDispatcher("/admin/zhubankuai.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	//批量标记消息
		public void biaojiBatch(HttpServletRequest request,
					HttpServletResponse response) {



			String xiaoxiids = request.getParameter("xiaoxiidsArray");
			String[] ids = xiaoxiids.split(",");
			String sqls[] = new String[ids.length];
			System.out.println("-----" + ids.length);
			for (int i = 0; i < ids.length; i++) {
				String id = ids[i];
				System.out.println(id);
				String delSql = "update SHOPGERENXIAOXI set STATE2='已读' where ID = '"+id+"'";
				sqls[i] = delSql;
			}
			int[] i = service.changeNum(sqls);
			if (i.length != 0) {
				try {
					response.sendRedirect("/myshoppingsys/web/gerenxiaoxi.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		
		
				
			}
	//批量删除消息
		public void delxiaoxiBatch(HttpServletRequest request,
				HttpServletResponse response) {


			String xiaoxiids = request.getParameter("xiaoxiidsArray");
			String[] ids = xiaoxiids.split(",");
			String sqls[] = new String[ids.length];
			System.out.println("-----" + ids.length);
			for (int i = 0; i < ids.length; i++) {
				String id = ids[i];
				System.out.println(id);
				String delSql = " delete SHOPGERENXIAOXI where ID='"+id+"'";
				sqls[i] = delSql;
			}
			int[] i = service.changeNum(sqls);
			if (i.length != 0) {
				try {
					response.sendRedirect("/myshoppingsys/web/gerenxiaoxi.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		
		}
	//删除消息
	public void deletexiaoxi(HttpServletRequest request,
			HttpServletResponse response) {

		String xiaoxiid = "";
		try {
			xiaoxiid = new String(request.getParameter("xiaoxiid").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		String sql = "delete shopgerenxiaoxi " +
				"where ID='"+xiaoxiid+"'";
		int i = service.updateGoodsCar(sql);
		if(i!=0) {
			try {
				response.sendRedirect("/myshoppingsys/web/gerenxiaoxi.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
                                  
		
	
	}
	//标记已读
	public void biaojiyidu(HttpServletRequest request,
			HttpServletResponse response) {
		String xiaoxiid = "";
		try {
			xiaoxiid = new String(request.getParameter("xiaoxiid").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		String time=request.getParameter("time");
		String sql = "update shopgerenxiaoxi set STATE2='已读'" +
				"where  ID='"+xiaoxiid+"'";
		int i = service.updateGoodsCar(sql);
		if(i!=0) {
			try {
				response.sendRedirect("/myshoppingsys/web/gerenxiaoxi.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
                                  
		
	}
	//货到付款对方收到货物
		public void duifangshouhuo(HttpServletRequest request,
				HttpServletResponse response) {
			String buyname = "";
			try {
				buyname = new String(request.getParameter("buyname").getBytes(
						"iso-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String goodsId = request.getParameter("goodsId");
			String buydate = request.getParameter("buydate");
			System.out.println("goodsId---------"+goodsId);
			System.out.println("buydate---------"+buydate);
			System.out.println("buyname---------"+buyname);
			String sql = "update SHOPDINDAN set STATE='已完成',ZHIFU='在线' where BUYNAME='"+buyname+"' and GOODSCODE='"+goodsId+"' and BUYDATE='"+buydate+"'";
			int i = service.updateGoodsCar(sql);
			if(i!=0) {
				xiaoshouSerarch(request, response);
			}
			
		}
		//留言
		//评论
		public void liuyan(HttpServletRequest request,
				HttpServletResponse response) {

			
			try{
			String buyname = request.getParameter("buyname");
			String goodsId = request.getParameter("goodsId");
			String goodsName = request.getParameter("goodsName");
			String neirong = request.getParameter("content1");
			String pinglunname= request.getParameter("PINGLUNNAME");
			System.out.println("buyname-------"+buyname);
			System.out.println("goodsId-------"+goodsId);
			System.out.println("goodsName-------"+goodsName);
			System.out.println("neirong-------"+neirong);
			
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(d);
			String sql = "insert into SHOPLIUYAN(ID,BUYNAME,LIUYANDATE,NEIRONG,STATE)" +
					"values(autoid.nextval,'"+buyname+"','"+time+"','"+neirong+"','正常')";
			
			
			int i = service.updateGoodsCar(sql);
			if(i!=0) {
				response.sendRedirect("/myshoppingsys/goodsServlet?flag=single&goodsId="+goodsId);
			}	
			
			} catch(Exception e) {
			try {
				response.sendRedirect("/myshoppingsys/web/zhangdan.jsp");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		
		
	
		
		
		
			
		}
		//评论
		public void pinglun(HttpServletRequest request,
			HttpServletResponse response) {
			
			try{
			String buyname = request.getParameter("buyname");
			String goodsId = request.getParameter("goodsId");
			String goodsName = request.getParameter("goodsName");
			String neirong = request.getParameter("content1");
			String jibie = request.getParameter("jibie");
			
			System.out.println("buyname-------"+buyname);
			System.out.println("goodsId-------"+goodsId);
			System.out.println("goodsName-------"+goodsName);
			System.out.println("neirong-------"+neirong);
			System.out.println("jibie-------"+jibie);
			
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(d);
			String sql = "insert into SHOPCHAT(ID,GOODSCODE,GOODSNAME,BUYNAME,DATE_,NEIRONG,STATE,jibie,pinglunname)" +
					"values(autoid.nextval,'"+goodsId+"','"+goodsName+"','"+buyname+"','"+time+"','"+neirong+"','正常','"+jibie+"','"+buyname+"')";
			
			
			int i = service.updateGoodsCar(sql);
			if(i!=0) {
				response.sendRedirect("/myshoppingsys/goodsServlet?flag=single&goodsId="+goodsId);
			}	
			
			} catch(Exception e) {
			try {
				response.sendRedirect("/myshoppingsys/web/zhangdan.jsp");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			}
		
		
	
		
		
		}
	public void huifu(HttpServletRequest request,
			HttpServletResponse response) {
		String goodsId = request.getParameter("goodsId");

		System.out.println("goodsId----"+goodsId);
		String buyname = "";
		try {
			buyname = new String(request.getParameter("buyname").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String username = "";
		try {
			username = new String(request.getParameter("username").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		System.out.println("time----"+time);
		
		String liuyan = "";
		try {
			liuyan = new String(request.getParameter("liuyan").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String goodsName = "";
		try {
			goodsName = new String(request.getParameter("goodsName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("");
		String name = username+"回复"+buyname;
		String huifusql = "insert into SHOPCHAT(ID,GOODSCODE,GOODSNAME,BUYNAME,DATE_,NEIRONG,STATE)" +
				"values(autoid.nextval,'"+goodsId+"','"+goodsName+"','"+name+"','"+time+"','"+liuyan+"','正常')";
		int i = service.updateGoodsCar(huifusql);
		if(i!=0) {
			singleGoods(request, response);
		}
	}
	//取消退货
	public void quxiaotuihuo(HttpServletRequest request,
			HttpServletResponse response) {
		

		String buyname = "";
		try {
			buyname = new String(request.getParameter("buyname").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String buydate=request.getParameter("buydate");
		String buynum=request.getParameter("buynum");
		String goodsId=request.getParameter("goodsId");
		
		
		System.out.println("buyname----"+buyname);
		System.out.println("buynum----"+buynum);
		System.out.println("goodsId----"+goodsId);
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		
		//处理取消退货：
		
				
				String sql1 = "update SHOPDINDAN set STATE='已完成' where BUYDATE='"+buydate+"' and STATE='待退货' and GOODSCODE = '"
						+ goodsId + "' and BUYNAME='" + buyname + "'";
				String sql3 = "update SHOPGERENXIAOXI set STATE1='退货失败',TIME_='"+time+"' where BUYDATE='"+buydate+"' and BUYNAME='"+buyname+"'" +
						" and GOODSID='"+goodsId+"'";
				String[] sqls = new String[] { sql1,sql3};

				int[] i = service.changeNum(sqls);
				if (i.length ==2 ) {
					try {
						request.getRequestDispatcher("/admin/tuihuoSearch.jsp").forward(request, response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
	
		
	}
	//处理退货：
	public void zhixingtuihuo(HttpServletRequest request,
			HttpServletResponse response) {
		String buyname = "";
		try {
			buyname = new String(request.getParameter("buyname").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String buydate=request.getParameter("buydate");
		String buynum=request.getParameter("buynum");
		String goodsId=request.getParameter("goodsId");
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		
		System.out.println("buyname----"+buyname);
		System.out.println("buynum----"+buynum);
		System.out.println("goodsId----"+goodsId);
		
		//处理退货：
		
				String sql_ = "select NUM from SHOPGOODS where ID='" + goodsId + "'";
				List<Map<String, String>> goodsList_ = service.query(sql_);
				String num2 = goodsList_.get(0).get("NUM");
				int num = Integer.parseInt(buynum) + Integer.parseInt(num2);

				String sql1 = "delete from SHOPDINDAN where BUYDATE='"+buydate+"' and STATE='待退货' and GOODSCODE = '"
						+ goodsId + "' and BUYNAME='" + buyname + "'";
				String sql2 = "update SHOPGOODS set NUM='" + num + "' where ID= '"+ goodsId + "'";
				String sql3 = "update SHOPGERENXIAOXI set STATE1='退货完成',TIME_='"+time+"' where BUYDATE='"+buydate+"' and BUYNAME='"+buyname+"'" +
						" and GOODSID='"+goodsId+"'";
				String[] sqls = new String[] { sql1, sql2 ,sql3};

				int[] i = service.changeNum(sqls);
				if (i.length ==3 ) {
					try {
						request.getRequestDispatcher("/admin/tuihuoSearch.jsp").forward(request, response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
	}
	//后台退货查询
	public void houtaituihuoSearch(HttpServletRequest request,
			HttpServletResponse response) {
		
		
		
		String sqlSearch = "select * from SHOPGERENXIAOXI where STATE1='待退货'";
		List<Map<String,String>> tuihuoList = service.query(sqlSearch);
		request.setAttribute("tuihuoList", tuihuoList);
		try {
			request.getRequestDispatcher("/admin/tuihuoSearch.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void addGoodsNum(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String num = request.getParameter("num");
		String addNum = request.getParameter("addNum");
		int nowNum = Integer.parseInt(addNum)+Integer.parseInt(num);
		String updatenum = "update SHOPGOODS set NUM='"+nowNum+"' where ID='"+id+"'";
		int i = service.updateGoodsCar(updatenum);
		if(i!=0) {
			try {
				request.setAttribute("message", "添加库存成功");
				request.getRequestDispatcher("/admin/commonMessage.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	//立即购买
	public void buynow(HttpServletRequest request,
			HttpServletResponse response) {


		String loName = "";
		loName = (String) request.getSession().getAttribute("userNameqiantai");
		System.out.println("loName----" + loName);

		if (loName == null) {
			try {
				request.getRequestDispatcher("/web/enter.jsp").forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			System.out.println("loName----" + loName);
			String goodsId = request.getParameter("goodsId");
			String buynownum = request.getParameter("num");// 输入框的购买数量
			System.out.println("goodsId======"+goodsId+"-----buynownum---"+buynownum);
			//
			String findgood = "select *from SHOPGOODS where ID = '"+goodsId+"'";
			List<Map<String,String>> goodsList = service.query(findgood);
			String price = goodsList.get(0).get("PRICE");
			String discount = goodsList.get(0).get("DISCOUNT");
			if(discount==null||discount.equals("10")){
				discount="10";
			}
			String goodsName = goodsList.get(0).get("GOODSNAME");
			String img = goodsList.get(0).get("IMG");
	
			//
			
			String sql5= "select *from SHOPNOW where GOODSID = '"+goodsId+"'";
			List<Map<String,String>> buynowList = service.query(sql5);
			System.out.println("--------buynow-------");
			if(buynowList!=null||buynowList.size()!=0) {
				String deleteSql = "delete  SHOPNOW where GOODSID='"+goodsId+"'";
				int isdele = service.updateGoodsCar(deleteSql);
				System.out.println("isdele---------"+isdele);
			}
			
		
			String sql4="insert into SHOPNOW (ID,GOODSID,IMG,GOODSNAME,PRICE,NUM,DISCOUNT)" +
					"values( autoid.nextval,'"+goodsId+"','"+img+"','"+goodsName+"','"+price+"','"+buynownum+"','"+discount+"')";
			
			int i = service.updateGoodsCar(sql4);
		
				List<Map<String,String>> gouwuList = service.query(sql5);
				System.out.println("gouwuList.size---------"+gouwuList.size());
				request.getSession().setAttribute("gouwuList", gouwuList);
				System.out.println("yes");
			
			//
			try {
				request.getRequestDispatcher("InitProvince?flag=buynow").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	
		
		
	}
	//付款
	public void fukuan(HttpServletRequest request,
			HttpServletResponse response) {
		String goodsId = request.getParameter("goodsId");
		String date = request.getParameter("date");
		String loName = "";
		try {
			loName = new String(request.getParameter("loName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println("goodsId--------"+goodsId);
		System.out.println("date--------"+date);
		System.out.println("loName--------"+loName);
		String sql = "update SHOPDINDAN set STATE='已完成' where BUYDATE='"+date+"'and GOODSCODE = '"+goodsId+"' and STATE='已下单' and BUYNAME='"+loName+"'";
		int i = service.updateGoodsCar(sql);
		if(i!=0) {
			
			try {
				response.sendRedirect("/myshoppingsys/web/zhangdan.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// 取消订单
	public void quxiaodindan(HttpServletRequest request,
			HttpServletResponse response) {

		String goodsId = request.getParameter("goodsId");
		String date = request.getParameter("date");
		String loName = "";
		try {
			loName = new String(request.getParameter("loName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String sql = "select GOODSCODENU from SHOPDINDAN where BUYDATE='"+date+"' and STATE='已下单' and GOODSCODE = '"
				+ goodsId + "' and BUYNAME='" + loName + "'";
		String sql_ = "select NUM from SHOPGOODS where ID='" + goodsId + "'";
		List<Map<String, String>> dindanList_ = service.query(sql);
		String num1 = dindanList_.get(0).get("GOODSCODENU");
		System.out.println("------" + num1);
		List<Map<String, String>> goodsList_ = service.query(sql_);
		String num2 = goodsList_.get(0).get("NUM");
		System.out.println("---------" + num2);
		int num = Integer.parseInt(num1) + Integer.parseInt(num2);

		String sql1 = "delete from SHOPDINDAN where STATE='已下单' and GOODSCODE = '"
				+ goodsId + "' and BUYNAME='" + loName + "' and BUYDATE='"+date+"'";
		String sql2 = "update SHOPGOODS set NUM='" + num + "' where ID= '"
				+ goodsId + "'";
		String[] sqls = new String[] { sql1, sql2 };

		int[] i = service.changeNum(sqls);
		if (i.length != 0) {
			try {
				request.getRequestDispatcher("/web/zhangdan.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// 退货
	public void tuihuo(HttpServletRequest request, HttpServletResponse response) {
		
		
		String goodsId = request.getParameter("goodsId");
		String date = request.getParameter("date");
		String num = request.getParameter("num");
		String loName = "";
	
		try {
			loName = new String(request.getParameter("loName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String goodsname = "";
		
		try {
			goodsname = new String(request.getParameter("goodsname").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("goodsId------"+goodsId);
		System.out.println("date------"+date);
		System.out.println("goodsname------"+goodsname);
		System.out.println("num------"+num);
		
		
		String tijiaotuihuo = "insert into SHOPGERENXIAOXI (" +
				"ID, BUYNAME, GOODSNAME, GOODSID, BUYNUM, BUYDATE, TUIHUOLIYOU, STATE1, STATE2,TIME_" +
				")values(autoid.nextval,'"+loName+"','"+goodsname+"','"+goodsId+"'" +
						",'"+num+"','"+date+"','无','待退货','未读','"+date+"')";
		String updindan = "update SHOPDINDAN set STATE='待退货' where BUYNAME='"+loName+"' and" +
				" BUYDATE='"+date+"' and GOODSCODE='"+goodsId+"'";
		String[] upsqls = new String[] { tijiaotuihuo, updindan };
		int [] i = service.changeNum(upsqls);
		if(i.length==2) {
		
			try {
				request.getRequestDispatcher("/web/zhangdan.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	//查找一个商品
	
		public void searchOne(HttpServletRequest request, HttpServletResponse response) {
			String sousuo = "";
			String tiaojian = request.getParameter("tiaojian");
			if (tiaojian != null) {
				try {
					sousuo = new String(tiaojian.getBytes("iso-8859-1"), "UTF-8");
				} catch (UnsupportedEncodingException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

			}
			String shousuo = "select * from SHOPGOODS where CATEGORY like '%" + sousuo
					+ "%' or GOODSNAME like '%" + sousuo + "%' "
					+ "or CATEGORY like '%" + sousuo + "%' or PINPAI like '%"
					+ sousuo + "%' " + "or CHILDCATE like '%" + sousuo + "%'";
			List<Map<String,String>> onegoodsList = service.query(shousuo);
			String id = onegoodsList.get(0).get("ID"); 
			System.out.println("id-"+id);
			try {
				request.getRequestDispatcher("/web/pro_shop.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
	// 换页
	public void search(HttpServletRequest request, HttpServletResponse response) {

		String catefather = "";
		String fathercate = request.getParameter("flag_1");
		if (fathercate != null) {
			try {
				catefather = new String(fathercate.getBytes("iso-8859-1"),
						"UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		// 以价格方式显示
		String xianshi = (String) request.getSession().getAttribute("xianshi");
		if (xianshi == null) {
			String flag3 = request.getParameter("flag3");
			if (flag3 == null) {
				xianshi = "order by ID asc";

			} else if (flag3.equals("jiage")) {
				xianshi = "order by price asc";
				request.getSession().setAttribute("xianshi",
						"order by price asc");
			} 

		}

		String childcate = "";
		String childcate_ = request.getParameter("flag_");
		if (childcate_ != null) {
			try {
				childcate = new String(childcate_.getBytes("iso-8859-1"),
						"UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		String sousuo = "";
		String tiaojian = request.getParameter("tiaojian");
		if (tiaojian != null) {
			try {
				sousuo = new String(tiaojian.getBytes("iso-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		}

		String tableName = "SHOPGOODS";
		String baseSql = "select * from " + tableName + " where STATE='上架'";

		System.out.println("catefather----" + catefather);
		System.out.println("suosou----" + sousuo);

		System.out.println("childcate----" + childcate);

		System.out.println("baseSql----" + baseSql);
		String order = "";
		String conditionSql = request.getParameter("baseSql");
		System.out.println("rrrr-conditionSql--" + conditionSql);

		if (conditionSql != null && !"".equals(conditionSql.trim())
				&& !"null".equals(conditionSql.trim())) {
			System.out.println("baseSql------2-" + baseSql);
			baseSql = conditionSql;
		} else if (sousuo != null && !"".equals(sousuo.trim())) {
			System.out.println("baseSql------1-" + baseSql);
			baseSql = baseSql + " and  (CATEGORY like '%" + sousuo
					+ "%' or GOODSNAME like '%" + sousuo + "%' "
					+ "or CATEGORY like '%" + sousuo + "%' or PINPAI like '%"
					+ sousuo + "%' " + "or CHILDCATE like '%" + sousuo + "%')";
		} else if (childcate != null && !"".equals(childcate.trim())) {
			System.out.println("baseSql------1-" + baseSql);
			baseSql = baseSql + " and  CHILDCATE like '%" + childcate + "%' ";
		} else if (catefather != null && !"".equals(catefather.trim())) {
			System.out.println("baseSql------1-" + baseSql);
			baseSql = baseSql + " and  CATEGORY like '%" + catefather + "%' ";
		}

		/**
		 * 分页所需参数
		 */
		int rows = 0; // 总记录数
		int pages; // 总页数
		int nowPage = 1;// 当前页
		int iRows = 6; // 每页显示记录数

		// 接收传递过来的页数
		String newPage = request.getParameter("nextPage");
		System.out.println("newPage:  " + newPage);
		if (newPage != null && !"".equals(newPage)) {
			nowPage = Integer.parseInt(newPage);
		}

		// 查询总记录数
		String countSql = " select count(*) totalNum from (" + baseSql + ")";
		DBUtil dbUtil = new DBUtil();
		DbUtils du = new DbUtils();

		List<Map<String, Object>> totalNumList = du.query(countSql);
		System.out.println("num=====num" + totalNumList.size());

		if (totalNumList != null && totalNumList.size() > 0) {
			// 获取得到总记录数

			rows = Integer.parseInt(totalNumList.get(0).get("TOTALNUM")
					.toString());

		}

		// 总页数
		pages = rows % iRows == 0 ? rows / iRows : (rows / iRows + 1);
		System.out.println("pages" + pages);

		// 创建pageBean对象，对分页数据进行封装
		PageBean pageBean = new PageBean();
		pageBean.setBaseSql(baseSql);

		pageBean.setNowPage(nowPage);
		pageBean.setiRows(iRows);
		pageBean.setPages(pages);
		pageBean.setRows(rows);

		System.out.println("pageBean.getBaseSql:  " + pageBean.getBaseSql());

		String sqlString = " select A.* from (  select ROWNUM ROWNO,t.* from ("
				+ baseSql + " " + xianshi + ") t where ROWNUM<=" + iRows
				* nowPage + " )A  where a.ROWNO >="
				+ ((nowPage - 1) * iRows + 1);

		System.out.println("执行分页的sql: " + sqlString);

		List<Map<String, String>> goodsList = (List<Map<String, String>>) dbUtil
				.queryByList(sqlString);

		pageBean.setResList(goodsList);

		request.setAttribute("pageBean", pageBean);

		String sqlrexiao = "select * from (select rownum as rn, a.* from ("
				+ "select goodscode,SUM(goodscodenu) from SHOPDINDAN t where STATE='已完成' group by goodscode order by max(goodscodenu) desc) a)"
				+ "where rn between 1 and 1";

		List<Map<String, String>> rexiaoList = service.query(sqlrexiao);

		request.setAttribute("rexiaoList", rexiaoList);

		String sqlrepaihan = "select * from (select rownum as rn, a.* from ("
				+ "select goodscode,SUM(goodscodenu) from SHOPDINDAN t where STATE='已完成' group by goodscode order by max(goodscodenu) desc) a)"
				+ "where rn between 1 and 3";

		List<Map<String, String>> paihanList = service.query(sqlrepaihan);
		System.out.println("paihanList-------" + paihanList.size());
		request.setAttribute("paihanList", paihanList);
		try {
			String flagyemian = request.getParameter("flagyemian");
			if(flagyemian!=null) {
				request.getRequestDispatcher("/web/main.jsp").forward(request,
						response);
			}
			request.getRequestDispatcher("/web/pro_sel.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void userInfozhangdan_(HttpServletRequest request,
			HttpServletResponse response) {
		String loName = (String) request.getSession().getAttribute(
				"userNameqiantai");
		
		
		int nowPage = 1;// 当前页
		int iRows = 8; // 每页显示记录数
		
		// 接收传递过来的页数
		String newPage = request.getParameter("nextPage");
		System.out.println("newPage:  " + newPage);
		if (newPage != null && !"".equals(newPage)) {
			nowPage = Integer.parseInt(newPage);
		}
		
		PageZhangdan pageUtil = new PageZhangdan();
		PageBean pageBeanzhangdan = pageUtil.queryByPage("SHOPDINDAN", nowPage, iRows,loName);
		
		request.setAttribute("pageBeanzhangdan", pageBeanzhangdan);
		
		try {
			request.getRequestDispatcher("/web/zhangdan.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 个人账单
	public void userInfozhangdan(HttpServletRequest request,
			HttpServletResponse response) {
		String loName = (String) request.getSession().getAttribute(
				"userNameqiantai");
		String sql = "select * from SHOPDINDAN where STATE in ('已下单','已完成','待退货') and BUYNAME='"
				+ loName + "'";
		List<Map<String, String>> zhangdanList = service.query(sql);
		request.setAttribute("zhangdanList", zhangdanList);
		try {
			request.getRequestDispatcher("/web/userInfo.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 后台查询客户下单情况
	public void dindanQuerytiaojian(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String dindanCode = request.getParameter("dindanCode");
		String tel = request.getParameter("tel");
		String buydate = request.getParameter("buydate");

		String tableName = "SHOPDINDAN";

		String baseSql = "select * from " + tableName + " where 1=1";

		String conditionSql = request.getParameter("baseSql");
		System.out.println("rrrr-conditionSql--" + conditionSql);

		if (conditionSql != null && !"".equals(conditionSql.trim())
				&& !"null".equals(conditionSql.trim())) {
			System.out.println("baseSql------2-" + baseSql);
			baseSql = conditionSql;
		} else if (userName != null && !"".equals(userName.trim())) {
			System.out.println("baseSql------1-" + baseSql);
			baseSql = baseSql + " and  SHNAME like '%" + userName + "%' ";
		} else if (dindanCode != null && !"".equals(dindanCode.trim())) {
			baseSql = baseSql + " and  DDCODE like '%" + dindanCode + "%' ";
		} else if (tel != null && !"".equals(tel.trim())) {
			System.out.println("baseSql------1-" + baseSql);
			baseSql = baseSql + " and  STEL like '%" + tel + "%' ";
		} else if (buydate != null && !"".equals(buydate.trim())) {
			baseSql = baseSql + " and  BUYDATE like '%" + buydate + "%' ";
		}
		List<Map<String, String>> goodsList1 = service.query(baseSql);
		request.getSession().setAttribute("goodsList1", goodsList1);
		try {
			request.getRequestDispatcher("/admin/inde_right2.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void xiaoshouSerarch(HttpServletRequest request,
			HttpServletResponse response) {
		String sql = "select * from SHOPDINDAN";
		List<Map<String, String>> goodsList1 = service.query(sql);
		request.getSession().setAttribute("goodsList1", goodsList1);
		try {
			request.getRequestDispatcher("/admin/inde_right2.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 商品下架
	public void xiajiaByBatch(HttpServletRequest request,
			HttpServletResponse response) {

		String goodsIds = request.getParameter("goodsIdsArray");
		String[] ids = goodsIds.split(",");
		String sqls[] = new String[ids.length];
		System.out.println("-----" + ids.length);
		for (int i = 0; i < ids.length; i++) {
			String id = ids[i];
			String delSql = "update SHOPGOODS set　STATE='下架' where ID='" + id
					+ "'";
			sqls[i] = delSql;
		}
		int[] i = service.changeNum(sqls);
		if (i.length != 0) {
			goodsSearch(request, response);
		}

	}

	// 显示更多信息
	public void showMore(HttpServletRequest request,
			HttpServletResponse response) {

		String goodsId = request.getParameter("Id");
		String sql = "select * from SHOPGOODS where ID=" + goodsId;

		List<Map<String, String>> goodsList = service.query(sql);
		request.setAttribute("goodsList", goodsList);
		try {
			request.getRequestDispatcher("/admin/showMore.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 删除商品
	public void delBatch(HttpServletRequest request,
			HttpServletResponse response) {
		String goodsIds = request.getParameter("goodsIdsArray");
		String[] ids = goodsIds.split(",");
		String sqls[] = new String[ids.length];
		System.out.println("-----" + ids.length);
		for (int i = 0; i < ids.length; i++) {
			String id = ids[i];
			String delSql = "update SHOPGOODS set　STATE='不可用' where ID='" + id
					+ "'";
			sqls[i] = delSql;
		}
		int[] i = service.changeNum(sqls);
		if (i.length != 0) {
			goodsSearch(request, response);
		}

	}

	// 商品上架
	public void shangjia(HttpServletRequest request,
			HttpServletResponse response) {
		String goodsId = request.getParameter("goodsId");
		String sql = "update SHOPGOODS set STATE='上架' where ID= '" + goodsId
				+ "'";
		int i = service.updateGoodsCar(sql);
		if (i != 0) {
			goodsSearch(request, response);
		}
	}

	// 客户注销
	public void logout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		session.removeAttribute("userNameqiantai");
		session.invalidate();

		System.out.println();
		try {
			response.sendRedirect("/myshoppingsys/web/main.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	// 立即购买的提交订单
	public void tijiaodindanbuynow(HttpServletRequest request,
			HttpServletResponse response) {

		String loName = "";
		try {
			loName = new String(request.getParameter("loName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String shName = request.getParameter("userName");
		String provinceId = request.getParameter("provinceId");
		String cityId = request.getParameter("cityId");
		String areaId = request.getParameter("areaId");
		String address = request.getParameter("address");
		String zipcode = request.getParameter("zipcode");
		String tel = request.getParameter("tel");
		String zhifu = request.getParameter("zhifu");
		if(provinceId==null) {
			provinceId="1";
			
		}
		if(cityId==null) {
			cityId="1";
			
		}
		if(areaId==null) {
			areaId="1";
		}
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		System.out.println("time----"+time);
		

		System.out.println("provinceId------" + provinceId);
		System.out.println("cityId------" + cityId);
		System.out.println("areaId------" + areaId);
		System.out.println("loName------" + loName);
		System.out.println("zhifu---------"+zhifu);

		String province = service.getProvince(provinceId);
		String city = service.getCity(cityId);
		String area = service.getArea(areaId);
		String shAdd = province + city + area + address;
		System.out.println("shAdd------" + shAdd);
		List<Map<String, String>> gouwuList = (List<Map<String, String>>) request
				.getSession().getAttribute("gouwuList");
		
		
		
			String goodsName = gouwuList.get(0).get("GOODSNAME");
			String num = gouwuList.get(0).get("NUM");
			String goodsId = gouwuList.get(0).get("GOODSID");
			String price = gouwuList.get(0).get("PRICE");

			String 	sqlsinto = "insert into SHOPDINDAN (ID,GOODSNAME,PRICE,BUYDATE,"
					+ "STATE,DDCODE,SHADD,SHNAME,STEL,GOODSCODE,GOODSCODENU,ZIPCODE,BUYNAME,ZHIFU)values"
					+ "(autoid.nextval,'"
					+ goodsName
					+ "','"
					+ price
					+ "','"
					+ time
					+ "','未完成',dindancode.nextval,"
					+ "'"
					+ shAdd
					+ "','"
					+ shName
					+ "','"
					+ tel
					+ "','"
					+ goodsId
					+ "',"
					+ "'"
					+ num
					+ "','" + zipcode + "','" + loName + "','"+zhifu+"')";
		
		String searchgoods = "select * from SHOPGOODS where ID='"+goodsId+"'";
		List<Map<String,String>> searchList = service.query(searchgoods);
		String firstnum = searchList.get(0).get("NUM");
		int numnow = Integer.parseInt(firstnum)-Integer.parseInt(num);//改变后的库存数量
		String updateShopgoods  = "update SHOPGOODS set NUM='"+numnow+"' where Id='"+goodsId+"'";
		String[] sqls = new String[]{sqlsinto,updateShopgoods};
		
			
			
		
		
		int i[] = service.changeNum(sqls);
		
		if (i.length == 2) {
			
			
				
				try {
					String sqlDinDan = "select * from SHOPDINDAN where BUYNAME='"
							+ loName + "' and STATE='未完成'";
					List<Map<String, String>> dindanList = service
							.query(sqlDinDan);
					
					response.sendRedirect("/myshoppingsys/web/subm_order.jsp?time="+time);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			
		} else {
			System.out.println("1失败");

		}

	
	}
	// 提交订单
	public void tijiaodindan(HttpServletRequest request,
			HttpServletResponse response) {
		String loName = "";
		try {
			loName = new String(request.getParameter("loName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String shName = request.getParameter("userName");
		String provinceId = request.getParameter("provinceId");
		String cityId = request.getParameter("cityId");
		String areaId = request.getParameter("areaId");
		String address = request.getParameter("address");
		String zipcode = request.getParameter("zipcode");
		String tel = request.getParameter("tel");
		String fukuan = request.getParameter("zhifu");
		if(provinceId==null) {
			provinceId="1";
			
		}
		if(cityId==null) {
			cityId="1";
			
		}
		if(areaId==null) {
			areaId="1";
		}
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		System.out.println("time----"+time);
		

		System.out.println("provinceId------" + provinceId);
		System.out.println("cityId------" + cityId);
		System.out.println("areaId------" + areaId);
		System.out.println("loName------" + loName);
		System.out.println("zhifu============"+fukuan);

		String province = service.getProvince(provinceId);
		String city = service.getCity(cityId);
		String area = service.getArea(areaId);
		String shAdd = province + city + area + address;
		System.out.println("shAdd------" + shAdd);
		List<Map<String, String>> gouwuList = (List<Map<String, String>>) request
				.getSession().getAttribute("gouwuList");
		
		String[] sqls = new String[gouwuList.size()];
		for (int i = 0; i < gouwuList.size(); i++) {
			String goodsName = gouwuList.get(i).get("GOODSNAME");
			String num = gouwuList.get(i).get("NUM");
			String goodsId = gouwuList.get(i).get("GOODSID");
			String price = gouwuList.get(i).get("PRICE");

			sqls[i] = "insert into SHOPDINDAN (ID,GOODSNAME,PRICE,BUYDATE,"
					+ "STATE,DDCODE,SHADD,SHNAME,STEL,GOODSCODE,GOODSCODENU,ZIPCODE,BUYNAME,ZHIFU)values"
					+ "(autoid.nextval,'"
					+ goodsName
					+ "','"
					+ price
					+ "','"
					+ time
					+ "','未完成',dindancode.nextval,"
					+ "'"
					+ shAdd
					+ "','"
					+ shName
					+ "','"
					+ tel
					+ "','"
					+ goodsId
					+ "',"
					+ "'"
					+ num
					+ "','" + zipcode + "','" + loName + "','"+fukuan+"')";
		}
		String sql2 = "delete from SHOPCAR where BUYNAME = '" + loName + "'";
		String sql3 = "update SHOPVIP set CARNUM='0' where USERNAME= '"
				+ loName + "'";
		String[] sqlUp = new String[] { sql2, sql3 };
		int i[] = service.changeNum(sqls);
		
		if (i.length == gouwuList.size()) {
			int j[] = service.changeNum(sqlUp);
			if (j.length == 2) {
				try {
					String sqlDinDan = "select * from SHOPDINDAN where BUYNAME='"
							+ loName + "' and STATE='未完成'";
					List<Map<String, String>> dindanList = service
							.query(sqlDinDan);
					
					response.sendRedirect("/myshoppingsys/web/subm_order.jsp?time="+time);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			} else {
				System.out.println("2失败");
			}
		} else {
			System.out.println("1失败");

		}

	}

	public void delOne(HttpServletRequest request, HttpServletResponse response) {
		String loName = "";
		try {
			loName = new String(request.getParameter("loName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String goodsId = request.getParameter("goodsId");
		String sql0 = "select NUM from SHOPCAR where GOODSID = '" + goodsId
				+ "' and BUYNAME = '" + loName + "'";
		String sql1 = "select *from SHOPGOODS where ID = '" + goodsId + "'";
		String sql2 = "select * from SHOPVIP where USERNAME='" + loName + "'";
		System.out.println("-----goodsId---"+goodsId);
		List<Map<String, String>> carList = service.query(sql0);
		List<Map<String, String>> goodsList = service.query(sql1);
		List<Map<String, String>> vipList = service.query(sql2);
		System.out.println("-----2---");
		String num1 = carList.get(0).get("NUM");// 删除的商品
		String num2 = goodsList.get(0).get("NUM");// 该商品在库中剩余的数量
		String num3 = vipList.get(0).get("CARNUM");// 顾客购物的数量
		int allNum1 = Integer.parseInt(num1) + Integer.parseInt(num2);// 该商品在库中剩余的数量
		int allNum2 = Integer.parseInt(num3) - Integer.parseInt(num1);// 顾客购物的数量
		System.out.println("-----allNum1---"+allNum1);
		System.out.println("-----allNum2---"+allNum2);
		String updateSql1 = "update SHOPGOODS set NUM='" + allNum1
				+ "' where ID = '" + goodsId + "'";
		String updateSql2 = "update SHOPVIP  set CARNUM='" + allNum2
				+ "' where   USERNAME = '" + loName + "'";
		String updateSql3 = "delete from  SHOPCAR   where GOODSID = '"
				+ goodsId + "' and BUYNAME = '" + loName + "'";

		String[] sqls = new String[] { updateSql1, updateSql2, updateSql3 };
		System.out.println("-----3---");
		int[] i = service.changeNum(sqls);
		if (i.length == 3) {
			System.out.println("成功！");

			gouwu(request, response);

		}
		System.out.println("-----4---");
	}

	// 清空购物车
	public void clear(HttpServletRequest request, HttpServletResponse response) {
		String loName = "";
		try {
			loName = new String(request.getParameter("loName").getBytes(
					"iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String sql1 = "update SHOPVIP set CARNUM='0' where USERNAME='" + loName
				+ "'";
		String sql = "delete from SHOPCAR where BUYNAME='" + loName + "'";
		String sql2 = "select * from SHOPCAR where BUYNAME='" + loName + "'";
		List<Map<String, String>> goodsList = service.query(sql2);
		String[] sqls_ = new String[] { sql1, sql };

		if (goodsList.size() != 0) {

			String[] sqls = new String[goodsList.size()];

			for (int i = 0; i < goodsList.size(); i++) {
				String goodsName = goodsList.get(i).get("GOODSNAME");
				String num = goodsList.get(i).get("NUM");
				String goodsId = goodsList.get(i).get("GOODSID");
				System.out.println("goodsId-----------" + goodsId);

				String sql_0 = "select NUM from SHOPGOODS where ID='" + goodsId
						+ "'";
				List<Map<String, String>> finN = service.query(sql_0);
				System.out.println("---gg---");
				String allNu = finN.get(0).get("NUM");
				System.out.println("allNU" + allNu);

				int allNum = Integer.parseInt(num) + Integer.parseInt(allNu);
				System.out.println("allNu-------" + allNu + "---allNum"
						+ allNum);
				sqls[i] = "update SHOPGOODS set NUM='" + allNum
						+ "' where ID='" + goodsId + "'";
			}

			System.out.println("ooooo");
			int[] b = service.changeNum(sqls);
			if (b.length != goodsList.size()) {

				System.out.println("失败");

			} else {
				System.out.println("成功");

			}

		}

		int[] i = service.changeNum(sqls_);
		if (i.length != 0) {

			gouwu(request, response);

		} else {

			System.out.println("失败");
		}

	}

	// 加入购物车
	public void gouwu(HttpServletRequest request, HttpServletResponse response) {

		String loName = "";
		loName = (String) request.getSession().getAttribute("userNameqiantai");
		System.out.println("loName----" + loName);

		if (loName == null) {
			try {
				request.getRequestDispatcher("/web/enter.jsp").forward(request,
						response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			System.out.println("loName----" + loName);
			String sql = "select * from SHOPCAR where BUYNAME='" + loName + "'";

			List<Map<String, String>> gouwuList = service.query(sql);

			request.getSession().setAttribute("gouwuList", gouwuList);
			request.setAttribute("loName", loName);

			try {

				request.getRequestDispatcher("/web/maycab.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	// 进入单个商品 、评论查询
	public void singleGoods(HttpServletRequest request,
			HttpServletResponse response) {
		String goodsId = request.getParameter("goodsId");
		System.out.println("goodsId--------" + goodsId);
		String sql = "select * from SHOPGOODS t where ID='" + goodsId + "'";

		List<Map<String, String>> singleList = service.query(sql);
		System.out.println("--singleList--" + singleList.size());

		String goodsName = singleList.get(0).get("GOODSNAME");
		String price = singleList.get(0).get("PRICE");
		String category = singleList.get(0).get("CATEGORY");
		String proArea = singleList.get(0).get("PROAREA");
		String num = singleList.get(0).get("NUM");
		String img = singleList.get(0).get("IMG");
		String pinpai = singleList.get(0).get("PINPAI");
		String guige = singleList.get(0).get("GUIGE");
		String info = singleList.get(0).get("INFO");
		String discount = singleList.get(0).get("DISCOUNT");
		String color = singleList.get(0).get("COLOR");
		String update_ = singleList.get(0).get("UPDATE_");

		GoodsInfo goodsInfo = new GoodsInfo();

		goodsInfo.setGoodsName(goodsName);
		goodsInfo.setDiscount(discount);
		goodsInfo.setPinpai(pinpai);
		goodsInfo.setCategory(category);
		goodsInfo.setUpdate_(update_);
		goodsInfo.setColor(color);

		goodsInfo.setGuige(guige);
		goodsInfo.setPrice(price);
		goodsInfo.setNum(num);
		goodsInfo.setImg(img);
		goodsInfo.setInfo(info);
		goodsInfo.setProArea(proArea);

		request.setAttribute("singleList", singleList);
		
		
		int nowPage = 1;// 当前页
		int iRows = 8; // 每页显示记录数
		
		// 接收传递过来的页数
		String newPage = request.getParameter("nextPage");
		System.out.println("newPage:  " + newPage);
		if (newPage != null && !"".equals(newPage)) {
			nowPage = Integer.parseInt(newPage);
		}
		
		PageUtilchat pageUtil = new PageUtilchat();
		PageBean pageBean11 = pageUtil.queryByPage("SHOPCHAT", nowPage, iRows,"正常",goodsId);
		
		request.setAttribute("pageBean11", pageBean11);
		

		try {
			
			request.getRequestDispatcher("/web/pro_shop.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void goodsShow(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("sss");
		String sql = "select * from SHOPGOODS t";
		List<Map<String, String>> goodsList = service.query(sql);
		request.setAttribute("goodsList", goodsList);
		System.out.println("size" + goodsList.size());
		try {
			request.getRequestDispatcher("/web/pro_sel.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 查询商品通过
	public void goodsSearch(HttpServletRequest request,
			HttpServletResponse response) {
		int nowPage = 1;// 当前页
		int iRows = 4; // 每页显示记录数

		// 接收传递过来的页数
		String newPage = request.getParameter("nextPage");
		System.out.println("newPage:  " + newPage);
		if (newPage != null && !"".equals(newPage)) {
			nowPage = Integer.parseInt(newPage);
		}
		// 判断是否上架
		String isShangjia = "";
		String flagisShangjia = request.getParameter("flagisShangjia");
		request.getSession().setAttribute("flagisShangjia", flagisShangjia);

		System.out.println("------");
		System.out.println("flagisShangjia------------" + flagisShangjia);
		if (flagisShangjia == null) {
			isShangjia = (String) request.getSession().getAttribute("isShang");
			
			
		} else if (flagisShangjia.equals("no")) {
			isShangjia = "待上架";
		} else if (flagisShangjia.equals("yes")) {
			isShangjia = "上架";
		}
		System.out.println("isShangjia-----"+isShangjia);
		System.out.println("flagisShangjia-----"+flagisShangjia);
		request.getSession().setAttribute("isShang", isShangjia);
		PageUtil pageUtil = new PageUtil();
		PageBean pageBean = pageUtil.queryByPage("SHOPGOODS", nowPage, iRows,
				isShangjia);
		System.out.println("--");
		request.setAttribute("pageBean", pageBean);
		System.out.println("--");
		try {
			if (isShangjia.equals("上架")) {
				request.getRequestDispatcher("/admin/ShowShangJia.jsp")
						.forward(request, response);
			} else {
				request.getRequestDispatcher("/admin/GoodsManager.jsp")
						.forward(request, response);

			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 带条件的查询
	// 测试通过
	public void goodsSearchTiaoJian(HttpServletRequest request,
			HttpServletResponse response) {

		String pinpai = request.getParameter("pinpai");
		String categoryid = request.getParameter("CATEGORYID");
		System.out.println("-----" + categoryid + "======" + pinpai);
		String tableName = "SHOPGOODS";

		// 判断是否上架
		String isShangjia = (String) request.getSession().getAttribute(
				"isShang");

		String baseSql = "select * from " + tableName
				+ " where 1=1 and STATE='" + isShangjia + "'";

		String conditionSql = request.getParameter("baseSql");
		System.out.println("---------" + conditionSql);

		if (conditionSql != null && !"".equals(conditionSql.trim())
				&& !"null".equals(conditionSql.trim())) {
			System.out.println("1");
			baseSql = conditionSql;
			if (pinpai != null && !"".equals(pinpai.trim())) {

				baseSql = baseSql + " and  PINPAI like '%" + pinpai + "%' ";

				if (categoryid != null && !"".equals(categoryid.trim())) {
					baseSql = baseSql + " and  CATEGORY like '%" + categoryid
							+ "%' ";
				} else {
					if (categoryid != null && !"".equals(categoryid.trim())) {
						baseSql = baseSql + " and  CATEGORY like '%"
								+ categoryid + "%' ";
					}

				}

			}
		} else {
			System.out.println("2");
			if (pinpai != null && !"".equals(pinpai.trim())) {

				baseSql = baseSql + " and  PINPAI like '%" + pinpai + "%' ";

				if (categoryid != null && !"".equals(categoryid.trim())) {
					baseSql = baseSql + " and  CATEGORY like '%" + categoryid
							+ "%' ";
				}
			} else {
				System.out.println("3");
				if (categoryid != null && !"".equals(categoryid.trim())) {
					System.out.println("4");
					baseSql = baseSql + " and  CATEGORY like '%" + categoryid
							+ "%' ";
				}
			}
		}

		System.out.println("baseSql-------" + baseSql);

		/**
		 * 分页所需参数
		 */
		int rows = 0; // 总记录数
		int pages; // 总页数
		int nowPage = 1;// 当前页
		int iRows = 4; // 每页显示记录数

		// 接收传递过来的页数
		String newPage = request.getParameter("nextPage");
		System.out.println("newPage:  " + newPage);
		if (newPage != null && !"".equals(newPage)) {
			nowPage = Integer.parseInt(newPage);
		}

		// 查询总记录数
		String countSql = " select count(*) totalNum from (" + baseSql + ")";
		DBUtil dbUtil = new DBUtil();
		DbUtils du = new DbUtils();

		List<Map<String, Object>> totalNumList = du.query(countSql);
		System.out.println("num=====num" + totalNumList.size());

		if (totalNumList != null && totalNumList.size() > 0) {
			// 获取得到总记录数
			System.out.println("ssssss" + rows);
			rows = Integer.parseInt(totalNumList.get(0).get("TOTALNUM")
					.toString());
			System.out.println("ssssss" + rows);
		}

		// 总页数
		pages = rows % iRows == 0 ? rows / iRows : (rows / iRows + 1);
		System.out.println("pages" + pages);

		// 创建pageBean对象，对分页数据进行封装
		PageBean pageBean = new PageBean();
		pageBean.setBaseSql(baseSql);

		pageBean.setNowPage(nowPage);
		pageBean.setiRows(iRows);
		pageBean.setPages(pages);
		pageBean.setRows(rows);

		System.out.println("pageBean.getBaseSql:  " + pageBean.getBaseSql());

		String sqlString = " select A.* from (  select ROWNUM ROWNO,t.* from ("
				+ baseSql + ") t where ROWNUM<=" + iRows * nowPage
				+ "  order by ID desc  )A  where a.ROWNO >="
				+ ((nowPage - 1) * iRows + 1);
		System.out.println("执行分页的sql: " + sqlString);

		List<Map<String, String>> goodsList = (List<Map<String, String>>) dbUtil
				.queryByList(sqlString);

		pageBean.setResList(goodsList);

		request.setAttribute("pageBean", pageBean);

		try {
			request.getRequestDispatcher("/admin/GoodsManager.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void goodsUpdate(HttpServletRequest request,
			HttpServletResponse response) {

		String goodsId = request.getParameter("Id");
		String sql = "select * from SHOPGOODS where ID=" + goodsId;

		List<Map<String, String>> goodsList = service.query(sql);
		request.setAttribute("goodsList", goodsList);
		try {
			request.getRequestDispatcher("updateGoods").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {

	}

}
