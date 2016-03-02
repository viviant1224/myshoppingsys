<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="cn.com.shxt.service.UserService"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<style type="text/css">
	#mibao{
		border:#00C solid;}

</style>
<script type="text/javascript" src="/myshoppingsys/admin/js/validate.js"></script>

<script type="text/javascript">
	
		
		
	
	
	
	function checkpw() {
		var password = document.getElementById("password").value;
		var boolean = validatepassword(password,"checkpw");
		return boolean;
		}
		
	function checkpw2() {
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		if(password!=password2) {
			alert("两次输入密码不一致！")
			return false;
			} else {
				document.getElementById("checkpw2").innerHTML="<font color = 'green'>"+"密码输入一致"+"</font>";
				return true;
				}
		}
		
	function checktel() {
	var tel = document.getElementById("tel").value;
		var boolean = validatetel(tel,"checktel");
		return boolean;
		}
	

	
	

	function checkcolor() {
		var color = document.getElementById("favcolor").value;
		if(color.trim()=="") {
			alert("请填写喜欢的颜色");
			return false;
		}
		return true;
	}
	function checkfood() {
		var food = document.getElementById("favfood").value;
		if(food.trim()=="") {
			alert("请填写喜欢的食物");
			return false;
		}
		return true;
	}
	function checksub() {
		if(checkpw()&&checkpw2()&&checktel()&&checkfood()&&checkcolor()) {
			return true;
			} else {
			return false;
				}
		}
		

</script>
</head>
<%

	UserService service = new UserService();
	String userName = (String)session.getAttribute("userName");
	String sql = "select * from SHOPMANAGER where USERNAME='"+userName+"'";
	List<Map<String,String>> userList = service.query(sql);
	String tel = userList.get(0).get("TEL");
	String favfood = userList.get(0).get("FAVFOOD"); 
	String favcolor = userList.get(0).get("FAVCOLOR");
 %>
<body>
<div id="main">
<form action="/myshoppingsys/UserServlet?flag=userUpdate&userName=<%=userName %>" method="post" onsubmit=" return checksub()">
<table align="center"  cellspacing="0">
	
	<tr height="30px">
    	<td width="150px">姓名：</td>
        <td><label  id="checkname"><%=userName %></label></td>
        
        <td colspan="2" width="300px">以下信息为忘记密码时的密保问题</td>
      
    </tr>
    <tr height="30px">
    <td><label  id="checkname"></label></td>
    </tr>

    <tr height="30px">
    	<td>性别：</td>
        <td><input type="radio" name="sex" value="男" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女" />女</td>
        <td colspan="2" rowspan="7">
        <div id="mibao">
        <table align="center">
        <tr height="60px">
        <td>最喜欢的颜色:</td>
        </tr>
         <tr height="60px">
        <td><input type="text" id="favcolor" name="favcolor" value="<%=favcolor%>"/></td>
        </tr>
         <tr height="60px">
        <td>最喜欢食物:</td>
        </tr>
        <tr height="60px">
       <td><input type="text" id="favfood" name="favfood" value="<%=favfood%>"/></td>
        </table>
        
        </div>
        
        </td>
        
    </tr>
   
 <tr height="30px">
    	<td>密码：</td>
    	
        <td><input type="password" id="password" name="password" onblur="checkpw()"/></td>
        
    </tr>
    
    <tr height="30px">
    <td><label id="checkpw"></label></td>
    </tr>
    
   <tr height="30px">
   
    	<td>确定密码：</td>
        <td><input type="password" id="password2" onblur="checkpw2()"/></td>
        
    </tr>
   <tr height="30px">
   <td><label id="checkpw2"></label></td>
    </tr>
   <tr height="30px">
    	<td>电话：</td>
        <td><input type="text" id="tel" name="tel" onblur="checktel()" value="<%=tel%>"/></td>
       
    </tr>
    <tr height="30px">
   <td><label id="checktel"></label></td>
    </tr>
    <tr height="30px">
    	<td></td>
        <td></td>
        <td><input type="submit" value="修改" /></td>
        <td><input type="reset" value="重置" /></td> 
    </tr>
</table>
</form>
</div>
</body>
</html>
