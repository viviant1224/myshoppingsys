<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.com.shxt.model.PageBean"%>
<%@page import="cn.com.shxt.utils.DBUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小威少威网上商城</title>
<link href="/myshoppingsys/web/style/styles.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
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
   
   //首页
   function headPage(nowPage){ 
	   //当前页就是首页
	   if(nowPage==1){
		   return;
	   }else{
		   document.getElementById("nextPage").value=1;
		    nextPageForm.submit();
	   }
	   
   }
    //跳页
      function  tiaoye(nowPage,pages){
      		var tiaopage = document.getElementById("tiaopage").value;
      			
      			var regu = "^[0-9]+$";
				var re = new RegExp(regu);
				
				if(tiaopage.trim()=="") {
						alert("请输入正确的格式");
						return false;
					}else if (tiaopage.search(re) != -1) {
						if(tiaopage>pages||tiaopage<1) {
						alert("对不起，超出页数范围！");
						return false;
						} else{
					  	document.getElementById("nextPage").value=tiaopage;
	    				nextPageForm.submit();
	    					}
					} else{
					alert("请输入正确的格式");
					}
	 
   }
 //尾页
   function footPage(nowPage,pages){ 
	   //当前页就是首页
	   if(nowPage==pages){
		   return;
	   }else{
		   document.getElementById("nextPage").value=pages;
		   nextPageForm.submit();
	   }
	   
   }
   function change() {
   var loName = document.getElementById("userNameqiantai").firstChild.nodeValue;
   if(loName=="登录") {
    window.location.href="web/enter.jsp";
   
   } else {
    if(confirm("您确定要注销当前用户?")){
	window.location.href="/myshoppingsys/goodsServlet?flag=logout";
	   }else{
	     return;
	   }
  
   }
   
   
   }
   
   function search() {
  	var tiaojian =   document.getElementById("input_1").value;
  	
 window.location.href="/myshoppingsys/goodsServlet?flag=search&tiaojian="+tiaojian;
  
   }
</script>


</head>
<%
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
				<h1><a href="#this">花房家具--创意抓住你的心</a></h1>
				<input type="text"  id="input_1" />
				<input type="button"  value="搜索" id="input_2" onclick="search()" />
				<a href="javascript:void(0)" onclick="change()"> 当前用户：<font color="red" id = "userNameqiantai"><%=userNameqiantai %></font>|注销</a>
				
				<a href="/myshoppingsys/goodsServlet?flag=userInfozhangdan" class="oh">个人中心</a>
			</div>		
			<div id="nav_left"></div>
			<ul id="nav">
				<li><a href="/myshoppingsys/web/main.jsp">首页</a></li>
				<li><a href="javascript:void(0)">商城</a></li>
				
			</ul>
		
				<div id="res">
					<div id="type">
						<span><font color="red"><a href="/myshoppingsys/goodsServlet?flag=search">全部分类</a></font>：共24条</span>
						<dl>
						<dt>服装装饰：</dt>
						<dd class="red"><font color="red"><a href="/myshoppingsys/goodsServlet?flag=cateSearch&flag_1=服装装饰">全部</a></font></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男装">男装</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女装">女装</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男包">男包</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女包">女包</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=装饰">装饰</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
					</dl>
					<dl>
						<dt>数码家电：</dt>
						<dd class="red"><font color="red"><a href="/myshoppingsys/goodsServlet?flag=cateSearch&flag_1=数码家电">全部</a></font></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=笔记本">笔记本</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=手机">手机</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=电源">电源</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=平板">平板</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=相机">相机</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
					</dl>
					<dl>
						<dt>户外运动：</dt>
						<dd class="red"><font color="red"><a href="/myshoppingsys/goodsServlet?flag=cateSearch&flag_1=户外运动">全部</a></font></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男运动">男运动</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女运动">女运动</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=男鞋">男鞋</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=女鞋">女鞋</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=品牌">品牌</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
					</dl>
					<dl>
						<dt>家居百货：</dt>
						<dd class="red"><font color="red"><a href="/myshoppingsys/goodsServlet?flag=cateSearch&flag_1=家居百货">全部</a></font></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=居家">居家</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=家纺">家纺</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=餐饮">餐饮</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=床用品">床用品</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
					</dl>
					<dl>
						<dt>图书音像：</dt>
						<dd class="red"><font color="red"><a href="/myshoppingsys/goodsServlet?flag=cateSearch&flag_1=图书音像">全部</a></font></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=文学">文学</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=教科书">教科书</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=历史">历史</a></dd>
						<dd><a href="/myshoppingsys/goodsServlet?flag=childCateSearch&flag_=影碟">影碟</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
						<dd><a href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></dd>
					</dl>
					</div>
					
					
					
					
					<ul id="ranking">
						
						<li><a href="/myshoppingsys/goodsServlet?flag=xiaoliang&flag3=xiaoliang"><img src="/myshoppingsys/web/img/litt_2.gif" alt="" /></a></li>
						
						<li><a href="/myshoppingsys/goodsServlet?flag=jiage&flag3=jiage"><img src="/myshoppingsys/web/img/litt_4.gif" alt="" /></a></li>
					</ul>
					
				</div>	
				<div id="hot">
			
					<h2>店铺热卖</h2>
					<dl>
					<%
					DBUtil du = new DBUtil();	
					String rexiaoId="";
					String diyinum="";
					List<Map<String,String>> rexiaoList = (List<Map<String,String>>)request.getAttribute("rexiaoList");
					if(rexiaoList!=null) {
					
					rexiaoId = rexiaoList.get(0).get("GOODSCODE");
					
					diyinum=rexiaoList.get(0).get("SUM(GOODSCODENU)");
					}else {
					request.getRequestDispatcher("../goodsServlet?flag=search").forward(request, response);
					}
					String remai = "select *from SHOPGOODS where ID= '"+rexiaoId+"'";
					List<Map<String,String>> diyiList = du.queryByList(remai);
					String diyigoodsName = diyiList.get(0).get("GOODSNAME");
					String diyiprice = diyiList.get(0).get("PRICE");
					String diyiimg = diyiList.get(0).get("IMG");
					
				
				 %>
						<dt><a href="/myshoppingsys/goodsServlet?goodsId=<%=rexiaoId%>&flag=single" ><img src="<%=path%>/upload/<%=diyiimg %>"  height ="240px" width="230px" /></a></dt>
						<dd><span>￥<%=diyiprice%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						已售：<span><%=diyinum %></span>件
						</dd>
						<dd><a href="/myshoppingsys/goodsServlet?goodsId=<%=rexiaoId%>&flag=single" ><%=diyigoodsName %></a></dd>
					</dl>
				</div>	
		</div>
		<!--//header-->
		<!--contents-->
		<div id="contents">
			<div id="result" >
			<%
			
				
				 PageBean pageBean = (PageBean)request.getAttribute("pageBean");
   		 		 if(pageBean!=null){
   		 		 
   		 		 List<Map<String,String>> goodsList =pageBean.getResList();
    			int rows=pageBean.getRows();    //总记录数
    			int pages=pageBean.getPages();   //总页数
    			int nowPage=pageBean.getNowPage();//当前页
    			
    			 if(goodsList!=null&&goodsList.size()>0){
   		  %>
   		  	  <form action="goodsServlet" name="nextPageForm" method="post">
    	 		<input type="hidden"  name="flag" value="search" />
     			<input  id="nextPage" type="hidden" name="nextPage" /> 
     			<input  type="hidden" name="baseSql" value="<%=pageBean.getBaseSql() %>"  />
    	 		
   			 </form>
   			  <%
					for(int i = 0;i<goodsList.size();i++) {
					String goodsName = goodsList.get(i).get("GOODSNAME");
					String price = goodsList.get(i).get("PRICE");
					String img = goodsList.get(i).get("IMG");
					String discount = goodsList.get(i).get("DISCOUNT");
					
					String pinpai = goodsList.get(i).get("PINPAI");
					String goodsId = goodsList.get(i).get("ID");

 			%>
			
				<dl>
					<dt><a href="/myshoppingsys/goodsServlet?goodsId=<%=goodsId%>&flag=single" ><img src="<%=path%>/upload/<%=img %>"  height ="240px" width="230px" alt="" /></a></dt>
					<dd><a href="../goodsServlet?goodsId=<%=goodsId%>&flag=single" ><%=goodsName %></a></dd>
					<dd>￥<span><%=price %></span></dd>
					<dd class="abs"><%=pinpai%></dd>
				</dl>
				
				
				<%
					}
				 %>
				
			</div>
			<div id="ownerHot">
			<h2>掌柜热卖</h2>
			
			
				<dl>
				
				<%
				
					List<Map<String,String>> paihanList = (List<Map<String,String>>)request.getAttribute("paihanList");
					System.out.println("paihanList-----"+paihanList.size());
					if(paihanList!=null) {
						for(int k = 0;k<paihanList.size();k++) {
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
						
						
					<dt><a href="/myshoppingsys/goodsServlet?goodsId=<%=paihanId%>&flag=single" ><img src="<%=path%>/upload/<%=imgpaihan %>" height ="240px" width="220px" /></a></dt>
						<dd>第<font color="red"><%=k+1 %></font>名&nbsp;&nbsp;&nbsp;&nbsp;<span>￥<%=pricepaihan%></span>&nbsp;&nbsp;&nbsp;&nbsp;
						已售：<span><%=paihannum %></span>件
						</dd>
						<dd><a href="/myshoppingsys/goodsServlet?goodsId=<%=paihanId%>&flag=single" ><%=goodsnamepaihan %></a></dd>
					
					
					
						<%
						}
					
					}
				
				 %>
					
				</dl>
				
				
			</div>
			<div id="page">
			
			 <label style="font-size:12px; color:red">总共<%=rows %>条记录，当前为<%=nowPage %>/<%=pages %>页</label>
               <a href="javascript:void(0)"  onclick="headPage(<%=nowPage%>)" class="next" >首页</a>&nbsp;
                <a href="javascript:void(0)" onclick="upPage(<%=nowPage%>)" class="next" >上一页</a>&nbsp;
                <a href="javascript:void(0)" onclick="nextPage(<%=pages%>,<%=nowPage%>)" class="next">下一页</a>&nbsp;
               <a href="javascript:void(0)" onclick="footPage(<%=nowPage%>,<%=pages%>)" class="next">尾页</a> &nbsp;
				<div id="ap">
				<span>跳到</span>
				<input type="text" name="" id="tiaopage"  class="text"/>
				<span>页</span> 
				<input type="button" value="确定" name=""  class="button" onclick="tiaoye(<%=nowPage%>,<%=pages%>)"/>
				</div>
				
				<% 
				} else {
				%>
			<h1>暂无合法数据</h1>
			
			<%	
				}
			
				} else {
				
			request.getRequestDispatcher("../goodsServlet?flag=search").forward(request, response);
				}
			 %>	
			</div>
			
		</div>	
		<!--//contents-->
		<!--footer-->
		<div id="footer">
			<div id="tel">
				<dl>
					<dt>24小时客服热线</dt>
					<dd ><span>400 8834823</span></dd>
					<dd>截止今日，花房在全国已有实体店123家</dd>
					<dd><img src="img/btn_3.gif" alt="btn" /></dd>
				</dl>
			</div>
			<div id="service">
				<ul id="ser_1">
					<li>
						<a href="#this">关于花房</a>
						<span><a href="#this">公司简介</a></span>
						<span><a href="#this">CEO致辞</a></span>
						<span><a href="#this">体验馆</a></span>
						<span><a href="#this">联系我们</a></span>
						<span><a href="#this">诚聘精英</a></span>
					</li>
					<li>
						<a href="#this">新手指南</a>
						<span><a href="#this">注册新用户</a></span>
						<span><a href="#this">订购家具流程</a></span>
						<span><a href="#this">体验馆购买指导</a></span>
						<span><a href="#this">付款方式</a></span>
						<span><a href="#this">常见问题解答</a></span>	
					</li>
					<li>
						<a href="#this">配送安装</a>
						<span><a href="#this">收货指南</a></span>
						<span><a href="#this">全国体验服务费</a></span>
						<span><a href="#this">维修补件说明</a></span>

					</li>
					<li>
						<a href="#this">售后服务</a>
						<span><a href="#this">退换货说明</a></span>
						<span><a href="#this">如何申请退款</a></span>
						<span><a href="#this">物流配送</a></span>
					</li>
					<li>
						<a href="#this">购物保障</a>
						<span><a href="#this">正品保证</a></span>
						<span><a href="#this">注册协议</a></span>
						<span><a href="#this">隐私保护</a></span>
						<span><a href="#this">免责声明</a></span>
					</li>
				</ul>
			</div>
			<div id="link">
				友情链接： 房屋装修效果图 | 家具视频 | 建材市场 |建筑论坛 | 厦门家装网 | 搜房网 | 宜家家居 | 新浪家														                              具 | 网易家具  |  我的家  | 小资世界</div>
			</div>
			<address>©2010-2012 花房 版权所有 ICP备案证书号：京ICP备08008334号</address>
		
		<!--//footer-->
	</div>
</body>

</html>
