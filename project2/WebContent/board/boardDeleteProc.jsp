<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>

<%
	int seq=Integer.parseInt(request.getParameter("seq"));
	
	//db
	BoardDAO boardDAO= BoardDAO.getInstance();
	boardDAO.boardDelete(seq);
	//페이지이동
	response.sendRedirect("boardDelete.jsp");
%>