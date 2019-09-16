<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai4"%>
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
	Biaobai4 biaobai4=DaoFactory.getBiaobai4Dao().getById(id);
%>
	<div align="center">
			姓名<%=biaobai4.getName()%><br>
			性别<%=biaobai4.getGender()%><br>
			学院<%=biaobai4.getDepartment()%><br>
			年级<%=biaobai4.getGrade()%><br>
			联系方式<%=biaobai4.getContact()%><br>
			性格描述<%=biaobai4.getCharacter()%><br>
			个人爱好<%=biaobai4.getPreference()%><br>
			家庭住址<%=biaobai4.getAddress()%><br>
			喜欢的类型<%=biaobai4.getFavoredType()%><br>
			<%
			int hashcode = biaobai4.getPhoto().hashCode();
	        int dir1 = hashcode&0xf;  //0--15
	        int dir2 = (hashcode&0xf0)>>4;  //0-15 %>
			照片<br><img alt="" src="<%=request.getContextPath()%>/fileUpload/<%=dir1+"/" + dir2 + "/" %><%=biaobai4.getPhoto()%>"
			style="border: 0px solid black;width:150px;"><br>
	</div>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>