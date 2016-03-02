<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>前台展示</title>
<style type="text/css">
#footer11 {
	padding-top: 12px;
	width: 100%;
	height: 100px;
	text-align: center;
}
</style>
</head>
<%
	List<Map<String, String>> zhangdanList = (List<Map<String, String>>) request
			.getAttribute("zhangdanList");
	request.setAttribute("zhangdanList", zhangdanList);
%>

<body background="素材/qian.jpg">
	<%
		String loName = (String) session.getAttribute("userNameqiantai");
		if (loName != null) {
	%>
	<table align="center" width="1000px" height="800px">
		<!--一-->
		<tr height="120px">

			<td width="150px"><p align="right">
					你好，欢迎来到小威少威网上商城个人资料中心&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
						color="#FF0000">联系方式：</font>18686672327&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</p> <br />
			<br /> <a href="/myshoppingsys/web/userZiLiao.jsp" target="iframe_">
					个人资料</a> <a href="/myshoppingsys/web/zhangdan.jsp" target="iframe_">
					历史账单</a> <a href="/myshoppingsys/web/gerenxiaoxi.jsp" target="iframe_">
					个人消息</a>

				<p align="right">
					<a href="/myshoppingsys/web/main.jsp">商城首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</p></td>

		</tr>
		<!--三-->
		<tr height="550px">

			<td width="700px" valign="top" align="center">
				<%
					String flag_ = request.getParameter("flag_");
						System.out.println("flag_====" + flag_);
						if (flag_ == null) {
				%> <iframe name="iframe_"
					src="/myshoppingsys/web/zhangdan.jsp" width="996px;"
					height="550px;" frameborder="0" scrolling="0"></iframe> <%
 	} else if (flag_.equals("xiaoxi")) {
 %> <iframe name="iframe_"
					src="/myshoppingsys/web/gerenxiaoxi.jsp" width="996px;"
					height="550px;" frameborder="0" scrolling="0"></iframe> <%
 	} else if (flag_.equals("ziliao")) {
 %> <iframe name="iframe_"
					src="/myshoppingsys/web/userZiLiao.jsp" width="996px;"
					height="550px;" frameborder="0" scrolling="0"></iframe> <%
 	}
 %>
			</td>

		</tr>
		<!--四-->
		<tr height="50px">
			<td width="150px" colspan="3" align="right"><div id="footer11">
					<font size="4px" color="black">制作人：黄威威 Copyright © 2013
						company.All Rights Reserved. 版权号：W5.0.005<br /> 联系方式：tel
						18686672327 qq :839562677</font> </font>
				</div>
			</td>

		</tr>
	</table>
	<%
		} else {
//跳转到登录界面
			request.getRequestDispatcher("enter.jsp").forward(request,
					response);

		}
	%>
</body>
</html>

