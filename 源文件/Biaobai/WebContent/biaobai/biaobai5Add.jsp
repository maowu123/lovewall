<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../Ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="<%=request.getContextPath()%>/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function aa(){
		var content=UE.getEditor('editor').getContentTxt();
		document.getElementById("hiddneContent").value=content;
	}
</script>
<title>其他类型</title>
</head>
<body>
<form action="../Biaobai5Add" method="post" onsubmit="aa()">
	<label for="name" style="float: left">表白对象</label>
		&nbsp; <input type="text" name="bobject">
		<div style="clear: both"></div>
		<label for="name" style="float: left">表白主题</label>
		&nbsp; <input type="text" name="title">
		<div style="clear: both"></div>
		<div>
			<div style="float: left;">
				<p>表白内容&nbsp;&nbsp;</p>
			</div>
			<div style="float: left;">
				<input id="hiddneContent" type="hidden" name="contentwithouthtml"
					value="">
				<textarea id="editor" style="width: 800px; height: 400px"
					name="content"></textarea>
				<script type="text/javascript" charset="utf-8">
						UE.getEditor('editor');
				</script>
			</div>
		</div>
		<br />
		<div style="clear: both">
			<div style="float: left;">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			</div>
			<br /> <input class="btn btn-primary" type="submit" value="表白">
		</div>
</form>
</body>
</html>