<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.service.GoodsService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="/myshoppingsys/web/css/subm_order.css" rel="stylesheet"
	type="text/css" />
</head>

<body>
	<%
		String loName = (String) session.getAttribute("userNameqiantai");
		String time = request.getParameter("time");
		if (loName != null) {
	%>
	<!--wrap-->
	<div id="wrap">
		<!--top-->
		<div id="header">
			<h1>
				<img src="images/h1.jpg" alt="Gopile" />
			</h1>
			<div id="welcome">
				<font color="red"><%=loName%></font>您好，欢迎来到小威少威网上商城！
			</div>
			<div id="phoneno">400-600-4008</div>

			<div id="cab">
				<a href="/myshoppingsys/web/main.jsp">回到首页，继续购物</a>
			</div>
		</div>
		<!--//top-->
		<!--path-->
		<div id="path">
			<div class="path1">1、我的购物车</div>
			<div class="path2">2、确认订单信息</div>
			<div class="path3">3、成功提交订单</div>
		</div>
		<!--//path-->
		<!--content-->
		<div id="content">
			<%
				GoodsService service = new GoodsService();

					String sql_ = "select * from SHOPDINDAN where STATE='未完成' and BUYNAME='"
							+ loName + "'";
					List<Map<String, String>> subList = service.query(sql_);
					System.out.println("--ww--" + subList.size());
					if (subList != null) {
						String up_ = "update SHOPDINDAN set STATE='已下单' where BUYNAME='"
								+ loName + "' and BUYDATE='" + time + "'";
						int z = service.updateGoodsCar(up_);
			%>

			<div id="head">
				订单已提交，将分成<%=subList.size()%>个包裹发货。<a href="#">查看订单状态》</a>
			</div>
			<div id="ifm">
				<%
					for (int i = 0; i < subList.size(); i++) {
								String dindanCode = subList.get(i).get("GOODSCODE");
								String num = subList.get(i).get("GOODSCODENU");
								String price = subList.get(i).get("PRICE");
								System.out.println("222222");
								double money = Double.parseDouble(num)
										* Double.parseDouble(price);
								System.out.println("33333");
				%>
				<p>
					包裹<font color="red"><%=dindanCode%></font>预计3天后送达，您需要在收货时支付￥<span><%=money%></span>
				</p>
				<%
					}
				%>

				<p>
					*您可以在“<a href="/myshoppingsys/web/userInfo.jsp">个人中心</a>”中查看或取消您的订单，由于系统需要进行预约处理，您可能不会立即查询到刚提交的订单。
				</p>
			</div>
			<%
				} else {
			%>
			<h1>暂无数据</h1>
			<%
				}
			%>

		</div>
		<!--//content-->
		<!--ads-->
		<div id="ads"></div>
		<!--//ads-->
		<!--bottom-->
		<div id="bottom">
			<p>四海兴唐锦绣2期黄威威制作</p>
			<p>联系电话：18686672327</p>
			<p>Copyright 2010-2013 Vanvl.com All Rights京ICP证100557号</p>
		</div>

	</div>
	<!--//wrap-->

	<%
		} else {
	%>
	<h1>
		对不起，你没有权限，请<a href="myshoppingsys/web/enter.jsp">登录！</a>
	</h1>
	<%
		}
	%>

</body>
</html>
