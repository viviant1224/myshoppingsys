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
	
	<link rel="stylesheet" href="/myshoppingsys/kingEditor/themes/default/default.css" />
	<link rel="stylesheet" href="/myshoppingsys/kindEditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="/myshoppingsys/kindEditor/kindeditor.js"></script>
	<script charset="utf-8" src="/myshoppingsys/kindEditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/myshoppingsys/kindEditor/plugins/code/prettify.js"></script>
	<link rel="stylesheet" href="styles/detail.css" type="text/css" />
	<link rel="stylesheet" href="styles/skin/skin_0.css" type="text/css" id="cssfile" />
	<link rel="stylesheet" href="styles/thickbox.css" type="text/css" />
	<script src="/myshoppingsys/scripts/jquery-1.3.1.js" type="text/javascript"></script>
	<script src="/myshoppingsys/scripts/use_jqzoom.js" type="text/javascript"></script>
	<script src="/myshoppingsys/scripts/jquery.jqzoom.js" type="text/javascript"></script>
	
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
	
	 //判断对商品是否做出评价
function checkpinjia() {
 var good = document.getElementById("good").checked;
 var normal = document.getElementById("normal").checked;
 var bad = document.getElementById("bad").checked;
 if(good||normal||bad) {
 return true;
 } else {
 	alert("请对商品做出评价！");
 	return false;
 }
 }
 
 
 
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
		
			if(editor1.isEmpty()){
			 alert("内容不能为空!");
			
		     return false;
			} else {
				if(checkpinjia()) {
				return true;
				}  else {
				
				return false;
			}
			}
		}
</script>
</head>
<%
	DBUtil du  = new DBUtil();
		String userNameqiantai = (String)session.getAttribute("userNameqiantai");
   		 		
   		 		if(userNameqiantai==null) {
   		 		userNameqiantai="登录";
   		 		}
	String goodsId = request.getParameter("goodsId");
	String goodsName=new String(request.getParameter("goodsName").getBytes("iso-8859-1"),"UTF-8");
    
	System.out.println("userNameqiantai="+userNameqiantai);
	System.out.println("goodsId="+goodsId);
	System.out.println("goodsName="+goodsName);
	

 %>
   		 		
   		 		


<body>
	<div id="wrap">
		<!--header-->
		<div id="header">
			<div id="top">
				<h1>
					<a href="#this">花房家具--创意抓住你的心</a>
				</h1>
				<form method="post" action="pro_sel.html" name="">
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
					<li><a href="javascript:void(0)">首页</a>
					</li>
					<li><a href="/myshoppingsys/goodsServlet?flag=search">商城</a>
					</li>
				</ul>
			</div>

			
		<div id="main">
			 <form id="myForm" name="example" method="post" action="/myshoppingsys/goodsServlet?flag=pinglun"   onsubmit="return subForm()">
			
			
		<textarea name="content1" cols="100" rows="8" id="content"  style="width:700px;height:200px;visibility:hidden;"></textarea>
		<br/>
		<input type="hidden" name = "goodsId" id = "goodsId" value="<%=goodsId%>"/>
		<input type="hidden" name = "goodsName" id = "goodsName" value="<%=goodsName%>"/>
		<input type="hidden" name = "buyname" id = "buyname" value="<%=userNameqiantai%>"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name = "jibie"  id="good" value="好评" />好评&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name = "jibie" id="normal" value="中评" />中评&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name = "jibie" id="bad" value="差评" />差评&nbsp;&nbsp;&nbsp;&nbsp;<br/>
			
		<p align="right"><input type="submit" name="button" value="提交内容" /> <a name="chat">(提交快捷键: Ctrl + Enter)</a></p>
	</form>	

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
