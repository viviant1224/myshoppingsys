<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.com.shxt.service.GoodsService"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人消息</title>
<script type="text/javascript">
	//实现全选
	function checkAllDemo() {
		var checkAllNode = document.getElementById("checkAll");
		var intetestNodes = document.getElementsByName("xiaoxiid");
		for ( var i = 0; i < intetestNodes.length; i++) {
			intetestNodes[i].checked = checkAllNode.checked;

		}
	}
	//批量删除消息
	function delByBatch() {
		//创建js数组
		var xiaoxiidsArray = new Array();
		var xiaoxiidArray = document.getElementsByName("xiaoxiid");

		var flag = true;

		for ( var i = 0; i < xiaoxiidArray.length; i++) {
			if (xiaoxiidArray[i].checked) {

				var xiaoxiid = xiaoxiidArray[i].value;

				//将选中的用户id放入数组
				xiaoxiidsArray.push(xiaoxiid);

				flag = false;
			}
		}

		if (flag) {
			alert("请选择要删除的记录！");
		} else {

			if (confirm("您确定要删除所选记录?")) {

				window.location.href = "/myshoppingsys/goodsServlet?flag=delxiaoxiBatch&xiaoxiidsArray="
						+ xiaoxiidsArray.join(",");
			} else {
				return;
			}

		}

	}
	//  全部标为已读 

	function biaojiByBatch() {
		//创建js数组
		var xiaoxiidsArray = new Array();
		var xiaoxiidArray = document.getElementsByName("xiaoxiid");

		var flag = true;

		for ( var i = 0; i < xiaoxiidArray.length; i++) {
			if (xiaoxiidArray[i].checked) {

				var xiaoxiid = xiaoxiidArray[i].value;

				//将选中的用户id放入数组
				xiaoxiidsArray.push(xiaoxiid);

				flag = false;
			}
		}

		if (flag) {
			alert("请选择要标记的记录！");
		} else {

			if (confirm("您确定要标记所选记录?")) {

				window.location.href = "/myshoppingsys/goodsServlet?flag=biaojiBatch&xiaoxiidsArray="
						+ xiaoxiidsArray.join(",");
			} else {
				return;
			}

		}

	}
	//单个标记已读
	function biaojiyidu(xiaoxiid) {

		window.location.href = "/myshoppingsys/goodsServlet?flag=biaojiyidu&xiaoxiid="
				+ xiaoxiid;

	}

	function deletexiaoxi(xiaoxiid) {

		if (confirm("确定删除该消息?")) {
			window.location.href = "/myshoppingsys/goodsServlet?flag=deletexiaoxi&xiaoxiid="
					+ xiaoxiid;
		} else {
			return;
		}

	}
</script>
</head>
<body>
	<%
		String loName = (String) session.getAttribute("userNameqiantai");
		if (loName != null) {
			GoodsService service = new GoodsService();
			String sql = "select * from SHOPGERENXIAOXI t where BUYNAME = '"
					+ loName + "' order by time_ desc";
			List<Map<String, String>> xiaoxiList = service.query(sql);
	%>



	<table border="1" cellpadding="0" cellspacing="0" color="blue">
		<tr>
			<input type="button" value="标为已读" onclick="biaojiByBatch()()" />
			<input type="button" value="删除" onclick="delByBatch()" />
			<td align="center"><input type="checkbox" name="checkAll"
				id="checkAll" value="" onclick="checkAllDemo()" /> 全选</td>
			<td align="center">消息</td>
			<td align="center">推送时间</td>
			<td colspan="2" align="center">操作</td>
		</tr>
		<%
			if (xiaoxiList.size() != 0) {
					for (int i = 0; i < xiaoxiList.size(); i++) {
						String state1 = xiaoxiList.get(i).get("STATE1");
						String state2 = xiaoxiList.get(i).get("STATE2");
						String goodsname = xiaoxiList.get(i).get("GOODSNAME");
						String buydate = xiaoxiList.get(i).get("BUYDATE");
						String time = xiaoxiList.get(i).get("TIME_");
						String xiaoxiid = xiaoxiList.get(i).get("ID");
		%>
		<tr>


			<%
				if (!goodsname.equals("无")) {

								if (state2.equals("未读")) {
			%>
			<td bgcolor="#CCCCCC"><input type="checkbox" name="xiaoxiid"
				value="<%=xiaoxiid%>" /></td>
			<td bgcolor="#CCCCCC">您于<%=buydate%>购买的<b><%=goodsname%></b><font
				color="red"><%=state1%></font>,详情请咨询18686672327。</td>
			<td bgcolor="#CCCCCC"><%=time%></td>
			<td bgcolor="#CCCCCC"><input type="button" value="标为已读"
				onclick="biaojiyidu('<%=xiaoxiid%>')" /></td>
			<td bgcolor="#CCCCCC"><input type="button" value="删除"
				onclick="deletexiaoxi('<%=xiaoxiid%>')" /></td>
			<%
				} else {
			%>
			<td><input type="checkbox" name="xiaoxiid" value="<%=xiaoxiid%>" />
			</td>
			<td>您于<%=buydate%>购买的<b><%=goodsname%></b><font color="red"><%=state1%></font>,详情请咨询18686672327。</td>
			<td><%=time%></td>
			<td>已标记为已读</td>
			<td><input type="button" value="删除"
				onclick="deletexiaoxi('<%=xiaoxiid%>')" /></td>
			<%
				}
						} else {

								if (state2.equals("未读")) {
			%>
			<td bgcolor="#CCCCCC"><input type="checkbox" name="xiaoxiid"
				value="<%=xiaoxiid%>" /></td>
			<td bgcolor="#CCCCCC">回复您的留言：<%=state1%></td>
			<td bgcolor="#CCCCCC"><%=time%></td>
			<td bgcolor="#CCCCCC"><input type="button" value="标为已读"
				onclick="biaojiyidu('<%=xiaoxiid%>')" /></td>
			<td bgcolor="#CCCCCC"><input type="button" value="删除"
				onclick="deletexiaoxi('<%=xiaoxiid%>')" /></td>
			<%
				} else {
			%>
			<td><input type="checkbox" name="xiaoxiid" value="<%=xiaoxiid%>" />
			</td>
			<td><%=state1%></td>
			<td><%=time%></td>
			<td>已标记为已读</td>
			<td><input type="button" value="删除"
				onclick="deletexiaoxi('<%=loName%>','<%=time%>')" /></td>
			<%
				}
							}
			%>
		</tr>
		<%
			}
		%>
		<%
			} else {
		%>
		<h1>暂无任何消息</h1>

		<%
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
