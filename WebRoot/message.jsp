<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message.jsp' starting page</title>
    
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
  	String info = (String)session.getAttribute("info");
  
   %>
  
  <body align="center">
  <% 
  if(info.equals("邮件已发送成功，请您尽快登录自己的邮箱修改信息。")) {
  %>
   <h1><%=info%></h1>
    <% response.setHeader("refresh", "3;URL=/myshoppingsys/web/main.jsp");%>
  
  <%
  } else if(info.equals("抱歉，您没有该权限，请登录后操作")){
  %>
  <h1><%=info%></h1>
  <%response.setHeader("refresh", "3;URL=/myshoppingsys/admin/login.jsp");%>
  <%
  }
  %>
   
  </body>
</html>
