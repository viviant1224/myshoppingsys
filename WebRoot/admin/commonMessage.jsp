<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'commonMessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript">
    function winClose(){
    	
    	//关闭之前先刷新父窗口，实现数据的更新
    	window.opener.location.reload();
    	
    	//关闭窗口
    	window.opener=null;
    	window.open("", "_self");
    	window.close();    	
    }
     window.onload=setTimeout("winClose()",3000);
    
    </script>
  </head>
  
  <body>
    <%
    if(request.getAttribute("message")!=null){
    String message=(String)request.getAttribute("message");
    %>
    <h1>系统提示：</h1><h3><font color="red"><%=message %></font></h3>
    <% 
    }else{
   %>
   系统提示：暂无消息！
   <%  
    }
    
    %>
  </body>
</html>
