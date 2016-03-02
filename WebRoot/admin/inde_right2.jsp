<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>红酒后台管理系统</title>
<link href="/myshoppingsys/admin/style/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="right">
		<div id="content">
			<div class="leftbg"></div>
			<div class="rightbg"></div>
			<div class="main3">
			<form action="/myshoppingsys/goodsServlet" method= "post" >
			<input type="hidden"  name="flag" value="dindanQuerytiaojian" />
     			
				<table cellpadding="0" cellspacing="0" class="tab2">
					<colgroup>
						<col width="30%" />
						<col width="33%" />
						<col width="37%" />
					</colgroup>
					
					<tbody>
					
						<tr>
							<td>
							
								<dl class="dl1">
									<dt><img src="/myshoppingsys/admin/img/dt_img.gif" alt="图片" /></dt>
									<dd>销售查询</dd>
								</dl>
							</td>
							<td>
								<dl class="dl2">
									<dt>客户姓名：</dt>
									<dd><input type="text" name= "userName" class="txt4" /></dd>
								</dl>
								<dl class="dl2">
									<dt>订单编号：</dt>
									<dd><input type="text" name= "dindanCode"  class="txt4" /></dd>
								</dl>
								
							</td>
							<td>
								<dl class="dl2">
									<dt>手机号码：</dt>
									<dd><input type="text" name="tel" class="txt4" /></dd>
								</dl>
								<dl class="dl2">
									<dt>订购日期：</dt>
									<dd><input type="text" name="buydate" class="txt4" /></dd>
								</dl>
								<div class="btn9"><input type="submit" value="搜 索" class="btn10" /></div>
							</td>
						</tr>
						
					</tbody>
				</table>
				</form>
				<iframe src="/myshoppingsys/admin/dindanSearch.jsp" frameborder="0" scrolling="yes" width="100%" height="300"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
