<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai2"%>
<%@page import="java.util.List"%>
<%@page import="org.java.dao.impl.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详细信息</title>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	Biaobai2 biaobai2=DaoFactory.getBiaobai2Dao().getById(id);
%>
	<div align="center">
		性别:<%=biaobai2.getGender()%><br>
		我的联系方式:<%=biaobai2.getContact()%><br>
		表白的话：<%=biaobai2.getContent() %>
	</div>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>