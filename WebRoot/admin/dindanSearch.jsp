<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小威少威网上商城后台管理系统</title>
<link href="/myshoppingsys/admin/style/main.css" type="text/css" rel="stylesheet" />
</head>

<script type="text/javascript">
function yishouhuo(goodsId,Username,buydate) {
 window.location.href="/myshoppingsys/goodsServlet?flag=duifangshouhuo&goodsId="+goodsId+"&buyname="+Username+"&buydate="+buydate;

}
</script>


<body>
<%
	List<Map<String,String>> goodsList = (List<Map<String,String>>)session.getAttribute("goodsList1");
	if(goodsList!=null) {
	
	%>
	<div id="right">
		<div id="content1">
			<div class="main2">
				<table cellpadding="0" cellspacing="0" class="tab2">
					<colgroup>
					<col width="13%" />
					<col width="15%" />
					<col width="12%" />
					<col width="12%" />
					<col width="15%" />
					<col width="13%" />
					<col width="10%" />
					<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th>订单编号</th>
							<th>商品名称</th>
							<th>下单姓名</th>
							<th>手机号码</th>
							<th>订购日期</th>
							<th>订单情况</th>
							<th>单价（元撒）</th>
							<th>数量</th>
							
							
						</tr>
					</thead>
					<% 
						for(int i = 0;i<goodsList.size();i++) {
   		 				Map<String,String> map = goodsList.get(i);
   		 				String DDCODE=map.get("DDCODE");
   		 				String goodsname=map.get("GOODSNAME");
   		 				String price=map.get("PRICE");
   		 				String num =map.get("GOODSCODENU");
   		 			
   		 				String username=map.get("BUYNAME");	
   		 				String stel=map.get("STEL");
   		 				String buydate =map.get("BUYDATE");
   		 				String state=map.get("STATE");
   		 				String discount =map.get("DISCOUNT");
   		 				String zhifu= map.get("ZHIFU");
   		 				String goodsId = map.get("GOODSCODE");
   		 		
				%>	
					
					<tbody>
						<tr>
							<td><%=DDCODE %></td>
							<td><%=goodsname %></td>
							<td><%=username %></td>
							<td><%=stel %></td>
							<td><%=buydate %></td>
							<%
							if(zhifu.equals("货到付款")) {
							%>
							<td><%=state %><input type="button" value = "对方已收货" onclick="yishouhuo('<%=goodsId%>','<%=username%>','<%=buydate%>')"/></td>
							<%
							} else {
							%>
							<td><%=state %></td>
							<%
							}
							 %>
							
							<td><%=price %></td>
							<td><%=num %></td>
							
							
						</tr>
						<%
						}
						 %>		
					</tbody>
				</table>
			
		</div>
	</div>
	
	
	<%
	} else {
	%>
	<h1>暂无数据</h1>
	<%
	}

 %>
	
</body>
</html>
