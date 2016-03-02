<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	System.out.println("path:"+path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加商品</title>
</head>
<script language="javascript" type="text/javascript"
	src="/myshoppingsys/admin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/myshoppingsys/admin/js/upload.js"> </script>
<script src="/myshoppingsys/admin/js/jquery-1.8.3.js"
	type="text/javascript"></script>
<script type="text/javascript" src="/myshoppingsys/admin/js/validate.js"></script>

<style type="text/css">
#div1 {
	margin-left: 150px;
	margin-top: 40px;
	margin-right: 150px;
	padding-top: 20px;
	padding-bottom: 20px;
}

table tr {bordercolor ="#0066FF";
	
}
</style>

<script type="text/javascript">
//头像预览
$(function(){
  $("input[type='file']").change(function(evt){
      var files = evt.target.files; 

      for (var i = 0, f; f = files[i]; i++) {

        if (!f.type.match('image.*')) {
          continue;
        }
        var reader = new FileReader();
        reader.onload = (function(theFile) {
          return function(e) {                                
           $("#list img").attr("src",e.target.result);  //预览图片的位置                 
          };
        })(f);
        reader.readAsDataURL(f);
      }
  });
})


//上传文件格式的验证
function uploadcheck(){
    		//取得file里面的值
    		var path = document.getElementById("myUserPhoto").value;
    		//alert(path);
    		if(!chk_ext(path)){
    			alert("文件上传格式不匹配");
    			return false;
    		}
    	}
    	
    	
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
	  
	  function findChild(){
	  
	
	 var categoryName="";
	 
	 var options= document.getElementById("category").options;
	  for(var i=0;i<options.length;i++){
		  if(options[i].selected){
			  categoryName=options[i].firstChild.nodeValue;
			  
		  }
	  }
	    
	  xmlHttpRequest=createXmlHttpRequest();
	  
	  xmlHttpRequest.onreadystatechange=fintChildcallBackxml;
	  
	  xmlHttpRequest.open("post","findchildServlet",true);
	  xmlHttpRequest.setRequestHeader("content-type","application/x-www-form-urlencoded");
	  xmlHttpRequest.send("categoryName="+categoryName+"&"+Math.random());
	  
	 
	   
  }
  
  //通过xml实现的回调
  function  fintChildcallBackxml(){
	  if(xmlHttpRequest.readyState==4){
		  if(xmlHttpRequest.status==200){
		  
			var selectNode=document.getElementById("childId");
			
			var optionsNode=selectNode.childNodes;
			
			//先移除所有select下的option子节点
			for(var i=optionsNode.length-1;i>0;i--){
				selectNode.removeChild(optionsNode[i]);
			}
			 
			var childString=  xmlHttpRequest.responseXML;
			
			//alert(childString.getElementsByTagName("name")[0].firstChild.nodeValue);
			  for(var i=0;i<childString.getElementsByTagName("name").length;i++){
					var optionNode=	document.createElement("option");
					var childNameNode=document.createTextNode(childString.getElementsByTagName("name")[i].firstChild.nodeValue);
					optionNode.appendChild(childNameNode);
					selectNode.appendChild(optionNode);	
			  }

			}
		  }
		  
	  }
	  
	  
	//校验  
	  function  checkName() {
		var goodsName = document.getElementById("goodsName").value;
		var boolean = validateGoodsName(goodsName);
		return boolean;
		}
		
		 function  checkDiscount() {
		var discount = document.getElementById("discount").value;
			if(discount<0) {
				alert("折扣不合法(0-10折之间)")
				return false;
				} else if(discount>10) {
					alert("折扣不合法(0-10折之间)")
					return false;
					}  else {
						return true;
						}
			
		}
		  function  checkCategory() {
		var category = document.getElementById("category").value;
	
					if(category.trim()=="") {
				alert("类别不能为空");
				return false;
				} else {
					return true;
					}
		}
		  function  checkUpdate_() {
		var update_ = document.getElementById("update_").value;
		var boolean = validateUpdate_(update_);
		return boolean;
		}
		  function  checkFirstPrice() {
		var firstPrice = document.getElementById("firstPrice").value;
		
			if(firstPrice=="") {
				alert("进价不能为空");
				return false;
				} else if(isNaN(firstPrice)){
					alert("进价只能为数字");
				return false;
					
					} else if(firstPrice<=0) {
						
						alert("进价不合法");
				return false;
						} else {
							return true;
							}
			
		}
		  function  checkPrice() {
		var price = document.getElementById("price").value;
			if(price.trim=="") {
				alert("售价不能为空");
				return false;
				} else if(isNaN(price)){
					alert("售价只能为数字");
				return false;
					
					} else if(price<=0) {
						
						alert("售价不合法");
				return false;
						} else {
						return true;
							}
			
		}
		
		 function  checkNum() {
		var num = document.getElementById("num").value;
			if(num=="") {
				alert("件数不能为空");
				return false;
				} else {
				
			var regu = "^[0-9]+$";
			var re = new RegExp(regu);
			if (num.search(re) != -1) {
			if(num>0) {
			return true;
			} else {
			alert("件数输入格式有误");
				return false;
			}
				
			} else {
			alert("件数输入格式有误");
				return false;
			}
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
		
		
		function checkChild() {
		var child = document.getElementById("childId").value;
		if(child.trim()=="") {
		alert("请输入类别！");
		return  false;
		} 
		return true;
		}
		
		function checkSub() {
			if(checkNum()&&checkDiscount()&&checkPrice()&&checkFirstPrice()&&checkPro()&&checkUpdate_()&&checkChild()&&checkName()) {
			
			return true;
			} else {
			return false;
			}
		}

</script>






<body>

	<form action="/myshoppingsys/AddGoodsServlet" method="post"
		enctype="multipart/form-data" onsubmit=" return checkSub()">

		<div align="center" id="div1">

			<table align="center" bordercolor="#0099FF" border="1" id="table"
				cellspacing="0px">
				<font color="#0000CC">注意：<font color="#FF0000">*</font>号项为必填项</font>
				<tr>
					<td>商品名：</td>
					<td><input type="text" id="goodsName" name="goodsName"
						onblur="checkName()" /><font color="#FF0000">*</font>
					</td>
					<td>折扣：</td>
					<td><input type="text" id="discount" name="discount"
						onblur="checkDiscount()" />
					</td>
					<td>品牌：</td>
					<td><input type="text" id="pinpai" name="pinpai" />
					</td>

				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>类别：</td>

					<td><select id="category" name="category"
						onchange="findChild()" onblur="checkCategory()">

							<option value="服装装饰" selected="selected">服装装饰</option>
							<option value="数码家电">数码家电</option>
							<option value="户外运动">户外运动</option>
							<option value="家居百货">家居百货</option>
							<option value="图书音像">图书音像</option>


					</select> <select id="childId" onchange="findChilid()" name="childId"
						onblur="checkChild()">

					</select> <font color="#FF0000">*</font></td>

					<td>进货日期：</td>
					<td><input class="Wdate" type="text" name="update_"
						id="update_" onClick="WdatePicker()" onblur="checkUpdate_()">
						<font color="#FF0000">*</font>
					</td>
					<td>颜色：</td>
					<td><input type="text" id="color" name="color" />
					</td>

				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>进价：</td>
					<td><input type="text" id="firstPrice" name="firstPrice"
						onblur="checkFirstPrice()" />元<font color="#FF0000">*</font>
					</td>
					<td>产地：</td>
					<td>
						<div>
							<table>
								<tr>
									<td>省：</td>
									<td><select id="provinceId" name="provinceId"
										onchange="findCity()" onblur="checkPro()">
											<option value="">--请选择省份--</option>
											<%
												List<Map<String, String>> provinceList = (List<Map<String, String>>) request
														.getAttribute("provinceList");
												if (provinceList != null && provinceList.size() > 0) {
													for (int i = 0; i < provinceList.size(); i++) {

														String proid = provinceList.get(i).get("PROVINCEID");
														String provinceName = provinceList.get(i).get("PROVINCE");
											%>
											<option value="<%=proid%>"><%=provinceName%></option>
											<%
												}
												}
											%>
									</select></td>
								</tr>

								<tr>
									<td>市：</td>
									<td><select id="cityId" onchange="findArea()"
										name="cityId" onblur="checkCity()">


									</select></td>
								</tr>
								<tr>
									<td>县区：</td>
									<td><select name="areaId" id="areaId" onblur="checkArea()">


									</select><font color="#FF0000">*</font>
									</td>
								</tr>


							</table>

						</div></td>
					<td rowspan="2">规格、参数：</td>
					<td rowspan="2"><textarea rows="4" cols="16" id="guige"
							name="guige"></textarea>
					</td>

				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>售价：</td>
					<td><input type="text" id="price" name="price"
						onblur="checkPrice()" />元<font color="#FF0000">*</font>
					</td>
					<td>入库件数：</td>
					<td><input type="text" id="num" name="num" onblur="checkNum()" />件<font
						color="#FF0000">*</font>
					</td>


				</tr>
				<tr></tr>
				<tr></tr>

				<tr>
					<td>图片：</td>
					<td colspan="2"><div id="list">
							<img width="240px;" height="160px;"
								src="/myshoppingsys/admin/images/no_photo.gif">
						</div>
					</td>


					<td>商品介绍：</td>
					<td colspan="2"><textarea rows="6" cols="30" id="info"
							name="info"> 请在填写商品介绍 </textarea>
					</td>

				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td></td>
					<td rowspan="2"><input name="img" type="file" id="myUserPhoto"
						onchange="uploadcheck()" value="预览" />
					</td>

					<td></td>
					<td><input type="submit" value="入库" />
					</td>
					<td><input type="reset" value="重置" />
					</td>

				</tr>

			</table>
		</div>

	</form>






</body>
</html>
