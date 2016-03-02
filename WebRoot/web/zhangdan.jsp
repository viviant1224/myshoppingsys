<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript">
	//退货
	function tuihuo(goodsId_,loName,date_,num,goodsname) {
	var goodsId = document.getElementById(goodsId_).value;
	var date = document.getElementById(date_).value;
	var dateArray=date.split(" ");
	var date1 = new Date();
	var year  = date1.getFullYear();
	var month= date1.getMonth()+1;
	var day = date1.getDate();
	var time = year+"-"+month+"-"+day;
	
	
	//比较时间是不是七天以外
	var aDate, oDate1, oDate2, iDays;   
    aDate = time.split("-");   
    oDate1 = new Date(aDate[0],aDate[1]-1,aDate[2]);   
    aDate = dateArray[0].split("-");   
    oDate2 = new Date(aDate[0],aDate[1]-1,aDate[2]);     
    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24);     
   
	
	if(iDays<7) {
	
	if(confirm("您确定要将该商品退货?")){  		
	 window.location.href="/myshoppingsys/goodsServlet?flag=tuihuo&goodsId="+goodsId+"&loName="+loName+"&date="+date+"&num="+num+"&goodsname="+goodsname;
	   }else{
	     return;
	   }
	} else {
	
	alert("对不起，已超出退货时间的范围（7天内），不能退货");
	}
	
	}
	
	//取消订单
	function quxiaodindan(goodsId_,loName,date_) {
	var goodsId = document.getElementById(goodsId_).value;
	var date = document.getElementById(date_).value;
	if(confirm("您确定要将该商品订单取消?")){  		
	 window.location.href="/myshoppingsys/goodsServlet?flag=quxiaodindan&goodsId="+goodsId+"&loName="+loName+"&date="+date;
	   }else{
	     return;
	   }
	}
	
	
	//付款
	function fukuan(goodsId_,date_) {
	var loName= document.getElementById("loName").value;

	var goodsId = document.getElementById(goodsId_).value;
	var date = document.getElementById(date_).value;
	
	if(confirm("您确定收到该货物了吗？")){  		
	 window.location.href="/myshoppingsys/goodsServlet?flag=fukuan&loName="+loName+"&goodsId="+goodsId+"&date="+date;
	   }else{
	     return;
	   }
	}	
		
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
		
	
</script>
</head>

<body>
	<%
		String loName = (String) session.getAttribute("userNameqiantai");
		if (loName != null) {
	%>


	<table align="center">
		<div id="top" align="center">
			<tr>
				<font color="blue" size="4"> <input type="hidden" id="loName"
					value="<%=loName%>" />
					<td>订单号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>商品名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>商品单价(元)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>商品数量(件)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>购买日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>订单状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="2">操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</font>
		</div>
		</tr>


		<%
			PageBean pageBean = (PageBean) request
						.getAttribute("pageBeanzhangdan");
				if (pageBean != null) {

					List<Map<String, String>> zhangdanList = pageBean
							.getResList();
					int rows = pageBean.getRows(); //总记录数
					int pages = pageBean.getPages(); //总页数
					int nowPage = pageBean.getNowPage();//当前页

					if (zhangdanList != null && zhangdanList.size() > 0) {
		%>
		<form action="/myshoppingsys/goodsServlet" name="nextPageForm"
			method="post">
			<input type="hidden" name="flag" value="userInfozhangdan_" /> <input
				id="nextPage" type="hidden" name="nextPage" /> <input type="hidden"
				name="baseSql" value="<%=pageBean.getBaseSql()%>" />

		</form>
		<%
			int[] arr = new int[zhangdanList.size()];
						for (int i = 0; i < arr.length; i++) {
							arr[i] = i;
						}
						for (int i = 0; i < zhangdanList.size(); i++) {

							String goodscode = zhangdanList.get(i).get(
									"GOODSCODE");
							String goodsName = zhangdanList.get(i).get(
									"GOODSNAME");
							String price = zhangdanList.get(i).get("PRICE");
							String num = zhangdanList.get(i).get("GOODSCODENU");
							String state = zhangdanList.get(i).get("STATE");
							String buyDate = zhangdanList.get(i).get("BUYDATE");
		%>
		<tr>
			<font size="3">
				<td><%=goodscode%></td>
				<td><%=goodsName%></td>
				<td><%=price%></td>

				<td><%=num%></td>
				<td><%=buyDate%></td>
				<td><%=state%></td> <input type="hidden" id="price<%=arr[i]%>"
				value="<%=price%>" /> <input type="hidden" id="id<%=arr[i]%>"
				value="<%=goodscode%>" /> <input type="hidden"
				id="date<%=arr[i]%>" value="<%=buyDate%>" /> <%
 	if (state.equals("已完成")) {
 %>
				<td><a
					href="/myshoppingsys/web/pinglun.jsp?goodsId=<%=goodscode%>&goodsName=<%=goodsName%>"
					target="_parent"><input type="button" value="评论该商品" />
				</a>
			</td>
				<td><input type="button" value="退货"
					onclick="tuihuo('id<%=arr[i]%>','<%=loName%>','date<%=arr[i]%>','<%=num%>','<%=goodsName%>')" />
			</td> <%
 	} else if (state.equals("已下单")) {
 %>
				<td><input type="button" value="确认收货"
					onclick="fukuan('id<%=arr[i]%>','date<%=arr[i]%>')" />
			</td>
				<td><input type="button" value="取消订单"
					onclick="quxiaodindan('id<%=arr[i]%>','<%=loName%>','date<%=arr[i]%>')" />
			</td> <%
 	} else if (state.equals("待退货")) {
 %>
				<td><%=state%></td>
				<td><%=state%></td> <%
 	}
 %> </font>
			</div>
		</tr>

		<%
			}
		%>
		<div>
			<label style="font-size:12px; color:red">总共<%=rows%>条记录，当前为<%=nowPage%>/<%=pages%>页</label>
			<a href="javascript:void(0)" onclick="upPage(<%=nowPage%>)"
				class="next">上一页</a>&nbsp; <a href="javascript:void(0)"
				onclick="nextPage(<%=pages%>,<%=nowPage%>)" class="next">下一页</a>&nbsp;
		</div>
		<%
			} else {
		%>
		<h2 align="center">暂无任何账单记录</h2>
		<%
			}
				} else {

					request.getRequestDispatcher(
							"../goodsServlet?flag=userInfozhangdan_").forward(
							request, response);
				}
		%>

	</table>

	<%
		} else {

			request.getRequestDispatcher("enter.jsp").forward(request,
					response);

		}
	%>


</body>
</html>
