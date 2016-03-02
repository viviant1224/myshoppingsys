<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.model.*"%>

<%@ page import="cn.com.shxt.service.GoodsService"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小威少威网上商城</title>
<link href="/myshoppingsys/web/style/styles.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="/myshoppingsys/kingEditor/themes/default/default.css" />
<link rel="stylesheet"
	href="/myshoppingsys/kindEditor/plugins/code/prettify.css" />
<script charset="utf-8" src="/myshoppingsys/kindEditor/kindeditor.js"></script>
<script charset="utf-8" src="/myshoppingsys/kindEditor/lang/zh_CN.js"></script>
<script charset="utf-8"
	src="/myshoppingsys/kindEditor/plugins/code/prettify.js"></script>



<link rel="stylesheet" href="styles/detail.css" type="text/css" />
<link rel="stylesheet" href="styles/skin/skin_0.css" type="text/css"
	id="cssfile" />
<link rel="stylesheet" href="styles/thickbox.css" type="text/css" />
<script src="/myshoppingsys/scripts/jquery-1.3.1.js"
	type="text/javascript"></script>
<script src="/myshoppingsys/scripts/use_jqzoom.js"
	type="text/javascript"></script>
<script src="/myshoppingsys/scripts/jquery.jqzoom.js"
	type="text/javascript"></script>


<script type="text/javascript">
 
		 

	
//登录
	function loginUser() {

		var my_width = 450; //小窗口的宽度和高度
		var my_height = 370;
		var left = window.screen.width / 2 - my_width / 2;
		var top = window.screen.height / 2 - my_height / 2;
		window.open("/myshoppingsys/web/enter.jsp", "_blank", "left=" + left
				+ ",top=" + top + ",height=" + my_height + ",width=" + my_width
				+ ",status=no,toolbar=no,menubar=no,location=no");

	}
	
//校验输进去的购买件数
	function validateNum() {
		var num = document.getElementById("buyNum").value;//加入购物车的数量

		var shengyuNode = document.getElementById("shengyu");
		var shengyu = shengyuNode.firstChild.nodeValue;//库存的货物数量

		var bNode = document.getElementById("b");
		var n = bNode.firstChild.nodeValue;//购物车数量

		var login = document.getElementById("loName");
		var loName = login.firstChild.nodeValue;
		if (loName == "登录") {
			loginUser();
		} else {
			var regu = "^[0-9]+$";
			var re = new RegExp(regu);
			if (num.trim() == "") {
				alert("件数不能为空，请重新购买");
				return false;
			} else if (num.search(re) != -1) {
				if (num > parseInt(shengyu)) {
					alert("对不起，超出额数,请重新购买");
					return false;
				} else {

					n = parseInt(n) + parseInt(num);
					var textNode = document.createTextNode(n);
					bNode.replaceChild(textNode, bNode.firstChild);

					shengyu = shengyu - num;

					var shengyuNum = document.createTextNode(shengyu);

					shengyuNode
							.replaceChild(shengyuNum, shengyuNode.firstChild);

					shengyuNode
							.replaceChild(shengyuNum, shengyuNode.firstChild);
					
					findshengyu();
					
					return true;
				}

			} else {
				alert("件数输入不合法,请重新购买");

				return false;
			}

		}

	}

	function createXmlHttpRequest() {
		var xmlHttpReq;
		if (window.XMLHttpRequest) {
			xmlHttpReq = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlHttpReq;
	}

	var xmlHttpRequest;

	function findshengyu() {

		var shengyuNode = document.getElementById("shengyu");
		var shengyu = shengyuNode.firstChild.nodeValue;
		var goodsId = document.getElementById("goodsId").value;
		var login = document.getElementById("loName");
		var loName = login.firstChild.nodeValue;

		var bNode = document.getElementById("b");
		var n = bNode.firstChild.nodeValue;
		var buynum_ = document.getElementById("buyNum").value;

		var goodsName_ = document.getElementById("goodsName");
		var goodsName = goodsName_.firstChild.nodeValue;

		var price_ = document.getElementById("price");
		var price = price_.firstChild.nodeValue;
		var discount_ = document.getElementById("discount");
		var discount = discount_.firstChild.nodeValue;

		xmlHttpRequest = createXmlHttpRequest();
		xmlHttpRequest.onreadystatechange = findshengyucallBack;
		xmlHttpRequest.open("post", "/myshoppingsys/ChangeNum", true);
		xmlHttpRequest.setRequestHeader("content-type",
				"application/x-www-form-urlencoded");
		xmlHttpRequest.send("goodsId=" + goodsId + "&discount=" + discount
				+ "&price=" + price + "&goodsName=" + goodsName + "&buynum_="
				+ buynum_ + "&shengyu=" + shengyu + "&loName=" + loName + "&"
				+ Math.random());
	}

	//通过xml实现的回调
	function findshengyucallBack() {
		if (xmlHttpRequest.readyState == 4) {
			if (xmlHttpRequest.status == 200) {
				var info = xmlHttpReq.responseText;
				alert(info);
			}
		}
	}
	
	
//文本编辑器
   var editor1;
		KindEditor.ready(function(K) {
		    //“content1”  就是form表单中的textarea的name属性值 
			editor1 = K.create('textarea[name="content1"]', {
				cssPath : 'kindEditor/plugins/code/prettify.css', 
				uploadJson : 'kindEditor/jsp/upload_json.jsp', 
				fileManagerJson : 'kindEditor/jsp/file_manager_json.jsp',  
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
					  //“example”  就是form表单的name属性值 
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		
		
		//判断表单是否可以提交 
		function subForm(){
		
		if(checkisLogin()) {
		
		if(editor1.isEmpty()){
			 alert("内容不能为空!");
		     return false;
			}  else {
			return true;
			}
		} else {
		
		return false;
		}	
		
		}

	function checkisLogin() {
		var login = document.getElementById("loName");
		var loName = login.firstChild.nodeValue;
		if (loName == "登录") {
			alert("请先登录后评论");
			loginUser();
			return false;

		} else {
		return true;
		}
	
	}
	
	//更改登录状态
	function change_() {
		var loName = document.getElementById("loName").firstChild.nodeValue;
		if (loName == "登录") {
			window.location.href = "web/enter.jsp";

		} else {
			if (confirm("您确定要注销当前用户?")) {
				window.location.href = "/myshoppingsys/goodsServlet?flag=logout";
			} else {
				return;
			}

		}

	}

	function findbuynum() {
		var num = document.getElementById("buyNum").value;//输入的数量
		
		var shengyuNode = document.getElementById("shengyu");
		var shengyu = shengyuNode.firstChild.nodeValue;//库存的货物数量
		
		var login = document.getElementById("loName");
		var loName = login.firstChild.nodeValue;
		var goodsId = document.getElementById("goodsId").value;
		if (loName == "登录") {

			loginUser();

		} else {
			var regu = "^[0-9]+$";
			var re = new RegExp(regu);
			if (num.trim() == "") {
				alert("件数不能为空，请重新购买");
				return false;
			} else if (num.search(re) != -1) {
				if (num > parseInt(shengyu)) {
					alert("对不起，超出额数,请重新购买");
					return false;
				} else {
					window.location.href = "/myshoppingsys/goodsServlet?flag=buynow&goodsId="
							+ goodsId + "&num=" + num;

				}

			} else {
				alert("件数输入不合法,请重新购买");

				return false;
			}

		}

	}

//查询货物
	function search() {
		var tiaojian = document.getElementById("input_1").value;

		window.location.href = "/myshoppingsys/goodsServlet?flag=searchOne&tiaojian="
				+ tiaojian;

	}
			
			
			//跳页
			//下一页
   function  nextPage(pages,nowPage){
	   //当前页是尾页
	    if(nowPage==pages){
	    	alert("当前为尾页，没有下一页!");
	    }else{
	    
	   //给form表单赋值
	    document.getElementById("nextPage").value=nowPage+1;
	   //方式1：window.location.href=XXservlet?nowPage=2
	   //方式2：利用js提交表单
	   //方法3：通过form的name值提交
	    nextPageForm.submit();
	    }
   }
   
   //上一页
   function upPage(nowPage){
	   if(nowPage==1){
		   alert("当前为首页，没有上一页!");
	   }else{
		 //给form表单赋值
		    document.getElementById("nextPage").value=nowPage-1;
		    nextPageForm.submit();
	   }
 }
		
</script>
</head>


<!--GoodsInfo goodsinfo = (GoodsInfo)request.getAttribute("goodsInfo");
	
	String goodsName = goodsinfo.getGoodsName();
	String category = goodsinfo.getCategory();
	String img = goodsinfo.getImg();
	String color = goodsinfo.getColor();
	
	String info = goodsinfo.getInfo();
	String guige = goodsinfo.getGuige();
	String num = goodsinfo.getNum();
	String pinpai = goodsinfo.getPinpai();
	
	String update_ = goodsinfo.getUpdate_();
	String discount = goodsinfo.getDiscount();
	String price = goodsinfo.getPrice();
	String proarea = goodsinfo.getProArea();
-->


<body>
	<%
		GoodsService service = new GoodsService();

		List<Map<String, String>> singleList = (List<Map<String, String>>) request
				.getAttribute("singleList");
		if (singleList != null) {
			Map<String, String> map = singleList.get(0);
			String goodsId = map.get("ID").toString();
			String goodsName = map.get("GOODSNAME");
			String category = map.get("CATEGORY");
			String price = map.get("PRICE");
			String update_ = map.get("UPDATE_");
			System.out.println("update_" + update_);
			String discount = map.get("DISCOUNT");
			String color = map.get("COLOR");
			String area = map.get("PROAREA");
			String childcate = map.get("CHILDCATE");
			String info = map.get("INFO");
			if (info == null || info.equals(" 请在填写商品介绍 ")) {
				info = "暂无详情";

			}
			String guige = map.get("GUIGE");
			if (guige == null) {
				guige = "暂无";
			}

			if (discount == null) {
				discount = "无";
			} else if (discount.equals("10")) {
				discount = "无";
			}

			System.out.println("discount" + discount);
			String state = map.get("STATE");
			String proarea = map.get("PROAREA");
			String num = map.get("NUM");
			String firstprice = map.get("FIRSTPRICE");
			String pinpai = map.get("PINPAI");
			if (pinpai == null) {
				pinpai = "无";
			}
			String img = map.get("IMG");
			String userNameqiantai = (String) session
					.getAttribute("userNameqiantai");
			int xiaoxinum = 0;
			int carnum = 0;
			if (userNameqiantai == null) {
				userNameqiantai = "登录";

			} else {
				System.out.println("wwwwwwwwwwww" + userNameqiantai);
				String sql0 = "select* from SHOPVIP where USERNAME='"
						+ userNameqiantai + "'";
				List<Map<String, String>> userList = service.query(sql0);
				String carnum_ = userList.get(0).get("CARNUM");
				carnum = Integer.parseInt(carnum_);
				String xiaoxi = "select * from SHOPGERENXIAOXI t where state2='未读' and  BUYNAME='"
						+ userNameqiantai + "'";
				List<Map<String, String>> xiaoxiList = service
						.query(xiaoxi);
				xiaoxinum = xiaoxiList.size();

			}
			String yihou = "select sum(GOODSCODENU) from SHOPDINDAN t where GOODSCODE='"
					+ goodsId + "' and state='已完成'";
			List<Map<String, String>> yishouList = service.query(yihou);
			String yishounum = yishouList.get(0).get("SUM(GOODSCODENU)");
			if (yishounum == null) {
				yishounum = "0";
			}
	%>
	<div id="wrap">
		<!--header-->
		<div id="header">
			<div id="leader">
				<span>亲，欢迎来到小威少威网上商城！<a href="javascript:void(0)" id="login"
					onclick="change_()"> <font color="red" id="loName"><%=userNameqiantai%></font>
				</a>&nbsp;<a href="/myshoppingsys/web/register.jsp">免费注册</a> </span>
				<div id="link_2">
					<a href="/myshoppingsys/web/main.jsp"> 商城首页</a> &nbsp;|<a
						href="/myshoppingsys/goodsServlet?flag=userInfozhangdan">个人中心</a>
					&nbsp;|<a href="#chat"> 用户留言</a>&nbsp;| <a id="gouwu"
						href="<%=path%>/goodsServlet?flag=gouwu&loName=<%=userNameqiantai%>">购物车<b
						id="b"><%=carnum%></b>件</a> &nbsp;|<a
						href="/myshoppingsys/web/userInfo.jsp?flag_=xiaoxi">系统消息<sup><font
							color="red" size="2"><%=xiaoxinum%></font>
					</sup>
					</a>&nbsp;|
				</div>
			</div>
			<h1>
				<a href="#this"><img src="/myshoppingsys/web/img/logo_1.gif"
					alt="logo" /> </a>
			</h1>
			<ul id="nav_1">
				<li><a href="pro_sel.html" class="strong_1">家居</a> <a
					href="pro_sel.html">被芯</a> <a href="pro_sel.html">枕套</a> <a
					href="pro_sel.html">毛毯</a> <a href="pro_sel.html">床褥</a>
				</li>
				<li><a href="pro_sel.html" class="strong_1">生活</a> <a
					href="pro_sel.html">家居</a> <a href="pro_sel.html">被芯</a> <a
					href="pro_sel.html">枕套</a> <a href="pro_sel.html">毛毯</a>
				</li>
				<li><a href="pro_sel.html" class="strong_1">建材</a> <a
					href="pro_sel.html">家居</a> <a href="pro_sel.html">被芯</a> <a
					href="pro_sel.html">枕套</a> <a href="pro_sel.html">毛毯</a>
				</li>
				<li><a href="#this" class="strong_1">饰品</a> <a href="#this">被芯</a>
					<a href="#this">枕套</a> <a href="#this">毛毯</a> <a href="#this">床褥</a>
				</li>
			</ul>
			<div id="select">
				<input type="text" name="" id="input_1" class="text_1" /> <input
					type="button" name="" value="搜商品" class="button_1"
					onclick="search()" /> <input type="button" value="搜本店"
					class="button_2" /> <input type="hidden" id="goodsId"
					value="<%=goodsId%>" />
			</div>

		</div>
		<!--//header-->
		<!--contents-->
		<div id="contents">
			<div id="logo_2">
				<img src="/myshoppingsys/web/img/logo_2.jpg" alt="" />
			</div>
			<ul id="nav_2">
				<li><a href="/myshoppingsys/web/main.jsp">首页</a></li>
				<li><a href="#pingjia">交流区</a></li>
				<li><a href="#xiangqing">宝贝详情</a></li>
			</ul>


			<div id="baby">



				<div class="pro_detail_left">
					<!-- 放大镜显示的商品 -->
					<div class="jqzoom">
						<img src="<%=path%>/upload/<%=img%>" height="250px" width="250px"
							alt="" jqimg="<%=path%>/upload/<%=img%>" id="bigImg" />
					</div>


				</div>
				<div>
					<span id="goodsName"><%=goodsName%></span>
				</div>
				<ul id="introduce">
					<li>价格：<a href="#this" id="price"><%=price%></a>元&nbsp;&nbsp;&nbsp;折扣：<font
						color="red" id="discount"><%=discount%></font></li>
					<li>发货地点：<%=area%></li>
					<li>已售出：<%=yishounum%>件</li>
					<li>评价：4.8分</li>
					<li>支持支付方式：在线支付 货到付款</li>
					<%
						if (color != null) {
					%>
					<li>颜色：<%=color%></li>
					<%
						} else {
					%>
					<li>颜色：无颜色可选</li>

					<%
						}
					%>


					<li>购买数量：</li>
					<input type="text" id="buyNum" name="" class="button_3"
						/>
					<a class="h">件（剩余<font color="red" id="shengyu"><%=num%></font>件）</a>

					<li><img src="<%=path%>/web/img/btn_6.jpg" alt="立即购买"
						onclick="findbuynum()" /> 
						<img src="<%=path%>/web/img/btn_7.jpg"
						alt="加入购物车" onclick="validateNum()" /></li>
				</ul>

			</div>



			<div id="hot_1">
				<a href="#this"><img src="/myshoppingsys/web/img/ad.gif" alt="" />
				</a>
			</div>



			<div id="introduce_1">
				<h2 class="h2_1 tit_10">
					<a name="pingjia">商品评价</a>
				</h2>
				<%
					String haoping = "select count(jibie) from shopchat where JIBIE='好评'and GOODSCODE='"
								+ goodsId + "'";
						String zhongping = "select count(jibie) from shopchat where JIBIE='中评' and GOODSCODE='"
								+ goodsId + "'";
						String chaping = "select count(jibie) from shopchat where JIBIE='差评' and GOODSCODE='"
								+ goodsId + "'";

						List<Map<String, String>> haopingList = service.query(haoping);
						String haopingNum = haopingList.get(0).get("COUNT(JIBIE)");

						List<Map<String, String>> zhongpingList = service
								.query(zhongping);
						String zhongpingNum = zhongpingList.get(0).get("COUNT(JIBIE)");

						List<Map<String, String>> chapingList = service.query(chaping);
						String chapingNum = chapingList.get(0).get("COUNT(JIBIE)");

						//

						PageBean pageBean = (PageBean) request
								.getAttribute("pageBean11");
						if (pageBean != null) {

							List<Map<String, String>> chatList = pageBean.getResList();
							int rows = pageBean.getRows(); //总记录数
							int pages = pageBean.getPages(); //总页数
							int nowPage = pageBean.getNowPage();//当前页

							if (chatList != null && chatList.size() > 0) {
				%>
				<form action="/myshoppingsys/goodsServlet" name="nextPageForm"
					method="post">
					<input type="hidden" name="flag" value="single" /> <input
						type="hidden" name="goodsId" value=<%=goodsId%> /> <input
						id="nextPage" type="hidden" name="nextPage" /> <input
						type="hidden" name="baseSql" value="<%=pageBean.getBaseSql()%>" />

				</form>
				<%
					
				%>
				<font color="black" size="3"><p align="center">
						共<%=rows%>条评论
					</p>
				</font> 好评（<%=haopingNum%>）&nbsp;&nbsp;&nbsp;&nbsp;中评（<%=zhongpingNum%>）&nbsp;&nbsp;&nbsp;&nbsp;差评（<%=chapingNum%>）<br />
				<br />
				<%
					for (int i = 0; i < chatList.size(); i++) {
									int[] arr = new int[chatList.size()];
									String chat = chatList.get(i).get("NEIRONG");
									String buyname = chatList.get(i).get("BUYNAME");
									String pinlundate = chatList.get(i).get("DATE_");
				%>
				<font color="red"><b><%=buyname%></b>
				</font>:&nbsp;&nbsp;&nbsp;&nbsp;<%=chat%><br />
				<p align="right">
					--------<%=pinlundate%></p>
				<%
					}
				%>
				<label style="font-size:12px; color:red">总共<%=rows%>条记录，当前为<%=nowPage%>/<%=pages%>页</label>
				<a href="javascript:void(0)" onclick="upPage(<%=nowPage%>)"
					class="next">上一页</a>&nbsp; <a href="javascript:void(0)"
					onclick="nextPage(<%=pages%>,<%=nowPage%>)" class="next">下一页</a>&nbsp;
				<%
					} else {
				%>
				<p align="center">
					<h1>共0条评论</h1>
				</p>

				<%
					}
						} else {
				%>
				<h2>暂无数据</h2>

				<%
					}
				%>
			</div>



			<div id="detail">
				<div>
					<img src="/myshoppingsys/web/img/detail.gif" alt="" class="df" />
					<ul id="main_2">
						<li><a name="xiangqing">品牌：</a><%=pinpai%></li>
						<li>商品编号：<%=goodsId%></li>
						<li>颜色：<%=color%></li>
						<li>发货地点：<%=area%></li>

						<li>所属种类：<%=category%>&nbsp;&nbsp;&nbsp;&nbsp;<%=childcate%></li>

						<li>商品详情：<%=info%></li>
						<li>产品规格：<%=guige%></li>

					</ul>
				</div>
			</div>
			<div>

				<form id="myForm" name="example" method="post"
					action="/myshoppingsys/goodsServlet?flag=liuyan"
					onsubmit="return subForm()">


					<textarea name="content1" cols="100" rows="8" id="content"
						style="width:700px;height:200px;visibility:hidden;"></textarea>
					<br /> <input type="hidden" name="goodsId" id="goodsId"
						value="<%=goodsId%>" /> <input type="hidden" name="goodsName"
						id="goodsName" value="<%=goodsName%>" /> <input type="hidden"
						name="buyname" id="buyname" value="<%=userNameqiantai%>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


					<p align="right">
						<input type="submit" name="button" value="留言" /> <a name="chat">(提交快捷键:
							Ctrl + Enter)</a>
					</p>
				</form>

			</div>

		</div>
		<!--//contents-->
		<!--footer-->
		<div id="footer">
			<div id="tel">
				<dl>
					<dt>24小时客服热线</dt>
					<dd>
						<span>400 8834823</span>
					</dd>
					<dd>截止今日，花房在全国已有实体店123家</dd>
					<dd>
						<img src="img/btn_3.gif" alt="btn" />
					</dd>
				</dl>
			</div>
			<div id="service">
				<ul id="ser_1">
					<li><a href="#this">关于本站</a> <span><a href="#this">公司简介</a>
					</span> <span><a href="#this">CEO致辞</a> </span> <span><a
							href="#this">体验馆</a> </span> <span><a href="#this">联系我们</a> </span> <span><a
							href="#this">诚聘精英</a> </span>
					</li>
					<li><a href="#this">新手指南</a> <span><a href="#this">注册新用户</a>
					</span> <span><a href="#this">订购家具流程</a> </span> <span><a
							href="#this">体验馆购买指导</a> </span> <span><a href="#this">付款方式</a> </span>
						<span><a href="#this">常见问题解答</a> </span>
					</li>
					<li><a href="#this">配送安装</a> <span><a href="#this">收货指南</a>
					</span> <span><a href="#this">全国体验服务费</a> </span> <span><a
							href="#this">维修补件说明</a> </span>
					</li>
					<li><a href="#this">售后服务</a> <span><a href="#this">退换货说明</a>
					</span> <span><a href="#this">如何申请退款</a> </span> <span><a
							href="#this">物流配送</a> </span>
					</li>
					<li><a href="#this">购物保障</a> <span><a href="#this">正品保证</a>
					</span> <span><a href="#this">注册协议</a> </span> <span><a
							href="#this">隐私保护</a> </span> <span><a href="#this">免责声明</a> </span>
					</li>
				</ul>
			</div>
			<%
				} else {
					request.getRequestDispatcher("../goodsServlet?flag=search")
							.forward(request, response);
				}
			%>
			<div id="link">友情链接： 房屋装修效果图 | 家具视频 | 建材市场 |建筑论坛 | 厦门家装网 | 搜房网
				| 宜家家居 | 新浪家 具 | 网易家具 | 我的家 | 小资世界</div>
		</div>
		<address>©2010-2012 花房 版权所有 ICP备案证书号：京ICP备08008334号</address>

		<!--//footer-->
	</div>

</body>
</html>
