<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai3"%>
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
	Biaobai3 biaobai3=DaoFactory.getBiaobai3Dao().getById(id);
%>
	<div align="center">
		表白对象：<%=biaobai3.getRoommateName() %>
		性别<%=biaobai3.getGender()%><br>
		学院<%=biaobai3.getDepartment()%><br>
		年级<%=biaobai3.getGrade()%><br>
		舍友联系方式<%=biaobai3.getContact()%><br>
		想说的话：<%=biaobai3.getContent() %>
	</div>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>