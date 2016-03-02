<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>红酒后台管理系统</title>
<link href="/myshoppingsys/admin/style/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
function tuihuo(id,buyname,buydate,buynum) {
if(confirm("确定执行？")){  		
	 window.location.href="/myshoppingsys/goodsServlet?flag=zhixingtuihuo&goodsId="+id+"&buyname="+buyname+"&buydate="+buydate+"&buynum="+buynum;
	   }else{
	     return;
	   }


}

function tuihuoquxiao(id,buyname,buydate,buynum) {
if(confirm("确定取消退货？")){  		
	 window.location.href="/myshoppingsys/goodsServlet?flag=quxiaotuihuo&goodsId="+id+"&buyname="+buyname+"&buydate="+buydate+"&buynum="+buynum;
	   }else{
	     return;
	   }


}







</script>
</head>
<body>
	<div id="right">
		<div id="content">
			<div class="leftbg"></div>
			<div class="rightbg"></div>
			<div class="main">
				<div class="tit mg1"></div>
				<div class="titbg mg1">退货查询</div>
				<table cellpadding="0" cellspacing="0" class="tab1">
					<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th>选择</th>
							<th>商品名</th>
							<th>商品编号</th>
							<th>购买日期</th>
							<th>客户姓名</th>
							<th>退货数量</th>
							
							<th>允许退货</th>
							<th>取消退货</th>
						</tr>
						
					</thead>
				
					<tbody>
						<%
						
						List<Map<String,String>> tuihuoList = (List<Map<String,String>>)request.getAttribute("tuihuoList");
						 if(tuihuoList!=null) {
						 for (int i = 0;i<tuihuoList.size();i++) {
						 String goodsname = tuihuoList.get(i).get("GOODSNAME");
						 String goodsId = tuihuoList.get(i).get("GOODSID");
						 String buydate = tuihuoList.get(i).get("BUYDATE");
						 String buyname = tuihuoList.get(i).get("BUYNAME");
						 String buynum = tuihuoList.get(i).get("BUYNUM");
						 String tuihuoliyou = tuihuoList.get(i).get("TUIHUOLIYOU");
						 
						 
						 
						 %>
						 	<tr>
							<td><input type="checkbox" /></td>
							<td><%=goodsname %></td>
							<td><%=goodsId %></td>
							<td><%=buydate %></td>
							<td><%=buyname %></td>
							<td><%=buynum %></td>
							
							<td class="img1"><a href="javascript:void(0)" onclick="tuihuo('<%=goodsId%>','<%=buyname%>','<%=buydate%>','<%=buynum%>')">[允许]</a></td>
							<td class="img2"><a href="javascript:void(0)" onclick="tuihuoquxiao('<%=goodsId%>','<%=buyname%>','<%=buydate%>','<%=buynum%>')">[取消]</a></td>
						</tr>
						 
						 
						 <% 
						 
						 
						 
						 
						 }
						
						 } else {
						 %>
						 <h1>暂无数据</h1>
						 <%
						 }
						 %>
					
						
					</tbody>
				</table>
				<div class="bottom"><input type="button" value="全选" class="btn7" /><input type="button" value="新增" class="btn7" /><input type="button" value="删除" class="btn7" /></div>
				<div class="bottom1">首页 | 上一页 | 下一页 | 尾页 转到 <input type="text" class="txt1" /> 页 <input type="button" value=" " class="btn8" /> 转</div>
			</div>
		</div>
	</div>
</body>
</html>
