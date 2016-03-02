<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	System.out.println("path:"+path);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改商品</title>
</head>
<script language="javascript" type="text/javascript" src="/myshoppingsys/admin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/myshoppingsys/admin/js/upload.js"> </script>
 <script src="/myshoppingsys/admin/js/jquery-1.8.3.js" type="text/javascript"></script>
 <script type="text/javascript" src="/myshoppingsys/admin/js/validate.js"></script>
 
 <style type="text/css">
	#div1{
		margin-top:40px;
		
		padding-top:20px;
		padding-bottom:20px;
		
		}	

	table tr{
	bordercolor="#0066FF";
	
	}




</style>
 
  
 
<%
 	 List<Map<String, String>>  goodsList=(List<Map<String, String>>)request.getAttribute("goodsList");
     if(goodsList!=null&&goodsList.size()>0){
    	 Map<String, String> goodsMap=goodsList.get(0);
    	 
    	 String goodsName = goodsMap.get("GOODSNAME");
    	 String discount = goodsMap.get("DSCOUNT");
    	 String pinpai = goodsMap.get("PINPAI");
    	 String category = goodsMap.get("CATEGORY");
    	 String update_ = goodsMap.get("UPDATE_");
    	 String color = goodsMap.get("COLOR");
    	 String firstPrice = goodsMap.get("FIRSTPRICE");
    	 String guige = goodsMap.get("GUIGE");
    	 String price = goodsMap.get("PRICE");
    	 String num = goodsMap.get("NUM");
    	 String img = goodsMap.get("IMG");
    	 String proArea = goodsMap.get("PROAREA");
    	 String info = goodsMap.get("INFO");
    	 
    %>




<body>

	
    <div align="center" id="div1" >
    
    <table align="center"  bordercolor="#0099FF"  id="table" cellspacing="0px" >
   
    	<tr>
        	<td>商品名：</td>
        	
        	<td><label><%=goodsName %></label></td>
        	<td>折扣：</td>
        	<td><label><%=discount %></label></td>
            <td>品牌：</td>
            <td><label><%=pinpai %></label></td>
        
        </tr>
   		
    	<tr>
        	<td>类别：</td>
        	<td><label><%=category %></label></td>
        	<td>出产日期：</td>
        	<td><label><%=update_ %></label></td>
            <td>颜色：</td>
            <td><label><%=color %></label></td>
        
        </tr>

    	<tr>
        	<td>进价：</td>
        	<td><label><%=firstPrice %>元</label></td>
        	<td>产地：</td>
        	<td><label><%=proArea %></label></td>
            <td>规格、参数：</td>
            <td ><label><%=guige %></label></td>
        
        </tr>
    
    	<tr>
        	<td>售价：</td>
        	<td><label><%=price %>元</label></td>
        	<td>入库件数：</td>
        	<td><label><%=num %>件</td>
            
       
        	<td>图片：</td>
        	<td colspan="2"><img  src="<%=path%>/upload/<%=img %>" width="300px" height="350px" alt="图片" /></td>
        	
        </tr>
        
        <tr>
            <td>商品介绍：</td>
            <td rowspan="5"><label><%=info %></label></td>
        
        </tr>
    
    </table>
    </div>
    






</body>
<%
	} 
%>

</html>
