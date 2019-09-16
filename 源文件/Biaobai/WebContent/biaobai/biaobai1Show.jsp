<%@page import="org.java.helper.ClassifyCommentAndReply"%>
<%@page import="org.java.pojo.Reply"%>
<%@page import="org.java.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.java.pojo.Biaobai1"%>
<%@page import="java.util.List"%>
<%@page import="org.java.dao.impl.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
ul li{
	list-style-type: none; /*先去掉黑点*/
	margin-bottom:20px;
}

</style>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$("button").click(function(){
	    $(this).attr("disabled","disabled");    
	});
	var kind;var type;var messageId;var replyId;var toUId;var fromUId;
	function addComment(btn,kind_tmp,type_tmp,messageId_tmp,replyId_tmp,toUId_tmp,fromUId_tmp){
		kind=kind_tmp;
		type=type_tmp;
		messageId=messageId_tmp;
		replyId=replyId_tmp;
		toUId=toUId_tmp;
		fromUId=fromUId_tmp;
		//alert("kind:"+kind);
		//alert("fromUId_tmp:"+fromUId_tmp);
		var div=btn.parentNode;
		div.parentNode.innerHTML+=
			"<form action='../CommentForBai1Add' method='post' onsubmit='getValue()'>"
			+"<input type='text' name='content' style='width:800px;height:25px;margin:10px 0px 0px 10px;'>"
			+"<input type='hidden' id='messageId' name='messageId' value=''>"
			+"<input type='hidden' id='kind' name='kind' value=''>"
			+"<input type='hidden' id='type' name='type' value=''>"
			+"<input type='hidden' id='replyId' name='replyId' value=''>"
			+"<input type='hidden' id='fromUId' name='fromUId' value=''>"
			+"<input type='hidden' id='toUId' name='toUId' value=''>"
			+"<input type='submit' value='评论'>"
			+"</form>";
	}
	function getValue(){
		//alert(kind);
		document.getElementById('replyId').value=replyId;
		document.getElementById('fromUId').value=fromUId;
		document.getElementById('toUId').value=toUId;
		document.getElementById('kind').value=kind;
		document.getElementById('type').value=type;
		document.getElementById('messageId').value=messageId;
	}
	
	function addReply(){
		document.getElementById("RepContent").innerHTML+=
			"<form action='' method='post'><input type='text' name='accessoryfile'/>"
			+"<input type='button' value='评论' >"
			+"</form>";
	}
</script>
<title>详细信息</title>
</head>
<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	Biaobai1 biaobai1=DaoFactory.getBiaobai1Dao().getById(id);
	User loginUser=(User)session.getAttribute("loginUser");
	SimpleDateFormat format=new SimpleDateFormat("MM-dd");
%>
	<div style="position:relative;z-index:1;float:left;width:80%;
		background:#FFEFD5;margin:5px 5px 5px 5px;padding:15px 15px 15px 15px;
	">
		<div style="width:100%;"><!-- 一条表白 -->
				<div style="margin:5px 5px 5px 5px;"><!-- 头像和用户名 -->
					<div style="width:45px;height:45px;border-radius:100%;overflow:hidden;float:left;">
					<img src="../ShowMore/a.jpg" width="45" height="45"/></div>
					<!--  -->
					<div style="height:45px;float:left;padding:10px;"><%=biaobai1.getUsername() %></div>
				</div>
				<div style="margin:5px 5px 5px 5px;clear:both;"><!-- 文字 clear:both可以清除上面左浮动对下面的影响 -->
				我要表白<%=biaobai1.getDepartment() %>的<a href=""><%=biaobai1.getLovename() %></a><%=biaobai1.getGender() %><br>
				我想说:
				<%=biaobai1.getContent()%><br>
				</div>
				<div style="clear:both;">
				点赞数量：<%=biaobai1.getLiketimes()%>&nbsp;&nbsp;&nbsp;&nbsp;评论数量：<%=biaobai1.getComtimes() %>&nbsp;&nbsp;&nbsp;&nbsp;表白日期：<%=format.format(biaobai1.getIssuedate()) %>
				</div><hr>
				<div style="margin:10px 10px 10px 10px;">
				<h3>评论</h3>
				<form action="<%=request.getContextPath() %>/CommentForBai1Add" method="post">
					<input type="hidden" name="kind" value="1"/><!-- 类型1是评论，2是回复 -->
  					<input type="hidden" name="type" value="<%=biaobai1.getType()%>"/>
  					<input type="hidden" name="messageId" value="<%=id%>"/><!-- 表白id和那个类型的表白 -->
  					<input type="hidden" name="toUId" value="<%=biaobai1.getUsername()%>"/><!-- 表白id和那个类型的表白 -->
  					<input type="hidden" name="fromUId" value="<%=loginUser.getUsername()%>">
  					<input type="hidden" name="replyId" value="<%=id %>">
  					<!-- 获得当前登录的用户的头像 -->
  					<div style="width:45px;height:45px;border-radius:100%;overflow:hidden;float:left;">
					<img src="a.jpg" width="45" height="45"/></div>
  					<input type="text" name="content" style="width:800px;height:25px;margin:10px 0px 0px 10px;" required>
  					<input type="submit" value="评论">
				</form>
				</div><hr>
				<div id="ComContent" style="clean:both;margin:10px 50px 0px -20px;">
				<ul><%
				//查询出这条表白的所有的评论，根据表白类型，
			  	List<Reply> comsAndReply = DaoFactory.getReplyDao().list(id,biaobai1.getType());
			  	List<Reply> comments =ClassifyCommentAndReply.GetComment(comsAndReply);
			  	List<Reply> replys =null;
	  			for(Reply reply:comments){//所有的评论
	  				replys =ClassifyCommentAndReply.GetReply(comsAndReply,reply.getId());
	  		 	%>
  		 		<li><div style="clear:both;">
  		 		<!-- 获得当前登录的用户的头像 -->
  					<div style="width:45px;height:45px;border-radius:100%;overflow:hidden;float:left;">
					<img src="a.jpg" width="45" height="45"/></div>
				<div style="float:left;">
					<%=reply.getFrom_uid()%>：<%=reply.getContent() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=reply.getId()%>
	  		 		
  					<%=format.format(reply.getPostDate()) %>
  				<!-- 评论还是回复、表白类型、表白id、评论或回复id、目标用户、动作用户 -->
  				<button id="button" style="float:right;" onclick="addComment(this,'2','<%=biaobai1.getType()%>','<%=id%>','<%=reply.getId()%>','<%=reply.getFrom_uid()%>','<%=loginUser.getUsername()%>')">回复</button>
  		 		
  		 		<div  style="clear:both;float:none;"><%
	  		 			for(Reply reply2:replys){//这条评论对应的回复
	  		 				%><div style="margin:10px 10px 10px 10px;margin-left:20px;">
	  		 				<%=reply2.getFrom_uid() %>回复<%=reply2.getTo_uid() %>:
	  		 					<%=reply2.getContent() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		 					<button style="float:right;" onclick="addComment(this,'2','<%=biaobai1.getType()%>','<%=id%>','<%=reply.getId()%>','<%=reply2.getFrom_uid()%>','<%=loginUser.getUsername()%>')">回复</button>
	  		 				</div>
	  		 					
	  		  		 		<%
	  		 			}
	  		 		%></div>
  		 		</div></div></li>
  				<%
  				}
  				%></ul>
				</div>
		</div>
	</div>
	</div>
</body>
</html>