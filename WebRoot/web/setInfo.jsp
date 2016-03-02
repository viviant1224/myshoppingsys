<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.utils.*"%>
<%@ page import="cn.com.shxt.service.*"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改个人资料</title>

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
	 	//第一步：创建异步对象
  function  createXmlHttpRequest(){
	  var xmlHttpReq;
	  if(window.XMLHttpRequest){
		  xmlHttpReq=  new XMLHttpRequest();
	  }else if(window.ActiveXObject){
		  new ActiveXObject("Microsoft.XMLHTTP");
	  }
	return   xmlHttpReq;
  }
  
  var xmlHttpRequest;
  
  function findCity(){
	  
	  //得到省份id
	 var provinceId= document.getElementById("provinceId").value;
	 var provinceName="";
	  //得到所选则的省份或直辖市的name
	 var options= document.getElementById("provinceId").options;
	  for(var i=0;i<options.length;i++){
		  if(options[i].selected){
			  provinceName=options[i].firstChild.nodeValue;
			  
		  }
	  }
	    
	  xmlHttpRequest=createXmlHttpRequest();
	  
	  xmlHttpRequest.onreadystatechange=fintCity_callBackxml;
	  
	  xmlHttpRequest.open("post","findcityServlet",true);
	  xmlHttpRequest.setRequestHeader("content-type","application/x-www-form-urlencoded");
	  xmlHttpRequest.send("provinceId="+provinceId+"&"+Math.random());
	  
	 
	   
  }
  
  //通过xml实现的回调
  function  fintCity_callBackxml(){
	  if(xmlHttpRequest.readyState==4){
		  if(xmlHttpRequest.status==200){
			var selectNode=document.getElementById("cityId");
			var optionsNode=selectNode.childNodes;
			
			//先移除所有select下的option子节点
			for(var i=optionsNode.length-1;i>=0;i--){
				selectNode.removeChild(optionsNode[i]);
			}
			  
			var cityString=  xmlHttpRequest.responseXML;
			 
			  for(var i=0;i<cityString.getElementsByTagName("id").length;i++){
				  //alert(cityString.getElementsByTagName("id")[i].firstChild.nodeValue+cityString.getElementsByTagName("name")[i].firstChild.nodeValue);
				//循环创建option元素节点
					var optionNode=	document.createElement("option");
					optionNode.value=cityString.getElementsByTagName("id")[i].firstChild.nodeValue;
					var cityNameNode=document.createTextNode(cityString.getElementsByTagName("name")[i].firstChild.nodeValue);
					optionNode.appendChild(cityNameNode);
					selectNode.appendChild(optionNode);	
			  }

			}
		  }
		  
	  }
	 

   function findArea(){
	  
	  //得到市id
	 var cityId= document.getElementById("cityId").value;
	 var cityName="";
	  //得到所选则的市name
	 var options= document.getElementById("cityId").options;
	  for(var i=0;i<options.length;i++){
		  if(options[i].selected){
			  cityName=options[i].firstChild.nodeValue;
			  
		  }
	  }
	    
	  xmlHttpRequest=createXmlHttpRequest();
	  
	  xmlHttpRequest.onreadystatechange=fintArea_callBackxml;
	  
	  xmlHttpRequest.open("post","findareaServlet",true);
	  xmlHttpRequest.setRequestHeader("content-type","application/x-www-form-urlencoded");
	  xmlHttpRequest.send("cityId="+cityId+"&"+Math.random());
	  
	 
	   
  }
  
  //通过xml实现的回调
  function  fintArea_callBackxml(){
	  if(xmlHttpRequest.readyState==4){
		  if(xmlHttpRequest.status==200){
			var selectNode=document.getElementById("areaId");
			var optionsNode=selectNode.childNodes;
			
			//先移除所有select下的option子节点
			for(var i=optionsNode.length-1;i>0;i--){
				selectNode.removeChild(optionsNode[i]);
			}
			  
			var areaString=  xmlHttpRequest.responseXML;
			 
			  for(var i=0;i<areaString.getElementsByTagName("id").length;i++){
				
					var optionNode=	document.createElement("option");
					optionNode.value=areaString.getElementsByTagName("id")[i].firstChild.nodeValue;
					var areaNameNode=document.createTextNode(areaString.getElementsByTagName("name")[i].firstChild.nodeValue);
					optionNode.appendChild(areaNameNode);
					selectNode.appendChild(optionNode);	
			  }

			}
		  }
		  
	  }
	  function checkpw() {
		
		var password = document.getElementById("password").value;
		
		if(password=="") {
		document.getElementById("checkpw").innerHTML="<font color = 'green'>"+"密码不能为空"+"</font>";
		return false;
		} else {
			return true;
		}
		}
	function checkpw2() {
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		
		if(password!=password2) {
			document.getElementById("checkpw2").innerHTML="<font color = 'green'>"+"密码输入不一致"+"</font>";
			return false;
			} else {
				document.getElementById("checkpw2").innerHTML="<font color = 'green'>"+"密码输入一致"+"</font>";
				return true;
				}
		}
	
	  
	  function checkPro() {
		
		var provinceId = document.getElementById("provinceId").value;
		
		if(provinceId=="") {
		alert("请输入省份！");
		return false;
		}
		return true;
		}
		
	function checkEmail() {
		
		var email = document.getElementById("Email").value;
		
		var boolean = regIsEmail(email,"checkemail");
		return boolean;
		}
		
  function checkTel() {
		
		var tel = document.getElementById("tel").value;
		var boolean = validatetel(tel,"checkTel");
		return boolean;
		}
	function checksex() {
			var man = document.getElementById("man").checked;
			var women = document.getElementById("woman").checked;
			if(man||women) {
				return true;
				} else {
					alert("请选择性别");
					return false;
					}
			}
			
	function checkInfo() {
	if(checksex()&&checkTel()&&checkEmail()&&checkPro()&&checkpw()&&checkpw2()) {
		return true;
	} else {
		return false;
	}
	
	}
	</script>

</head>
<%
	GoodsService service = new GoodsService();
	UserService uservice = new UserService();

	String userName = (String) application.getAttribute("userNamepw");
	if (userName == null || userName.equals("")) {
		userName = new String(request.getParameter("userName")
				.getBytes("iso-8859-1"), "UTF-8");
	}

	System.out.println("userName----" + userName);
	String sqlpro = "select t.*, t.rowid from PROVINCE t";
	DBUtil du = new DBUtil();
	List<Map<String, String>> proList = service.query(sqlpro);
	if (userName != null) {

		String userSql = "select * from SHOPVIP where USERNAME='"
				+ userName + "'";
		List<Map<String, String>> userList = uservice.query(userSql);
		String tel = userList.get(0).get("TEL");
		String email = userList.get(0).get("EMAIL");
%>

<body>
	<div align="center">资料修改中心</div>
	<form action="/myshoppingsys/UserServlet?flag=setInfo&" method="post"
		onsubmit="return checkInfo()">
		<div id="content" align="center">


			<div>
				<h2 align="left">
					用户名 &nbsp;&nbsp;&nbsp;&nbsp; <font size="3"><%=userName%>
				</h2>
				<input type="hidden" value="<%=userName%>" name="userName" />

			</div>
			<div>
				<h2 align="left">
					密码： &nbsp;&nbsp;&nbsp;&nbsp; <input type="password" id="password"
						name="pw1" onblur="checkpw()"> <label id="checkpw"></label>
			</div>
			<div>
				<h2 align="left">
					确认密码： &nbsp;&nbsp;&nbsp;&nbsp; <input type="password"
						id="password2" name="pw2" onblur="checkpw2()"> <label
						id="checkpw2"></label>
			</div>

			<div i>
				<h2 align="left">
					邮箱 &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="email"
						id="email" value="<%=email%>" onblur="checkEmail()" /> <label
						id="checkemail"></label>

					<div>
						<h2 align="left">
							地址 &nbsp;&nbsp;&nbsp;&nbsp; <select id="provinceId"
								name="provinceId" onchange="findCity()" onblur="checkPro()">
								<option value="">--请选择省份--</option>
								<%
									if (proList != null && proList.size() > 0) {
											for (int i = 0; i < proList.size(); i++) {

												String proid = proList.get(i).get("PROVINCEID");
												String provinceName = proList.get(i).get("PROVINCE");
								%>
								<option value="<%=proid%>"><%=provinceName%></option>
								<%
									}
										}
								%>
							</select> <br /> <select id="cityId" onchange="findArea()" name="cityId"
								onblur="checkCity()">


							</select> <br /> <select name="areaId" id="areaId" onblur="checkArea()">


							</select>
					</div>
					<div>
						<h2 align="left">
							电话 &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="tel"
								id="tel" value="<%=tel%>" onblur="checkTel()" /> <label
								id="checkTel"></label>
					</div>
					<div>
						<h2 align="left">
							性别 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="sex"
								id="man" value="男">男&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="sex" id="woman" value="女">女
					</div>
					<p align="right">
						<input type="submit" value="确认修改">
					</p>
			</div>


		</div>
	</form>
</body>

<%
	} else {
		request.getRequestDispatcher("/myshoppingsys/web/enter.jsp")
				.forward(request, response);

	}
%>



</html>
