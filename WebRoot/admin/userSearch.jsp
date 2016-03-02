<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.com.shxt.model.PageBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'GoodsManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	

	table tr{
	bordercolor="#0066FF";
	
	}




</style>
	 <script type="text/javascript">
   
    //下一页
   function  nextPage(pages,nowPage){
	   //当前页是尾页
	    if(nowPage==pages){
	    	alert("当前为尾页，没有下一页!");
	    }else{
	    
	   //给form表单赋值
	    document.getElementById("nextPage").value=nowPage+1;
	   //方式1：window.location.href=XXservlet?nowPage=2
	   //方式2：利用js提交表单
	   //方法3：通过form的name值提交
	    nextPageForm.submit();
	    }
   }
   
   //上一页
   function upPage(nowPage){
	   if(nowPage==1){
		   alert("当前为首页，没有上一页!");
	   }else{
		 //给form表单赋值
		    document.getElementById("nextPage").value=nowPage-1;
		    nextPageForm.submit();
	   }
 }
   
   //首页
   function headPage(nowPage){ 
	   //当前页就是首页
	   if(nowPage==1){
		   return;
	   }else{
		   document.getElementById("nextPage").value=1;
		    nextPageForm.submit();
	   }
	   
   }
    
   
 //尾页
   function footPage(nowPage,pages){ 
	   //当前页就是首页
	   if(nowPage==pages){
		   return;
	   }else{
		   document.getElementById("nextPage").value=pages;
		   nextPageForm.submit();
	   }
	   
   }
   
    

  
 
   </script>

  </head>
  
  <body>
<h3>  <p align="center">客户查看</p></h3>
   
   <%
   		
   		 PageBean pageBean = (PageBean)request.getAttribute("pageBean");
   
   		 if(pageBean!=null){
    	
    	int rows=pageBean.getRows();    //总记录数
    	int pages=pageBean.getPages();   //总页数
    	int nowPage=pageBean.getNowPage();//当前页
    	
    	List<Map<String,String>> userList =pageBean.getResList();
   		 if(userList!=null&&userList.size()>0){
   		  %>
   		  	  <form action="UserServlet" name="nextPageForm" method="post">
    	 		<input type="hidden"  name="flag" value="userSearch" />
     			<input  id="nextPage" type="hidden" name="nextPage" /> 
    	 		<input  type="hidden" name="baseSql" value="<%=pageBean.getBaseSql() %>"  />
   			 </form>
   			 
   		   <table align="center" >
   		  	<tr>
				<td colspan="11">
				</td>   		 	
   		 	</tr>
   		 	</table>
   		 
   		 <table border="1" align="center" bordercolor="#0099FF"  border="1" id="table" cellspacing="0px">
   		 
   		 
   		 
   		 
   		 	
   		 	<tr>
   		 	
   		 		<td>编号</td>
   		 		<td>用户名</td>
   		 		<td>性别</td>
   		 		<td>电话号</td>
   		 		<td>密码</td>
   		 		<td>住址</td>
   		 		<td>生日</td>
   		 		<td>EMAIL</td>
   		 		<td>VIP</td>
   		 	</tr>
   		 	
   		 	
   		 	
   		 	<% 
   		 	//List<Map<String,Object>> list =	(List<Map<String, Object>>)request.getAttribute("list");
   		//System.out.println("-------------"+list.size());
   		 	for(int i = 0;i<userList.size();i++) {
   		 	Map<String,String> map = userList.get(i);
   		 	String goodsId = map.get("ID").toString();
   		 		String username=map.get("USERNAME");
   		 		String password=map.get("PASSWORD");
   		 		String tel=map.get("TEL");
   		 		String sex =map.get("SEX");
   		 		
   		 		String address =map.get("ADDRESS");
   		 		String state=map.get("STATE");
   		 		String birthday =map.get("BIRTHDAY");
   		 		String EMAIL=map.get("EMAIL");
   		 		
   		 		String isvip=map.get("ISVIP");
   		 	
   		 	%>
   		 
   		 		<tr>
   		 		 
   		 		<td><%=goodsId%></td>
   		 		<td><%=username%></td>
   		 		<td><%=sex%></td>
   		 		<td><%=tel%></td>
   		 		<td><%=password%></td>
   		 		<td><%=address%></td>
   		 		<td><%=birthday%></td>
   		 		<td><%=EMAIL%></td>
   		 		<td><%=isvip%></td>
   		 		
   		 		
   		 	</tr>
   		 	
   		 	<%
   		 	}
   		 	%>
   		 	  <tr>
            <td colspan="11">
              
               <label style="font-size:12px; color:red">总共<%=rows %>条记录，当前为<%=nowPage %>/<%=pages %>页</label>
               <a href="javascript:void(0)"  onclick="headPage(<%=nowPage%>)" >首页</a>&nbsp;
                <a href="javascript:void(0)" onclick="upPage(<%=nowPage%>)" >上一页</a>&nbsp;
                <a href="javascript:void(0)" onclick="nextPage(<%=pages%>,<%=nowPage%>)">下一页</a>&nbsp;
               <a href="javascript:void(0)" onclick="footPage(<%=nowPage%>,<%=pages%>)">尾页</a> &nbsp;
            </td>
              
          </tr>
   		 	
   		 
   		 </table>
   		 
	<% 
   }else{
	   %>
	   <h1>暂无合法数据！(resList每页结果集)</h1>
	   <%   
     }
    }
   else{
	   %>
	   <h1>暂无合法数据！（PageBean对象不存在）</h1>
	   <% 
   }
  
  
  %>

  </body>
</html>
