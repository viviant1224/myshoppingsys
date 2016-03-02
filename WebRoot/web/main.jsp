<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.com.shxt.utils.DBUtil"%>
<%@ page import="cn.com.shxt.service.GoodsService"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小威少威网上购物商城</title>
<link href="/myshoppingsys/web/style/styles.css" rel="stylesheet"
	type="text/css" />
<link type="text/css" href="/myshoppingsys/web/style/lrtk1.css"
	rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="/myshoppingsys/web/js/swfobject_modified.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function change() {
		var loName = document.getElementById("userNameqiantai").firstChild.nodeValue;
		if (loName == "登录") {
			window.location.href = "/myshoppingsys/web/enter.jsp";

		} else {
			if (confirm("您确定要注销当前用户?")) {

				window.location.href = "/myshoppingsys/goodsServlet?flag=logout";
			} else {
				return;
			}
		}
	}

	function search() {
		var tiaojian = document.getElementById("input_1").value;

		window.location.href = "/myshoppingsys/goodsServlet?flag=search&tiaojian="
				+ tiaojian;

	}
</script>
</head>
<%
	DBUtil du  = new DBUtil();
		String userNameqiantai = (String)session.getAttribute("userNameqiantai");
   		 		
   		 		if(userNameqiantai==null) {
   		 		userNameqiantai="登录";
   		 		}
%>

<body>
	<div id="wrap">
		<!--header-->
		<div id="header">
			<div id="top">
				<h1>
					<a href="#this">花房家具--创意抓住你的心</a>
				</h1>
				<form method="post" action="pro_sel.jsp" name="">
					<input type="text" id="input_1" /> <input type="button" value="搜索"
						id="input_2" onclick="search()" />
				</form>
				<a href="javascript:void(0)" onclick="change()"> 当前用户：<font
					color="red" id="userNameqiantai"><%=userNameqiantai%></font>|注销</a> <a
					href="/myshoppingsys/goodsServlet?flag=userInfozhangdan" class="oh">个人中心</a>
			</div>
			<div id="meun11">
				<div id="nav_left"></div>
				<ul id="nav">
					<li><a href="/myshoppingsys/web/main.jsp">首页</a>
					</li>
					<li><a href="/myshoppingsys/goodsServlet?flag=search">商城</a>
					</li>
				</ul>
			</div>

			<span id="pos"><img src="/myshoppingsys/web/img/icon_12.gif" alt="icon" /><a
				href="#this">首页</a>
			</span>
			<div id="main">
				<div id="class">
					<dl class="bed">
						<dt>服装装饰：</dt>

						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男装">男装</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女装">女装</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男包">男包</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女包">女包</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=装饰">装饰</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
					</dl>
					<dl class="bed">
						<dt>数码家电：</dt>

						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=笔记本">笔记本</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=手机">手机</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=电源">电源</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=平板">平板</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=相机">相机</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
					</dl>
					<dl class="bed">
						<dt>户外运动：</dt>

						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男运动">男运动</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女运动">女运动</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男鞋">男鞋</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女鞋">女鞋</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=品牌">品牌</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
					</dl>
					<dl class="bed">
						<dt>家居百货：</dt>

						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=居家">居家</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=家纺">家纺</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=餐饮">餐饮</a>
						</dd>
						<dd>
							<a
								href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=床用品">床用品</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
						<dd>
							<a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</dd>
					</dl>

				</div>
				<div id="banner">
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
						width="473" height="400" id="FlashID" title="banner">
						<param name="movie" value="fla/index_fla.swf" />
						<param name="quality" value="high" />
						<param name="wmode" value="opaque" onclick="haha()" />
						<param name="swfversion" value="6.0.65.0" />
						<!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
						<param name="expressinstall" value="Scripts/expressInstall.swf" />
						<!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
						<!--[if !IE]>-->
						<object type="application/x-shockwave-flash"
							data="/myshoppingsys/web/fla/index_fla.swf" width="473"
							height="400">
							<!--<![endif]-->
							<param name="quality" value="high" />
							<param name="wmode" value="opaque" />
							<param name="swfversion" value="6.0.65.0" />
							<param name="expressinstall" value="Scripts/expressInstall.swf" />
							<!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
							<div>
								<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
								<p>
									<a href="http://www.adobe.com/go/getflashplayer"><img
										src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
										alt="获取 Adobe Flash Player" />
									</a>
								</p>
							</div>
							<!--[if !IE]>-->
						</object>
						<!--<![endif]-->
					</object>
				</div>
				<div id="right">
					<div class="top">
						<a
							href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=运动">运动</a>
						<a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=鞋">鞋</a>
						<a
							href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=居家">居家</a>
					</div>
					<div class="bot h2_bg1">
						<%
							String sql = "select * from (select rownum as rn, a.* from (select * from SHOPGOODS t  order by price asc ) a)where rn between 1 and 1";
										List<Map<String,String>> zuidiList = du.queryByList(sql);
										String zuidigoodsName = zuidiList.get(0).get("GOODSNAME");
										String zuidiprice = zuidiList.get(0).get("PRICE");
										double yuanjia = Double.parseDouble(zuidiprice)*2;
										String zuidiID = zuidiList.get(0).get("ID");
										String zuidiimg = zuidiList.get(0).get("IMG");
						%>
						<h2 class="h2_1">
							本周特惠<a href="/myshoppingsys/web/pro_sel.jsp"><img
								src="/myshoppingsys/web/img/more.gif" alt="more" class="more_1" />
							</a>
						</h2>
						<dl>
							<dt>
								<a
									href="/myshoppingsys/goodsServlet?goodsId=<%=zuidiID%>&flag=single"><img
									src="<%=path%>/upload/<%=zuidiimg%>" height="150px"
									width="180px" />
								</a>
							</dt>
							<dd>
								原价：<%=yuanjia%>元
							</dd>
							<dd>
								特惠价：<span><%=zuidiprice%>元</span>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
		<!--//header-->
		<!--contents-->
		<div id="contents">
			<div id="sale">
				<h2 class="h2_2">限时折扣</h2>
				<%
					String sqldiscount = "select * from (select rownum as rn, a.* from SHOPGOODS a where DISCOUNT not in ('10') order by discount asc  )where rn between 1 and 8 order by discount asc";
							List<Map<String,String>> disList = du.queryByList(sqldiscount);
							for(int dis = 0; dis<disList.size();dis++) {
							String disgoodsName = disList.get(dis).get("GOODSNAME");
							String disId = disList.get(dis).get("ID");
							String disimg = disList.get(dis).get("IMG");
							String disprice = disList.get(dis).get("PRICE");
							String disdiscount = disList.get(dis).get("DISCOUNT");
				%>
				<dl>
					<dt>
						<a
							href="/myshoppingsys/goodsServlet?goodsId=<%=disId%>&flag=single"><img
							src="<%=path%>/upload/<%=disimg%>" height="130px" width="150px" />
						</a>
					</dt>
					<dd>
						<a
							href="/myshoppingsys/goodsServlet?goodsId=<%=disId%>&flag=single"><%=disgoodsName%></a>
					</dd>
					<dd>
						<font color="red"><%=disdiscount%></font>折促销&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="/myshoppingsys/goodsServlet?goodsId=<%=disId%>&flag=single">折扣价：<span>￥<%=disprice%></span>
						</a>
					</dd>
				</dl>



				<%
					}
				%>



			</div>
			<div id="rank" class="h2_bg1">
				<h2 class="h2_1 tit">
					排行榜<a href="pro_sel.html"><img
						src="/myshoppingsys/web/img/more.gif" alt="more" class="more_1" />
					</a>
				</h2>
				<ul>
					<li>
						<%
							GoodsService service = new GoodsService();
								
									String sqlrepaihan = "select * from (select rownum as rn, a.* from ("
								+ "select goodscode,SUM(goodscodenu) from SHOPDINDAN t where STATE='已完成' group by goodscode order by max(goodscodenu) desc) a)"
								+ "where rn between 1 and 10";

								List<Map<String, String>> paihanList = service.query(sqlrepaihan);
									System.out.println("paihanList-----"+paihanList.size());
									if(paihanList!=null) {
									String firstId = paihanList.get(0).get("GOODSCODE");
									String sqlpaihan_ = "select * from shopgoods where ID='"+firstId+"'";
										List<Map<String,String>> paihanban_ = du.queryByList(sqlpaihan_);
										String firstname = paihanban_.get(0).get("GOODSNAME");
										String firstimg = paihanban_.get(0).get("IMG");
						%>
						<dl>
							<dt>
								<a
									href="/myshoppingsys/goodsServlet?goodsId=<%=firstId%>&flag=single"><img
									src="<%=path%>/upload/<%=firstimg%>" height="70px"
									width="120px" />
								</a>
							</dt>
							<dd>
								<a
									href="/myshoppingsys/goodsServlet?goodsId=<%=firstId%>&flag=single"><%=firstname%></a>
							</dd>
						</dl></li>
					<%
						for(int k = 1;k<paihanList.size();k++) {
									String paihanId = paihanList.get(k).get("GOODSCODE");
									String paihannum=paihanList.get(k).get("SUM(GOODSCODENU)");
									System.out.println("...................");
									String sqlpaihan = "select * from shopgoods where ID='"+paihanId+"'";
									List<Map<String,String>> paihanban = du.queryByList(sqlpaihan);
									System.out.println("+++++++++++++++"+paihanban.size());
									String goodsnamepaihan = paihanban.get(0).get("GOODSNAME");
									System.out.println("goodsnamepaihan"+goodsnamepaihan);
									String pricepaihan = paihanban.get(0).get("PRICE");
									String imgpaihan = paihanban.get(0).get("IMG");
										System.out.println("IMG"+imgpaihan);
					%>
					第
					<font color="red"><%=k+1%></font>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a
						href="/myshoppingsys/goodsServlet?goodsId=<%=paihanId%>&flag=single"><font
						size="2" color="black"><%=goodsnamepaihan%></font>
					</a>
					<br />

					<%
						}
										} else {
					%>

					<%
						}
					%>




				</ul>
			</div>

			<div id="cha">
				<h2 class="h2_2 tit_2">最新动态</h2>
				<a href="#this" class="a1 com">跳骚市场</a> <a href="#this"
					class="a2 com">店铺促销</a> <a href="#this" class="a3 com">品牌特卖</a>
				<dl>
					<dt>
						<a href="pro_shop.html"><img src="img/img_2.gif" alt="沙发" />
						</a>
					</dt>
					<dd>
						<a href="pro_shop.html">二手沙发特价出售，快来抢购！</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a href="pro_shop.html"><img src="img/img_2.gif" alt="沙发" />
						</a>
					</dt>
					<dd>
						<a href="pro_shop.html">二手沙发特价出售，快来抢购！</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a href="pro_shop.html"><img src="img/img_2.gif" alt="沙发" />
						</a>
					</dt>
					<dd>
						<a href="pro_shop.html">二手沙发特价出售，快来抢购！</a>
					</dd>
				</dl>
				<a href="#this" class="a4">【更多】</a>
			</div>

			<div id="comment">
				<h2 class="h2_2 tit_3">最新热评</h2>
				<%
					String sqlzuixinchat = " select a.* from( select rownum rowno,t.* from (select * from SHOPCHAT t  where pinglunname!='无' order by    date_  desc) t where rownum<=3 and PINGLUNNAME!='无' order by date_ desc )a where a.rowno>=1";
							List<Map<String,String>> zuixinchatList = service.query(sqlzuixinchat);
							if(zuixinchatList!=null||zuixinchatList.size()!=0) {
							for(int  i = 0;i<zuixinchatList.size();i++) {
								String goodsId = zuixinchatList.get(i).get("GOODSCODE");
								String goodsname = zuixinchatList.get(i).get("GOODSNAME");
								String buyname = zuixinchatList.get(i).get("BUYNAME");
								String jibie = zuixinchatList.get(i).get("JIBIE");
								String findimg = "select IMG from SHOPGOODS where ID='"+goodsId+"'";
								List<Map<String,String>> imgList = service.query(findimg);
								String img = imgList.get(0).get("IMG");
								String neirong = zuixinchatList.get(i).get("NEIRONG");
				%>
				<dl>
					<dt>
						<a
							href="/myshoppingsys/goodsServlet?goodsId=<%=goodsId%>&flag=single"><img
							src="<%=path%>/upload/<%=img%>" height="70px" width="100px" />
						</a>
					</dt>
					<dd>
						<a href="pro_shop.html"><%=neirong%></a>
					</dd>
					<dd>
						评价：<%=jibie%></dd>
					<dd><%=buyname%></dd>
				</dl>
				<hr />
				<%
					}
							
							
							} else {
				%>
				<h2 align="center">暂无任何评论</h2>
				<%
					}
				%>




			</div>

		</div>


		<!--//contents-->
		<!--footer-->
		<div id="footer">
			<div id="link">友情链接： 房屋装修效果图 | 家具视频 | 建材市场 |建筑论坛 | 厦门家装网 | 搜房网
				| 宜家家居 | 新浪家 具 | 网易家具 | 我的家 | 小资世界</div>
		</div>
		<address>©2010-2012 花房 版权所有 ICP备案证书号：京ICP备08008334号</address>
		<!--//footer-->

	</div>
	<script type="text/javascript">
		swfobject.registerObject("FlashID");
	</script>
</body>
</html>
