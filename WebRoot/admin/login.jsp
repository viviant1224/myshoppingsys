<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上商城购物后台管理系统</title>
<link href="/myshoppingsys/admin/style/main.css" type="text/css" rel="stylesheet" />
	<script type = "text/javascript">
	
	
		function createHttpRequest() {
			var xmlHttpRequest; 
			if(window.XMLHttpRequest) {
			xmlHttpRequest= new XMLHttpRequest();
			
			} else if(window.ActiveXObject) {
			xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlHttpRequest;
		}
	var xmlHttpReq = null;
	
	
	
	function getInfo(){
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
	
		
		xmlHttpReq = createHttpRequest();
		xmlHttpReq.onreadystatechange=rollbackInfo;
		
		xmlHttpReq.open("post","../houtailogin",true);
		xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	
    	 xmlHttpReq.send("userName="+userName+"&password="+password+"&"+new Date().getMilliseconds());
	}
	
	var a = false;
	function rollbackInfo() {
	
		if(xmlHttpReq.readyState==4) {
			if(xmlHttpReq.status==200) {
			
			info= xmlHttpReq.responseText;
			if(info==1) {
			document.getElementById("info").innerHTML="<font color = 'red'>"+""+"</font>";
			a = true;
			} else if(info==2) {
			
			document.getElementById("info").innerHTML="<font color = 'red'>"+"用户密码错误！"+"</font>";
			a = false;
			} else if(info==3) {
			document.getElementById("info").innerHTML="<font color = 'red'>"+"用户名不存在！"+"</font>";
			a = false;
			}
			}
		}
	}
	
	function receive() {
	
	return a;
	}
	
	 function  findpw(){
	    var my_width=400; //小窗口的宽度和高度
		var my_height=300;
		var left=window.screen.width/2-my_width/2;
		var top=window.screen.height/2-my_height/2;
	    window.open("/myshoppingsys/admin/findfrommibao.jsp?","_blank","left="+left+",top="+top+",height="+my_height+",width="+my_width+",status=no,toolbar=no,menubar=no,location=no");
 
   }
	
	</script>


</head>
<body style="background:#95bee1 url(/myshoppingsys/admin/img/home_bg.gif) repeat-x;">
	<div id="wrap">
		<div id="home">
			<div id="tit3"><img src="/myshoppingsys/admin/img/home_tit.gif" alt="红酒后台管理系统" /></div>
			<div id="main1">
			
			<form action="/myshoppingsys/admin/index_frameset.html" method="post" onsubmit=" return receive()">
				<dl class="dl3">
					<dt>账户：</dt>
					<dd><input type="text" id="userName" class="txt2" /></dd>
				</dl>
				<dl class="dl3">
					<dt>密码：</dt>
					<dd><input type="password" id="password" class="txt2" /></dd>
				</dl>
				<dl class="dl3">
					<dt></dt>
					<dd><label id="info"></label></dd>
					
				</dl>
				
				<div class="btn4"><input type="submit" value="登录" class="btn5" onclick="getInfo()"/>
				
				
				<a href="javascript:void(0)" onclick="findpw()"><font color="red"></font>忘记密码？</a></div>
			</form>
			
			
			</div>
		</div>
	</div>
</body>
</html>