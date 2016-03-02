<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findpwmessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%

  
  String info=new String(request.getParameter("info").getBytes("iso-8859-1"),"UTF-8");
  System.out.println(info);
  
   %>
  
  <body>
  <%
  if(info.equals("对不起，你的密保问题回答有误！")) {
  %>
  <h2 align="center"><%=info %></h2><br/>
  <%
  } else if(info.equals("对不起，该账户尚未注册。。")) {
  
    %>
  <h2 align="center"><%=info %></h2><br/>
  <%
  } else {
  %>
  <h2 align="center">您的密码为：<font color="red"><%=info %></font></h2><br/>
  <%
  
  }
   %>
  
  
  
   
  </body>
</html>
