<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>小威少威网站后台管理系统</title>
<link href="/myshoppingsys/admin/style/main.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
	function houtui() {
	
	window.parent.history.back();
	
	}
	function qianjin() {
	
	window.parent.history.forward();
	
	}
	function showDate() {
		
		var date = new Date();
		var year  = date.getFullYear();
		var month = date.getMonth() + 1;
		
		var day = date.getDate();
		
		var hours = date.getHours();
		var seconds = date.getSeconds();
		var minutes = date.getMinutes();
		
		var time = year + "-" + month + "-" + day + " " + hours + ":" + minutes+ ":" + seconds;
			
		document.getElementById("time").innerHTML = time;
		
	}

	window.setInterval("showDate()", 1000);
</script>
</head>

<%
	String userName = (String)session.getAttribute("userName");

 %>
<body>
	<!-- wrap -->
	<div id="wrap">
		<div id="header">
			<div id="top">
				<div class="logo">
					<h1>
						<img src="/myshoppingsys/admin/img/logo_txt.gif" alt="红酒公司后台管理系统" />
					</h1>
					<div class="bg"></div>
					<ul class="nav">
						<li>当前用户<font color="red"><%=userName %></font></li>
						<li class="li1"><a href="/myshoppingsys/admin/changeManagerInfo.jsp" target="iframe">修改资料</a>
						</li>
						<li class="li2"><a href="../UserServlet?flag=loginout" target="_parent">安全退出</a>
						</li>
					</ul>
				</div>
				<div class="link">
					<ul class="nav1">
						<li><a href="/myshoppingsys/admin/zhubankuai.jsp" target="iframe">首页</a>
						</li>
						<li class="li3"><a href="/myshoppingsys/admin/Signmanager.jsp" target="iframe">后台注册</a>
						</li>
						<li class="li4"><a href="javascript:void(0)" onclick="houtui()">后退</a>
						</li>
						<li class="li5"><a href="javascript:void(0)" onclick="qianjin()">前进</a>
						</li>
					</ul>
					<div class="time">系统时间：<label id="time"></label></div>
				</div>
			</div>
			<div id="top1">
				<div class="tit"></div>
				<div class="tit1"></div>
			</div>
		</div>
	</div>
	<!--// wrap -->
</body>
</html>
