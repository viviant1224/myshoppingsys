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
<title>index</title>
<link href="/myshoppingsys/web/css/enter.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">




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
	//校验登录合法性
	function checkInfo() {
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		
		xmlHttpReq = createHttpRequest();
		xmlHttpReq.onreadystatechange=checkInforollback;
		
		xmlHttpReq.open("post","/myshoppingsys/CheckUserInfo",true);
		xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	
    	 xmlHttpReq.send("userName="+userName+"&password="+password+"&"+Math.random());
	
	
	}
	
	var a = false;
	
	function checkInforollback() {
	
    if(xmlHttpReq.readyState==4)
    {
       if(xmlHttpReq.status==200)
       {
           //获取到响应对象 
           var info=xmlHttpReq.responseText;
           
           if(info==1) {
           
           
           document.getElementById("checkInfo").innerHTML="<font color = 'red'>"+""+"</font>";
        
           a =  true;
           } else if(info==2) {
           document.getElementById("checkInfo").innerHTML="<font color = 'red'>"+"密码输入错误！"+"</font>";
         	a = false;
           } else if(info==3) {
           
          
          document.getElementById("checkInfo").innerHTML="<font color = 'red'>"+"该用户不存在！"+"</font>";
          a = false;
           }
        	
        	
       }
    }     		
	}
	
	function isTrue() {
		return a;
	
	}
	function zhuce() {
	
	window.location.href="/myshoppingsys/web/register.jsp";
	
	}

</script>

</head>
<body align="center">
	<!--wrap-->
	<div id="wrap">
		<!--top-->

		<!--//top-->
		<!--content-->
		<div id="enter">
			<div id="pace">
				<div id="logo">
					<img src="/myshoppingsys/web/images/h1.jpg" alt="logo" />
				</div>
				<form action="/myshoppingsys/web/commonMessage.jsp" method="post"
					onsubmit="return isTrue()">
					<div id="name">
						<p>用户名：</p>
						<input type="text" id="userName" value="请输入用户名" class="txt" />
					</div>
					<div id="psw">
						<p>密 码：</p>
						<input type="password" id="password" class="txt" /> <span><a
							href="/myshoppingsys/web/FindPassword.jsp">忘记密码</a>
						</span><br /> <label id="checkInfo"></label>

					</div>

					<div id="btn">
						<input type="submit" value="登录" class="b1" onclick="checkInfo()" />
						<input type="button" " value="注册" class="b2" onclick="zhuce()" />
					</div>
				</form>
			</div>
		</div>
		<!--//content-->
		<!--ads-->
		<div id="ads"></div>
		<!--//ads-->
		<!--bottom-->
		<div id="bottom">
			<p>四海兴唐股份有限公司</p>
			<p>联系电话：0000-00000000</p>
			<p>Copyright 2010-2013 Vanvl.com All Rights京ICP证100557号</p>
		</div>

	</div>
	<!--//wrap-->
</body>
</html>
