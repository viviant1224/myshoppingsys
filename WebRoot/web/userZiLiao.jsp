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


<script type="text/javascript" src="/myshoppingsys/web/js/validate.js"></script>

<script type="text/javascript">
	//修改用户资料
	function setInfo() {
		var userName = document.getElementById("userName").value;
		var my_width = 800; //小窗口的宽度和高度
		var my_height = 500;
		var left = window.screen.width / 2 - my_width / 2;
		var top = window.screen.height / 2 - my_height / 2;
		window.open("/myshoppingsys/web/setInfo.jsp?userName=" + userName,
				"_blank", "left=" + left + ",top=" + top + ",height="
						+ my_height + ",width=" + my_width
						+ ",status=no,toolbar=no,menubar=no,location=no");

	}
</script>
</head>

<%
	String loName = (String) session.getAttribute("userNameqiantai");
	if (loName != null) {
		UserService service = new UserService();
		String sql = "select * from SHOPVIP where USERNAME='" + loName
				+ "'";
		List<Map<String, String>> userList = service.query(sql);
		String tel = userList.get(0).get("TEL");
		String sex = userList.get(0).get("SEX");
		String address = userList.get(0).get("ADDRESS");
		if (address == null || address == "" || address.equals("")) {
			address = "暂无填写";
		}
		String email = userList.get(0).get("EMAIL");
%>

<body>
	<!--content-->
	<div id="content" align="center">
		<div>
			<h3 align="left">
				用户名 &nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="red"><%=loName%></font>
			</h3>
			<input type="hidden" id="userName" value="<%=loName%>" />

		</div>

		<div>
			<h3 align="left">
				邮箱 &nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="red"><%=email%></font>
			</h3>
			<div>
				<h3 align="left">
					地址 &nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="red"><%=address%></font>
				</h3>
			</div>
			<div>
				<h3 align="left">
					电话 &nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="red"><%=tel%></font>
				</h3>
			</div>
			<div>
				<h3 align="left">
					性别 &nbsp;&nbsp;&nbsp;&nbsp; <font size="3" color="red"><%=sex%></font>
				</h3>
			</div>
			<p align="right">
				<a href="javascript:void(0)" onclick="setInfo()">修改资料</a>
			</p>


		</div>
		<!--//content-->


	</div>
	<!--//wrap-->
</body>
<%
	} else {
		request.getRequestDispatcher("enter.jsp").forward(request,
				response);
	}
%>

</html>
