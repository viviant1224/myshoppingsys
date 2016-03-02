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
   
   //实现全选
	 function checkAllDemo(){
	    var checkAllNode= document.getElementById("checkAll");
	    var intetestNodes= document.getElementsByName("goodsId");
	   for(var i=0;i<intetestNodes.length;i++){
	        intetestNodes[i].checked=checkAllNode.checked;
	       
	   }
	 }
	 
	 
	  function checkAllIsChecked(){
	 var flag=true;
	 var checkAllNode= document.getElementById("checkAll");
	 var intetestNodes= document.getElementsByName("goodsId");
	   for(var i=0;i<intetestNodes.length;i++){
	      if(!intetestNodes[i].checked){
		      flag=false;
			  break;
		  }
	   }
	    checkAllNode.checked=flag;
	}
   
   //批量删除
   function xiajiaByBatch(){
	   //创建js数组
	     var goodsIdsArray=new Array();
	     var goodsIdArray=document.getElementsByName("goodsId");
	      
	     var flag=true;
	    	 
	     for(var i=0;i<goodsIdArray.length;i++){
	    	 if(goodsIdArray[i].checked){
	    		 
	    		  var goodsid=goodsIdArray[i].value;
	    		 
	    		  //将选中的用户id放入数组
	    		  goodsIdsArray.push(goodsid);
	    		 
	    		  flag=false;
	    	 }
	     }
	     
	     if(flag){
	    	 alert("请选择要下架的商品！");
	     }else{
	     	
	    	 if(confirm("您确定要下架所选记录?")){
	    		
			     window.location.href="/myshoppingsys/goodsServlet?flag=xiajiaByBatch&goodsIdsArray="+goodsIdsArray.join(",");
	    	 }else{
	    		 return;
	    	 }
	    	 
	     }
	      
	    /**循环数组
	     for(var i=0;i<userIdsArray.length;i++){
	    	 alert(userIdsArray[i]);
	     }
	   */
	   
   }
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
   
    function goodsUpdate(id){
	    var my_width=800; //小窗口的宽度和高度
		var my_height=600;
		var left=window.screen.width/2-my_width/2;
		var top=window.screen.height/2-my_height/2;
	    window.open("/myshoppingsys/goodsServlet?flag=goodsUpdate&Id="+id,"_blank","left="+left+",top="+top+",height="+my_height+",width="+my_width+",status=no,toolbar=no,menubar=no,location=no");
 
   }
     function  showMore(id){
	    var my_width=800; //小窗口的宽度和高度
		var my_height=600;
		var left=window.screen.width/2-my_width/2;
		var top=window.screen.height/2-my_height/2;
	    window.open("/myshoppingsys/goodsServlet?flag=showMore&Id="+id,"_blank","left="+left+",top="+top+",height="+my_height+",width="+my_width+",status=no,toolbar=no,menubar=no,location=no");
 
   }
  
  function goodsAdd(id,num,goodsname){
	    var my_width=400; //小窗口的宽度和高度
		var my_height=200;
		var left=window.screen.width/2-my_width/2;
		var top=window.screen.height/2-my_height/2;
		goodsname=encodeURI(goodsname);
    	goodsname=encodeURI(goodsname);
	    window.open("/myshoppingsys/admin/goodsAdd.jsp?flag=goodsAdd&Id="+id+"&goodsname="+goodsname+"&num="+num,"_blank","left="+left+",top="+top+",height="+my_height+",width="+my_width+",status=no,toolbar=no,menubar=no,location=no");
   }
   </script>

  </head>
  
  <body>
   
   <%
   		System.out.println("ssss");
   		 PageBean pageBean = (PageBean)request.getAttribute("pageBean");
   		 System.out.println("ssss------ssss");
   		 if(pageBean!=null){
    	 System.out.println("ssss----11--ssss");
    	int rows=pageBean.getRows();    //总记录数
    	int pages=pageBean.getPages();   //总页数
    	int nowPage=pageBean.getNowPage();//当前页
    	
    	List<Map<String,String>> goodsList =pageBean.getResList();
   		 if(goodsList!=null&&goodsList.size()>0){
   		  %>
   		  	  <form action="goodsServlet" name="nextPageForm" method="post">
    	 		<input type="hidden"  name="flag" value="goodsSearch" />
     			<input  id="nextPage" type="hidden" name="nextPage" /> 
    	 		<input  type="hidden" name="baseSql" value="<%=pageBean.getBaseSql() %>"  />
   			 </form>
   			  <%
     
     
     System.out.println("-------------------------rrr---"+pageBean.getBaseSql()); 
     
     %>
   		   <table align="center" >
   		  	<tr>
				<td colspan="11">
				
				
				
			<form action="goodsServlet" name="search" method="post" />
     			<input type="hidden"  name="flag" value="goodsSearchTiJiao" />
     			品牌：<input type="text" id="pinpai" name="pinpai"/>&nbsp;&nbsp;&nbsp;&nbsp;
    		 	类别：<input type="text"  id="CATEGORYID" name="CATEGORYID"/>
      			<input type="submit" value="提交" />
  			</form>
				
				
				
				</td>   		 	
   		 	</tr>
   		 	</table>
   		 
   		 <table border="1" align="center" bordercolor="#0099FF"  border="1" id="table" cellspacing="0px">
   		 
   		 
   		 
   		 
   		 	
   		 	<tr>
   		 	 <td> <input type="checkbox" name="checkAll" id="checkAll"  value=""  onclick="checkAllDemo()" /> 全选&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="" value="下架" onclick="xiajiaByBatch()"></td>
   		 		<td>商品名</td>
   		 		<td>类别</td>
   		 		<td>售价(元)</td>
   		 		<td>出厂日期</td>
   		 		<td>折扣</td>
   		 		<td>状态</td>
   		 		<td>产地</td>
   		 		<td>库存</td>
   		 		<td>进价</td>
   		 		<td>品牌</td>
   		 		<td colspan="2">操作</td>
   		 		
   		 	</tr>
   		 	
   		 	
   		 	
   		 	<% 
   		 	//List<Map<String,Object>> list =	(List<Map<String, Object>>)request.getAttribute("list");
   		//System.out.println("-------------"+list.size());
   		 	for(int i = 0;i<goodsList.size();i++) {
   		 	Map<String,String> map = goodsList.get(i);
   		 	String goodsId = map.get("ID").toString();
   		 	
   		 	
   		 	
   		 		String goodsname=map.get("GOODSNAME");
   		 		String category=map.get("CATEGORY");
   		 		String price=map.get("PRICE");
   		 		String update_=map.get("UPDATE_");
   		 		
   		 		System.out.println("update_"+update_);
   		 		
   		 		String discount=map.get("DISCOUNT");
   		 		
   		 		System.out.println("discount"+discount);
   		 		String state=map.get("STATE");
   		 		String proarea=map.get("PROAREA");
   		 		String num=map.get("NUM");
   		 		
   		 		String firstprice=map.get("FIRSTPRICE");
   
   		 		String pinpai=map.get("PINPAI");
   		 	
   		 	%>
   		 
   		 		<tr>
   		 		 <td>  <input type="checkbox" name="goodsId"  value="<%= goodsId%>"    onclick="checkAllIsChecked()" /> </td>
   		 		<td><%=goodsname%></td>
   		 		<td><%=category%></td>
   		 		<td><%=price%></td>
   		 		<td><%=update_%></td>
   		 		<td><%=discount%></td>
   		 		<td><%=state%></td>
   		 		<td><%=proarea%></td>
   		 		<% if(Integer.parseInt(num)<100) {
   		 		%>
   		 		<td><font color="red"><%=num%></font></td>
   		 		<%
   		 		} else {
   		 		%>
   		 		<td><%=num%></td>
   		 		<%
   		 		}
   		 		%>
   		 		<td><%=firstprice%></td>
   		 		<td><%=pinpai%></td>
   		 		
   		 	
   		 		
   		 		<td><a href="javascript:void(0)" onclick="showMore(<%=map.get("ID").toString()%>)">查看更多</a></td>
   		 		<td><a href="javascript:void(0)" onclick="goodsAdd('<%=map.get("ID").toString()%>','<%=num%>','<%=goodsname%>')">增加库存</a></td>
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
