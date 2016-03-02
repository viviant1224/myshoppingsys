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
<link href="/myshoppingsys/web/css/register.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="/myshoppingsys/web/js/validate.js"></script>

<script type="text/javascript">
//刷新验证码
 function refreshImg(img){
  //alert(img.src);
  img.src=img.src+"?"+Math.random();
 }
	var a ;
	function  checkName() {
		var userName = document.getElementById("userName").value;
		if(userName.trim()=="") {
		
		document.getElementById("checkname").innerHTML="<font color = 'red'>"+"用户名不能为空"+"</font>";
			a = false;
		} else if(!isNaN(userName)){
				
			document.getElementById("checkname").innerHTML="<font color = 'red'>"+"用户名不能全为数字"+"</font>";
			
			a = false;
			} else if(userName.length<2){
				document.getElementById("checkname").innerHTML="<font color = 'red'>"+"字符长度不得小于2"+"</font>";
				a = false;
				
				
				} else {
				ajaxUserName();
					}
		}
		
	//验证是否输入合法性
	function checkpw() {
		
		var password = document.getElementById("password").value;
		var boolean = validatepassword(password,"checkpw");
		return boolean;
		}
		//验证是否输入合法性
	function checkpw2() {
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		
		if(password!=password2) {
			alert("两次输入密码不一致！");
			return false;
			} else {
				document.getElementById("checkpw2").innerHTML="<font color = 'green'>"+"密码输入一致"+"</font>";
				return true;
				}
		}
		//验证是否输入合法性
	function checktel() {
		
		var tel = document.getElementById("tel").value;
		var boolean = validatetel(tel,"checktel");
		return boolean;
		}
	//验证是否输入合法性
	function checkEmail() {
		
		var email = document.getElementById("Email").value;
		
		var boolean = regIsEmail(email,"checkemail");
		return boolean;
		}
	
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
	
	
	//验证是否输入名字合法性
	function ajaxUserName(){
		var userName = document.getElementById("userName").value;
		
	
		
		xmlHttpReq = createHttpRequest();
		xmlHttpReq.onreadystatechange=rollbackUserName;
		
		xmlHttpReq.open("post","../QianTaiZhuCe",true);
		xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	
    	 xmlHttpReq.send("userName="+userName+"&"+new Date().getMilliseconds());
	}
	
	
	function rollbackUserName() {
		if(xmlHttpReq.readyState==4) {
			if(xmlHttpReq.status==200) {
			
			info= xmlHttpReq.responseText;
			
			if(info==3||info==4) {
			document.getElementById("checkname").innerHTML="<font color = 'red'>"+"对不起，该用户已注册"+"</font>";
			a = false;
			} else if(info == 2||info==1) {
			
			document.getElementById("checkname").innerHTML="<font color = 'green'>"+"用户名合法"+"</font>";
			a =  true;
			}
			}
		}
	}
	function checkCode() {
	var validateCode = document.getElementById("validateCode").value;
		if(validateCode=="") {
		alert("验证码不能为空");
		return false;
		}  else {
		return true;
		}
	
	}
	
	function ajaxValicateCode(){
		var validateCode = document.getElementById("validateCode").value;
		
		xmlHttpReq = createHttpRequest();
		xmlHttpReq.onreadystatechange=rollbackValicateCode;
		
		xmlHttpReq.open("post","../QianTaiZhuCe",true);
		xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	
    	 xmlHttpReq.send("validateCode="+validateCode+"&"+new Date().getMilliseconds());
	}
	
	var b;
	function rollbackValicateCode() {
	
		if(xmlHttpReq.readyState==4) {
			if(xmlHttpReq.status==200) {
			
			info= xmlHttpReq.responseText;
			if(info==3||info==1) {
			document.getElementById("checkValidateCode").innerHTML="<font color = 'red'>"+""+"</font>";
			b =  true;
			} else if(info==4||info==2) {
			
			document.getElementById("checkValidateCode").innerHTML="<font color = 'red'>"+"验证码错误"+"</font>";
			b =  false;
			}
			
			}
		}
	}
	
	//验证所有
	function checksub() {
		if(a&&checkpw()&&checkpw2()&&checktel()&&checkEmail()&&checkCode()&&b) {
			return true;
			} else {
				return false;
				}
		
		}

</script>
</head>
<body>
	<!--wrap-->
	<div id="wrap">
		<!--top-->
		<div id="header">
			<h1>
				<img src="images/h1.jpg" alt="Gopile" />
			</h1>
			<div id="welcome">您好，欢迎来到小威少威网上购物商城！</div>
		</div>
		<!--content-->
		<div id="content">
			<div id="ttl">注册账号</div>
			<form action="../UserServlet?flag=register" method="post"
				onsubmit=" return checksub()" />
			<div id="size">
				<p>用户名</p>
				<input type="text" id="userName" name="userName"
					onblur="checkName()" class="txt" /> <label class="txt"
					id="checkname"></label>
			</div>
			<div id="size">
				<p>密码</p>
				<input type="password" id="password" name="password"
					onblur="checkpw()" class="txt" /><label id="checkpw"></label>
			</div>
			<div id="size">
				<p>确认密码</p>
				<input type="password" id="password2" onblur="checkpw2()"
					class="txt" /><label id="checkpw2"></label>
			</div>
			<div id="size">
				<p>邮箱</p>
				<input type="text" id="Email" name="Email" onblur="checkEmail()"
					class="txt" /><label id="checkemail"></label>
			</div>
			<div id="size">
				<p>电话</p>
				<input type="text" id="tel" name="tel" onblur="checktel()"
					class="txt" /><label id="checktel"></label>
			</div>
			<div id="size">
				<p>性别</p>
				<font size="+2"> <input type="radio" value="男" name="sex"
					checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="radio" value="女" name="sex" />女<br />
				</font>
			</div>

			<div id="size">
				<p>验证码</p>
				<input type="text" id="validateCode" onblur="ajaxValicateCode()"
					class="txt1" />
				<dl>
					<dt>
						<img src="/myshoppingsys/ValidateImage" id="imgId" alt="看不清,换一张"
							title="看不清,换一张" style="cursor:hand" onclick="refreshImg(this)" /><label
							id="checkValidateCode"></label>
					</dt>
					<dd>
						<a href="javascript:void(0)"
							onclick="refreshImg(document.getElementById('imgId'))">看不清,换一张</a>
					</dd>
				</dl>
			</div>
			<div id="size1">
				<input type="submit" value="同意用户协议并注册" class="btn" />
				<p>
					<a href="#">查看用户协议</a>
				</p>
			</div>
			</form>
		</div>
		<!--//content-->
		<!--ads-->
		<div id="ads"></div>
		<!--//ads-->
		<!--bottom-->
		<div id="bottom">
			<p>四海兴唐锦绣2黄威威制作</p>
			<p>联系电话：18686672327</p>
			<p>Copyright 2010-2013 Vanvl.com All Rights京ICP证100557号</p>
		</div>

	</div>
	<!--//wrap-->
</body>
</html>
