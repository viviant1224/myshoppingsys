<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小威少威网上商城</title>
<link href="/myshoppingsys/web/style/styles.css" rel="stylesheet"
	type="text/css" />
	<link rel="stylesheet" href="/myshoppingsys/kingEditor/themes/default/default.css" />
	<link rel="stylesheet" href="/myshoppingsys/kindEditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="/myshoppingsys/kindEditor/kindeditor.js"></script>
	<script charset="utf-8" src="/myshoppingsys/kindEditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="/myshoppingsys/kindEditor/plugins/code/prettify.js"></script>
	
	
	
	<link rel="stylesheet" href="styles/detail.css" type="text/css" />
	<link rel="stylesheet" href="styles/skin/skin_0.css" type="text/css" id="cssfile" />
	<link rel="stylesheet" href="styles/thickbox.css" type="text/css" />
	<script src="/myshoppingsys/scripts/jquery-1.3.1.js" type="text/javascript"></script>
	<script src="/myshoppingsys/scripts/use_jqzoom.js" type="text/javascript"></script>
	<script src="/myshoppingsys/scripts/jquery.jqzoom.js" type="text/javascript"></script>
	
	
 <script type="text/javascript">
 
		 

	


  	 var editor1;
		KindEditor.ready(function(K) {
		    //“content1”  就是form表单中的textarea的name属性值 
			editor1 = K.create('textarea[name="content1"]', {
				cssPath : 'kindEditor/plugins/code/prettify.css', 
				uploadJson : 'kindEditor/jsp/upload_json.jsp', 
				fileManagerJson : 'kindEditor/jsp/file_manager_json.jsp',  
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
					  //“example”  就是form表单的name属性值 
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		//判断表单是否可以提交 
		function subForm(){
		
			if(editor1.isEmpty()){
			 alert("内容不能为空!");
			
		     return false;
			} else {
				return true;
			}
		}

	
	
	
	
</script>
</head>

<%
	
	String buyname = "";
	buyname = new String(request.getParameter("buyname").getBytes("iso-8859-1"),"UTF-8");
	String liuyandate_ = request.getParameter("liuyandate_");
	

 %>
<body>
<div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</div>
<br/>
<P>
	留言人：<%=buyname %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	留言日期：<%=liuyandate_ %>
	</P>
		<form id="myForm" name="example" method="post" action="/myshoppingsys/UserServlet?flag=huifupinglun"   onsubmit="return subForm()">
		<textarea name="content1" cols="100" rows="30" id="content"  style="width:700px;height:200px;visibility:hidden;"></textarea>
		<br/>
		<input type="hidden" name="buyname" value="<%=buyname %>"/>
		<input type="hidden" name="liuyandate_" value="<%=liuyandate_ %>"/>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<p align="right"><input type="submit" name="button" value="回复" /> <a name="chat">(提交快捷键: Ctrl + Enter)</a></p>
	</form>
			
	
	
</body>
</html>
