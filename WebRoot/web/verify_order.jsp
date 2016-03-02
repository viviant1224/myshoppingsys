<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.service.UserService"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="/myshoppingsys/web/css/verify_order.css" rel="stylesheet"
	type="text/css" />
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
  
  //获取市
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
			for(var i=optionsNode.length-1;i>0;i--){
				selectNode.removeChild(optionsNode[i]);
			}
			  
			var cityString=  xmlHttpRequest.responseXML;
			 //alert(cityString.getElementsByTagName("id")[0].firstChild.nodeValue);
			 //alert(cityString.getElementsByTagName("id").length);
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
	 
 
  //通过json实现的回调
  function  fintCity_callBack(){
	   // alert(xmlHttpRequest.readyState+"--"+xmlHttpRequest.status);
	  if(xmlHttpRequest.readyState==4){
		  if(xmlHttpRequest.status==200){
			var selectNode=document.getElementById("cityId");
			var optionsNode=selectNode.childNodes;
			//先移除所有select下的option子节点
			for(var i=optionsNode.length-1;i>0;i--){
				selectNode.removeChild(optionsNode[i]);
			}
			
			
			var cityString=  xmlHttpRequest.responseText;
			//通过eval（）将json格式的字符串解析成对象
			var jsonArrayObj=eval("("+cityString +")");
		
			for(var i=0;i<jsonArrayObj.length;i++){
				
			//alert("CITYID:"+jsonArrayObj[i].CITYID+" city:"+jsonArrayObj[i].CITY);
				
			//循环创建option元素节点
			var optionNode=	document.createElement("option");
			optionNode.value=jsonArrayObj[i].CITYID;
			
			var cityNameNode=document.createTextNode(jsonArrayObj[i].CITY);
			optionNode.appendChild(cityNameNode);
			
			selectNode.appendChild(optionNode);	
			 
			}
		  }
		  
	  }
	 
  }
  //获取地区
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
	  
	  //验证是否选择省份
	  function checkPro() {
		
		var provinceId = document.getElementById("provinceId").value;
		
		if(provinceId.trim()=="") {
		alert("请输入省份！");
		return false;
		}
		return true;
		}
		
		//验证电话
  function checkTel() {
		
		var tel = document.getElementById("tel").value;
		var boolean = validatetel(tel,"checkTel");
		return boolean;
		}
		
		
		//验证邮编
	function checkZipcode() {
	alert("99999");
	var zipcode = document.getElementById("zipcode").value;
	
	var boolean = validateZipcode(zipcode,"checkZipcode");
	return boolean;
	}
		//验证姓名
  function checkName() {
  var name = document.getElementById("userName").value;
  if(name.trim()=="") {
  document.getElementById("checkName").innerHTML="<font color = 'red'>"+"收货人不能为空！"+"</font>";
  return false;
  }
  document.getElementById("checkName").innerHTML="<font color = 'red'>"+""+"</font>";
  return true;
  }
  //验证住址
    function checkAdd() {
  	var address = document.getElementById("address").value;
  if(address.trim()=="") {
  alert("收货地址不能为空！");
  return false;
  }
  return true;
  }
  
  
  
  //验证所有信息
  function confirmInfo() {
  if(checkAdd()&&checkName()&&checkTel()&&checkPro()) {
  return true;
  } else {
  alert("请填完整收货信息！");
  return false;
  }
  }

//选择付款方式
function confirmfukuan() {
 var zaixian = document.getElementById("zaixian").checked;
 var huodaofukuan = document.getElementById("huodaofukuan").checked;
 if(zaixian||huodaofukuan) {
 
 return true;
 } else {
 	alert("请选择付款方式！");
 	return false;
 }
}
//验证所有的校验
function checkiswangzheng() {

if(confirmInfo()&&confirmfukuan()) {

return true;
} else {
return false;
}
 }
  </script>
</head>


<body>

	<%
		String loName = (String) session.getAttribute("userNameqiantai");
		UserService service = new UserService();
		if (loName != null) {
			String user = "select * from SHOPVIP where USERNAME='" + loName
					+ "'";
			List<Map<String, String>> userList = service.query(user);
			String userName = userList.get(0).get("USERNAME");
			String tel = userList.get(0).get("TEL");
			String email = userList.get(0).get("EMAIL");
			String address = userList.get(0).get("ADDRESS");
			System.out.println("userName------------" + userName);
			if (email == null) {
				email = "";
			}
	%>
	<!--wrap-->
	<div id="wrap">
		<!--top-->
		<form
			action="/myshoppingsys/goodsServlet?flag=tijiaodindan&loName=<%=loName%>"
			method="post" onsubmit=" return checkiswangzheng()" />
		<div id="header">
			<h1>
				<img src="images/h1.jpg" alt="Gopile" />
			</h1>
			<div id="welcome">
				<font color="red"><%=loName%></font>您好，欢迎来到小威少威网上商城！
			</div>
			<div id="phoneno">400-600-4008</div>

		</div>
		<!--//top-->
		<!--path-->
		<div id="path">
			<div class="path1">1、我的购物车</div>
			<div class="path2">2、确认订单信息</div>
			<div class="path3">3、成功提交订单</div>
		</div>
		<!--//path-->
		<!--content-->
		<div id="content">
			<p>请确认以下信息，然后提交订单</p>
			<!--content----board1-->
			<div id="board1">

				<p>
					<span>收货人信息</span>
				</p>
				<div id="size">
					<P>收货人：</P>
					<input type="text" id="userName" name="userName"
						value="<%=userName%>" class="text1" onblur="checkName()" /> <label
						id="checkName"></label>
				</div>
				<div id="size">
					<p>地区：</p>

					<select id="provinceId" class="select1" name="provinceId"
						onchange="findCity()" onblur="checkPro()">
						<option value="">--请选择省份--</option>
						<%
							List<Map<String, String>> provinceList = (List<Map<String, String>>) request
										.getAttribute("provinceList");
								if (provinceList != null && provinceList.size() > 0) {
									for (int i = 0; i < provinceList.size(); i++) {

										String proid = provinceList.get(i).get("PROVINCEID");
										String provinceName = provinceList.get(i).get(
												"PROVINCE");
						%>
						<option value="<%=proid%>"><%=provinceName%></option>
						<%
							}
								}
						%>
					</select> <select id="cityId" onchange="findArea()" name="cityId"
						onblur="checkCity()">


					</select> <select name="areaId" id="areaId" onblur="checkArea()">


					</select>
				</div>
				<div id="size">
					<p>街道地址：</p>
					<input type="text" id="address" name="address"
						value="<%=address%>" class="text2" onblur="checkAdd()" /> <label
						id="checkAdd"></label>
				</div>
				<br />
				<div id="size">
					<p>邮编：</p>
					<input type="text" id="zipcode" name="zipcode" value="<%=email%>"
						class="text1" onblur="checkZipcode()" /> <label id="checkZipcode"></label>
				</div>
				<div id="size">
					<p>手机：</p>
					<input type="text" id="tel" name="tel" value="<%=tel%>"
						class="text1" onblur="checkTel()" /> <label id="checkTel"></label>

				</div>
				<div id="btn1">
					<input type="button" class="btn" value="确认收货人信息"
						onclick="confirmInfo()" />
				</div>

			</div>
			<!--//content----board1-->
			<!--content----board2-->

			<div id="board2">
				<p>支付方式：</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" value="在线支付" name="zhifu" id="zaixian" />在线支付&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" value="货到付款" name="zhifu" id="huodaofukuan" />货到付款&nbsp;&nbsp;&nbsp;&nbsp;

			</div>
			<div id="board2">
				<p>商品清单：</p>
				<!--content----board2----package1-->
				<div id="package">
					<p>包裹：预计3天后送达</p>
					<div id="header">
						<div class="head1">商品名称</div>
						<div class="head2">价格</div>
						<div class="head2">数量</div>
						<div class="head3">小计</div>
					</div>


					<%
						double sum = 0;
							List<Map<String, String>> gouwuList = (List<Map<String, String>>) session
									.getAttribute("gouwuList");
							if (gouwuList.size() != 0 && gouwuList != null) {
								for (int i = 0; i < gouwuList.size(); i++) {
									String goodsName = gouwuList.get(i).get("GOODSNAME");
									String num = gouwuList.get(i).get("NUM");
									String goodsId = gouwuList.get(i).get("GOODSID");

									String price = gouwuList.get(i).get("PRICE");
									String discount = gouwuList.get(i).get("DISCOUNT");
									if (discount.equals("10")) {
										discount = "无";
									}
									String img = gouwuList.get(i).get("IMG");

									double onePrice = Integer.parseInt(num)
											* Double.parseDouble(price);
									sum = sum + onePrice;

									if (img == null) {
										img = "2013081615352577.jpg";
									}
									System.out.println("img----------" + img);
					%>
					<div id="prod1">
						<div class="name">
							<a
								href="/myshoppingsys/goodsServlet?goodsId=<%=goodsId%>&flag=single"><img
								src="<%=path%>/upload/<%=img%>" width="50px" height="60px"
								alt="图片" />
							</a><span><%=goodsName%></span>
						</div>
						<div class="price">
							￥<%=price%><font color="red">折扣：<%=discount%></font>
						</div>
						<div class="price"><%=num%></div>
						<div class="amount">
							￥<%=onePrice%></div>
					</div>


					<%
						}
							} else {
					%>
					<h1>暂无数据</h1>
					<%
						}
					%>

				</div>



				<div id="pay">
					需支付总金额：<span>￥<%=sum%></span>
				</div>
				<!--//content----board2----package1-->
			</div>
			<!--//content----board2-->
			<div id="btn2">
				<input type="submit" class="btn" value="确认提交信息" />
			</div>

		</div>

		<!--//content-->
	</div>
	</form>
	<!--//wrap-->

	<%
		} else {
	%>
	<h1>页面已过期，请重新登录</h1>
	<%
		}
	%>

</body>
</html>
