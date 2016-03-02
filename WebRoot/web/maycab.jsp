<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.utils.DBUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="/myshoppingsys/web/css/mycab.css" rel="stylesheet" type="text/css" />
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
		
		
		function getNum(num,goodsId_){
		var goodsId = document.getElementById(goodsId_).value;
		
		var loName = document.getElementById("loName").firstChild.nodeValue;
		
		
		xmlHttpReq = createHttpRequest();
		xmlHttpReq.onreadystatechange=rollbackNum1;
		
		xmlHttpReq.open("post","/myshoppingsys/DianDanNum",true);
		xmlHttpReq.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	
    	 xmlHttpReq.send("num="+num+"&goodsId="+goodsId+"&loName="+loName+"&"+Math.random());
	}
	function rollbackNum1() {
		if(xmlHttpReq.readyState==4) {
			if(xmlHttpReq.status==200) {
			
			var info= xmlHttpReq.responseXML;
   			
			
			}
		}
	}
	
		
		
		
		
		
			function add(num_,price_,goodsId_,firNum_) {
			var firstNum = document.getElementById(firNum_).value;//原数量
			
			
			 	var shengyu = document.getElementById("shengyu").value;//库存数量
				var num = document.getElementById(num_).firstChild.nodeValue;//要购买的数量
				var price = document.getElementById(price_).firstChild.nodeValue;//单价
				var sum = document.getElementById("sum").firstChild.nodeValue;//总价格
				
				
				var num = parseInt(num)+1;
				
				if(num>shengyu) {
				alert("超出库存范围");
				document.getElementById(num_).innerHTML=shengyu;
				} else {
				sum = parseInt(sum)+parseInt(price);
				document.getElementById("sum").innerHTML=sum;
				 document.getElementById(num_).innerHTML=num;	
				getNum(1,goodsId_);
				}	
				
			}
			
			
			function jian(num_,price_,goodsId_,firNum_) {
			var firstNum = document.getElementById(firNum_).value;//原购物数量
			var num = document.getElementById(num_).firstChild.nodeValue;
			var price = document.getElementById(price_).firstChild.nodeValue;
			var sum = document.getElementById("sum").firstChild.nodeValue;
				
				num--;
				
				if(num==1||num==0) {
				alert("已经是最少数量，不能再精简！");
				document.getElementById(num_).innerHTML=1;
				return;
				} else {
				sum = parseInt(sum)-parseInt(price);
				document.getElementById("sum").innerHTML=sum;
				document.getElementById(num_).innerHTML=num;
				getNum(-1,goodsId_);
				}
				 
				
			}
		
		
		

		
			
			
		
</script>
</head>
<%
	String loName = (String)request.getAttribute("loName");
        if(loName==null) {
        
        loName="-";
        }
         
      
 %>

<body>
<!--wrap-->
<div id="wrap">
	<!--top-->
	<div id="header">
    	<h1><img src="images/h1.jpg" alt="Gopile" /></h1>
        <div id="welcome"><font color="red" id="loName"><%=loName %></font>您好，欢迎来到小威少威网购物商城！</div>
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
    	<div id="header">
        	<div class="head1">商品名称</div>
            <div class="head2">价格(单价/元)</div>
            <div class="head2">数量</div>
            <div class="head2">操作</div>
        </div>
        
        
        
        
        <%
        double sum = 0;
        DBUtil du = new DBUtil();
        
        System.out.println("nnnnnnnnn"+loName);
       
		List<Map<String,String>> gouwuList = (List<Map<String,String>>)session.getAttribute("gouwuList");
		System.out.println("gouwuList___"+gouwuList.size());
		if(gouwuList.size()!=0&&gouwuList!=null) {
		
		int[] arr = new int [gouwuList.size()];
		for(int i =0;i<arr.length;i++) {
		arr[i]=i;
		}
		for(int i = 0;i<gouwuList.size();i++) {
		
		
		
		
		
		String goodsName = gouwuList.get(i).get("GOODSNAME");
		String discount = gouwuList.get(i).get("DISCOUNT");
		if(discount==null||discount.equals("10")) {
		discount="无";
		
		}
		String num = gouwuList.get(i).get("NUM");
		String goodsId = gouwuList.get(i).get("GOODSID");
		String shengyu_ = "select NUM from SHOPGOODS where ID = '"+goodsId+"'";
	
		
		List<Map<String,String>> numList = du.queryByList(shengyu_);
		
		
		String shengyu = numList.get(0).get("NUM");
		
		System.out.println("shengyu------"+shengyu);
		String price = gouwuList.get(i).get("PRICE");
		String img = gouwuList.get(i).get("IMG");
		
		double onePrice = Integer.parseInt(num)*Double.parseDouble(price);
		sum = sum+onePrice;
		
		if(img==null) {
		img = "2013081615352577.jpg";
		}
		System.out.println("img----------"+img);
		
		%>
		<input type="hidden" id="goodsId<%=arr[i]%>" value = "<%=goodsId %>"/>
		<input type="hidden" id="firNum<%=arr[i]%>" value = "<%=num %>"/>
		
		
        <!--content----prod1-->
      
        <div id="prod1">
        	<div class="name">
           	<a href="/myshoppingsys/goodsServlet?goodsId=<%=goodsId%>&flag=single"><img  src="<%=path%>/upload/<%=img %>" width="50px" height="60px" alt="图片" /><%=goodsName %></a>
            </div>
            <div class="price" id="price<%=arr[i]%>"><%=price %><font color="red">折扣：<%=discount %></font></div>
            <div class="amount">
            	<div class="center">
            	
            	  <input type = "hidden" id= "size" value="<%=gouwuList.size() %>"/>
            	  <input type = "hidden" id= "shengyu" value="<%=shengyu %>"/>
                	<label id="num<%=arr[i] %>" class="t2" ><%=num %></label>
                	
                    <div class="pd">
                    	<img src="/myshoppingsys/web/images/btn1.jpg" alt="加" onclick="add('num<%=arr[i] %>','price<%=arr[i] %>','goodsId<%=arr[i]%>','firNum<%=arr[i]%>')" />
                        <img src="/myshoppingsys/web/images/btn2.jpg" alt="减" onclick="jian('num<%=arr[i] %>','price<%=arr[i] %>','goodsId<%=arr[i]%>','firNum<%=arr[i]%>')" />
                        
                    </div>
                </div>
            </div>
            <div class="action"><a href="/myshoppingsys/goodsServlet?flag=delOne&loName=<%=loName %>&goodsId=<%=goodsId%>">删除</a></div>
        </div>
        
        
        <!--//content----prod1-->
        
        <%	
		}
%>
<div id="delete"><a href="/myshoppingsys/goodsServlet?flag=clear&loName=<%=loName %>">清空购物车</a></div>
        <div id="amount">
        	<p>总计（不含运费）：<span><label id="sum"><%=sum %></label>元</span></p>
        	<a href="/myshoppingsys/InitProvince?flag=jiesuan&loName=<%=loName %>" class="btn" >结算</a>
            
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
    <!--//bottom-->
</div>

<%
		
		
		} else {
		
				
 %>
		
		<h1>您的购物车还未有任何商品，赶紧去<a href="web/pro_sel.jsp">购物</a>吧！</h1>
		
		<%
		}
		 %>
      
        
<!--//wrap-->
</body> 
</html>
