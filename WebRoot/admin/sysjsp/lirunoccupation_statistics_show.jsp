<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.shxt.utils.*,java.net.URLEncoder"%>
<%@ page import="cn.com.shxt.utils.DBUtil"%>
<% 

	DBUtil du = new DBUtil();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ChartTools gt = new ChartTools();
LinkedList<Map<String, Object>> rsList = gt.loadlirun();

//获取图形类别
String graph = request.getParameter("graph");

System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~ jsp graph is : " + graph);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>利润统计</title>
<link href="/myshoppingsys/admin/style/main1.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="right">
		<div class="main">
			<table cellpadding="0" height="100%" cellspacing="0" border="1" class="table_list1">
				<colgroup>
					<col width="100%" />
				</colgroup>
				<tbody>
					<tr>
						<th align="center">统计图标</th>
					</tr>
					<tr>
						<th>
						<%
						StringBuffer strBuf = new StringBuffer();
						strBuf.append("<chart caption='' showNames='1' decimalPrecision='0'>");
						for (int i = 0; i < rsList.size(); i++) {
							Map<String, Object> rsMap = rsList.get(i);//totalNum ,totalNum ,user_sex
							Object key_ = rsMap.get("GOODSCODE");
							
							String value_ = (String)rsMap.get("SUM(GOODSCODENU)");
							String sqlliru = "select *from SHOPGOODS where ID='"+(String)key_+"'";
							List<Map<String,String>> goodsList = du.queryByList(sqlliru);
							String key = goodsList.get(0).get("GOODSNAME");
							String price = goodsList.get(0).get("PRICE");
							String firstprice = goodsList.get(0).get("FIRSTPRICE");
							double value = (Double.parseDouble(price)-Double.parseDouble(firstprice))*(Integer.parseInt(value_));
							System.out.println(key+"----------"+value);
							strBuf.append("<set label='" + key + "' value='" + value + "' />");
							System.out.println(key+"----"+value);
						}
						strBuf.append("</chart>");
						String graphType = "../Includes/swf/" + graph + ".swf";
						String str_xml="";
						//中文乱码的解决 
						str_xml=URLEncoder.encode(strBuf.toString(),"UTF-8");
						%> 
						<jsp:include page="../Includes/jsp/FusionChartsHTMLRenderer.jsp" flush="true"  >
					    	<jsp:param name="chartSWF" value="<%=graphType %>"/>
							<jsp:param name="strURL" value="" /> 
							<jsp:param name="strXML" value="<%=str_xml %>" /> 
							<jsp:param name="chartId" value="accounts_code" /> 
							<jsp:param name="chartWidth" value="820" /> 
							<jsp:param name="chartHeight" value="287" /> 
							<jsp:param name="debugMode" value="false" /> 	 
						</jsp:include>
					</th>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>