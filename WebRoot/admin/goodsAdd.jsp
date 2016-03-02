<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品库存</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" >
		function checkNum(id,num) {
		
		var addNum  = document.getElementById("addNum").value;
	
		var regu = "^[0-9]+$";
		var re = new RegExp(regu);
		
		if(addNum=="") {
		
			alert("件数不能为空，请重新入库");
			
			}else if (addNum.search(re) != -1) {
			window.location.href="../goodsServlet?flag=addGoodsNum&addNum="+addNum+"&id="+id+"&num="+num;
			
		}
		}
	
	</script>

  </head>
  <%
  	String goodsname = request.getParameter("goodsname");
  	String goodsid= request.getParameter("Id");
  	String num = request.getParameter("num");
  	goodsname=URLDecoder.decode(goodsname,"UTF-8");  
  	System.out.println("goodsname+"+goodsname);
  
  
   %>
  
  <body>
  
    <table align="center">
    	<tr height="40px;">
    	<td>商品名：</td>
    	<td><label><%=goodsname %></label></td>
    	</tr>
    	<tr height="40px;">
    	<td>原库存件数：</td>
    	<td><label><%=num %></label></td>
    	<tr height="40px;">
    	<tr>
    	<td>新增件数：</td>
    	<td><input type="text" id="addNum" /></td>
    	</tr>
    	<tr height="40px;">
    	<td></td>
    	<td><input type="button" value="确定" onclick="checkNum('<%=goodsid%>','<%=num%>')"/></td>
    	</tr>
    
    </table>
  </body>
</html>
