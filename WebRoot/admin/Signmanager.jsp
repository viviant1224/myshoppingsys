<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<style type="text/css">
	#mibao{
		border:#00C solid;}

</style>
<script type="text/javascript" src="/myshoppingsys/admin/js/validate.js"></script>

<script type="text/javascript">
	var a = false;
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
		
		
	
	
	
	function checkpw() {
		var password = document.getElementById("password").value;
		var boolean = validatepassword(password,"checkpw");
		return boolean;
		}
		
	function checkpw2() {
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		if(password!=password2) {
			alert("两次输入密码不一致！")
			return false;
			} else {
				document.getElementById("checkpw2").innerHTML="<font color = 'green'>"+"密码输入一致"+"</font>";
				return true;
				}
		}
		
	function checktel() {
	var tel = document.getElementById("tel").value;
		var boolean = validatetel(tel,"checktel");
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
	
	
	
	function ajaxUserName(){
		var userName = document.getElementById("userName").value;
		xmlHttpReq = createHttpRequest();
		xmlHttpReq.onreadystatechange=rollbackUserName;
		xmlHttpReq.open("post","../HouTaiZhuCe",true);
		xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	 xmlHttpReq.send("userName="+userName+"&"+new Date().getMilliseconds());
	}
	
	
	function rollbackUserName() {
	
		if(xmlHttpReq.readyState==4) {
			if(xmlHttpReq.status==200) {
			info= xmlHttpReq.responseText;
			if(info==2) {
			document.getElementById("checkname").innerHTML="<font color = 'red'>"+"对不起，该用户已注册"+"</font>";
			a = false;
			} else if(info == 1) {
			
			document.getElementById("checkname").innerHTML="<font color = 'green'>"+"用户名合法"+"</font>";
			a =  true;
			}
			}
		}
	}
	function checkcolor() {
		var color = document.getElementById("favcolor").value;
		if(color.trim()=="") {
			alert("请填写喜欢的颜色");
			return false;
		}
		return true;
	}
	function checkfood() {
		var food = document.getElementById("favfood").value;
		if(food.trim()=="") {
			alert("请填写喜欢的食物");
			return false;
		}
		return true;
	}
	function checksub() {
		if(a&&checkpw()&&checkpw2()&&checktel()&&checkfood()&&checkcolor()) {
			return true;
			} else {
			return false;
				}
		}
		

</script>
</head>

<body>
<div id="main">
<form action="/myshoppingsys/UserServlet?flag=houtaizhuce" method="post" onsubmit=" return checksub()">
<table align="center"  cellspacing="0">
	
	<tr height="30px">
    	<td width="150px">姓名：</td>
        <td><input type="text" id="userName" name="userName"   onblur="checkName()"/> </td>
        
        <td colspan="2" width="300px">以下信息为忘记密码时的密保问题</td>
      
    </tr>
    <tr height="30px">
    <td><label  id="checkname"></label></td>
    </tr>

    <tr height="30px">
    	<td>性别：</td>
        <td><input type="radio" name="sex" value="男" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女" />女</td>
        <td colspan="2" rowspan="7">
        <div id="mibao">
        <table align="center">
        <tr height="60px">
        <td>最喜欢的颜色:</td>
        </tr>
         <tr height="60px">
        <td><input type="text" id="favcolor" name="favcolor" /></td>
        </tr>
         <tr height="60px">
        <td>最喜欢食物:</td>
        </tr>
        <tr height="60px">
       <td><input type="text" id="favfood" name="favfood"/></td>
        </table>
        
        </div>
        
        </td>
        
    </tr>
   
 <tr height="30px">
    	<td>密码：</td>
    	
        <td><input type="password" id="password" name="password" onblur="checkpw()"/></td>
        
    </tr>
    
    <tr height="30px">
    <td><label id="checkpw"></label></td>
    </tr>
    
   <tr height="30px">
   
    	<td>确定密码：</td>
        <td><input type="password" id="password2" onblur="checkpw2()"/></td>
        
    </tr>
   <tr height="30px">
   <td><label id="checkpw2"></label></td>
    </tr>
   <tr height="30px">
    	<td>电话：</td>
        <td><input type="text" id="tel" name="tel" onblur="checktel()"/></td>
       
    </tr>
    <tr height="30px">
   <td><label id="checktel"></label></td>
    </tr>
    <tr height="30px">
    	<td></td>
        <td></td>
        <td><input type="submit" value="注册" /></td>
        <td><input type="reset" value="重置" /></td> 
    </tr>
</table>
</form>
</div>
</body>
</html>
