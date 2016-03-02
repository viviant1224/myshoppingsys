<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/myshoppingsys/web/js/validate.js"></script>

<script type="text/javascript">
		var a ;
		function  checkName() {
		var userName = document.getElementById("userName").value;
		
		if(userName=="") {
		alert("请填写您的账户名");
		} else {
		confirmname();
		}
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
		function confirmname() {
	
		var userName = document.getElementById("userName").value;
		
		xmlHttpReq = createHttpRequest();
		
		xmlHttpReq.onreadystatechange=Confirmnamerollback;
		
		xmlHttpReq.open("post","/myshoppingsys/Confirmname",true);
		xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	
    	xmlHttpReq.send("userName="+userName+"&"+Math.random());
	}
	
	function Confirmnamerollback() {
	
    if(xmlHttpReq.readyState==4)
    {
       if(xmlHttpReq.status==200)
       {
           //获取到响应对象 
           var info=xmlHttpReq.responseText;
           
           if (info==1) {
           document.getElementById("checkname").innerHTML="<font color = 'red'>"+""+"</font>";
           a = true;
           } else if(info==2) {
           document.getElementById("checkname").innerHTML="<font color = 'red'>"+"用户名不存在"+"</font>";
           a = false;
           }	
       }
    }     		
	}
	function checkin() {
	if(checkName&&a) {
	return true;
	} else{
	return false ;
	}
	
	}
		</script>

  </head>
  
  <body>
  <h4>找回密码</h4>
  
    <div align="center">
    
    <form action="/myshoppingsys/FindPassword" method="post" onsubmit=" return  checkin()">
    <table >
    <tr>
    <td>
    <h2>用户名：<input type="text" id = "userName"  name="userName" onblur="checkName()"  class="txt" /></h2> <label class="txt" id="checkname"></label>
    
    </td>
    </tr>
    
    
    <tr>
    <td><h2><input type="submit" name="findpw" value="1.通过邮件重新改密（推荐）" /></h2></td>
 
    </tr>
  
    </table>
    
  </form>  
   </div>
  </body>
</html>
