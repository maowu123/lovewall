package org.java.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.dao.impl.DaoFactory;
import org.java.pojo.Reply;
import org.java.pojo.User;


@WebServlet("/CommentForBai1Add")
public class CommentForBai1Add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String messageId=request.getParameter("messageId");
		int kind=Integer.parseInt(request.getParameter("kind"));
		int type=Integer.parseInt(request.getParameter("type"));
		Reply reply=new Reply();
		reply.setType(type);
		reply.setMessage_id(Integer.parseInt(messageId));
		reply.setKind(kind);
		reply.setFrom_uid(request.getParameter("fromUId"));
		reply.setTo_uid(request.getParameter("toUId"));
		reply.setReply_id(Integer.parseInt(request.getParameter("replyId")));//
		reply.setContent(request.getParameter("content"));
		reply.setPostDate(new Timestamp(System.currentTimeMillis()));
		reply.setReaded(0);
		DaoFactory.getReplyDao().add(reply);
		response.sendRedirect(request.getContextPath()+"/biaobai/biaobai"+type+"Show.jsp?id="+messageId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
