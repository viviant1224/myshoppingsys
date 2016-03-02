<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.service.GoodsService"%>
<%@ page import="cn.com.shxt.model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主版块</title>
<style type="text/css">
	#body{
		
		}

	#top{
		height:60px;
		width:1100px;
		border:#09F solid 1px;}
	#ruku{
		height:auto;
		width:450px;
		float:left;
		border:#09F solid 1px;}
		#dontai{
		height:auto;
		width:650px;
		float:left;
		border:#09F solid 1px;}
		#fabu{
		height:160px;
		width:1100px;
		float:left;
		border:#09F solid 1px;}

</style>
<script type="text/javascript">

		//跳页
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
 
 
 function huifuliuyan(buyname,liuyandate_) {


		var my_width=800; //小窗口的宽度和高度
		var my_height=400;
		var left=window.screen.width/2-my_width/2;
		var top=window.screen.height/2-my_height/2;
	    window.open("/myshoppingsys/admin/huifupinglun.jsp?buyname="+buyname+"&liuyandate_="+liuyandate_,"_blank","left="+left+",top="+top+",height="+my_height+",width="+my_width+",status=no,toolbar=no,menubar=no,location=no");
 
 }
 </script>
</head>
<div  >
<div id="top">
<h3></h3><marquee direction="left">小威少威网站后台管理系统，一家专注<font color="#FF0000">质量</font>的网上购物商城！</marquee>


</div>
<div id="ruku">
<h2><font color="red">最新评价：</font></h2>
<%
		GoodsService service = new GoodsService();
		
	String pingjiaSql = "select * from (select rownum as rn, a.* from shopchat a order by DATE_ desc)where rn between 1 and 6 order by DATE_ desc";
	List<Map<String,String>> pingjiaList = service.query(pingjiaSql);
	if(pingjiaList!=null||pingjiaList.size()!=0) {
	for(int  i = 0;i<pingjiaList.size();i++) {
		String goodsname = pingjiaList.get(i).get("GOODSNAME");
		String buyname = pingjiaList.get(i).get("BUYNAME");
		String date_ = pingjiaList.get(i).get("DATE_");
		String neirong = pingjiaList.get(i).get("NEIRONG");
		
		%>
		
		&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue"><%=buyname %></font>对<font color="red"><%=goodsname %></font>的评价：&nbsp;&nbsp;&nbsp;&nbsp;<%=neirong %>-----------<%=date_ %>
		<br/>
		<%
		}
	
	
	
	}else {
		%>
		
		<h2>暂无网友留言</h2>
		<%
		} 
		
 %>


</div>
 
<div id="dontai">
<h2><font color="red">网友留言：</font></h2>
<%
	//	GoodsService service = new GoodsService();
		
		PageBean pageBean = (PageBean)request.getAttribute("pageBean12");
   		 		 if(pageBean!=null){
   		 		 
   		 		List<Map<String,String>> liuyanList =pageBean.getResList();
    			int rows=pageBean.getRows();    //总记录数
    			int pages=pageBean.getPages();   //总页数
    			int nowPage=pageBean.getNowPage();//当前页
    			
					if(liuyanList!=null&&liuyanList.size()>0){
					int arr[] = new int[liuyanList.size()];
					for(int i =0;i<arr.length;i++) {
					arr[i]=i;
					}
					 %>
   		  	  <form action="/myshoppingsys/goodsServlet" name="nextPageForm" method="post">
    	 		<input type="hidden"  name="flag" value="houtailiuyan" />
     			<input  id="nextPage" type="hidden" name="nextPage" /> 
     			<input  type="hidden" name="baseSql" value="<%=pageBean.getBaseSql() %>"  />
    	 		
   			 </form>
   			 <%
	
		for(int  i = 0;i<liuyanList.size();i++) {
		String neirong = liuyanList.get(i).get("NEIRONG");
		String buyname = liuyanList.get(i).get("BUYNAME");
		String date_ = liuyanList.get(i).get("LIUYANDATE");
		
		%>
		
		&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue"><%=buyname %></font>：&nbsp;&nbsp;&nbsp;&nbsp;<%=neirong %>-----------<%=date_ %><br/>
		<div id="huifu">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:void(0)"  onclick="huifuliuyan('<%=buyname%>','<%=date_%>')">回复</a><br/>
		</div>		
		<%
		}
		%>
		<label style="font-size:12px; color:red">总共<%=rows %>条记录，当前为<%=nowPage %>/<%=pages %>页</label>
		<a href="javascript:void(0)" onclick="upPage(<%=nowPage%>)" class="next" >上一页</a>&nbsp;
        <a href="javascript:void(0)" onclick="nextPage(<%=pages%>,<%=nowPage%>)" class="next">下一页</a>&nbsp;
		
		<%
		} else {
		%>
		
		
		<h2>暂无网友留言</h2>
		<%
		} 
		}else {
		
		request.getRequestDispatcher("/goodsServlet?flag=houtailiuyan").forward(request, response);
		
		}
		



 %>


</div>
<div id="fabu">
<h4>发布消息：</h4>
<textarea cols="120" rows="4"></textarea><input type="button" value="发布 "/>

</div>

</div>
<body id="body">

</body>
</html>
