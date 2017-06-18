<%@page import="java.util.HashMap"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.dao.BoardDAO"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%
	//데이터
	request.setCharacterEncoding("UTF-8");

	int seq=Integer.parseInt(request.getParameter("seq"));
	int pg=Integer.parseInt(request.getParameter("pg"));
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	
	Map<String,String> map = new HashMap<String,String>();
	map.put("seq",seq+""); //String타입으로 변환한것임
	map.put("subject",subject);
	map.put("content",content);
	
	boardDAO.boardModify(map);
	
	//페이지이동
	response.sendRedirect("boardModify.jsp?pg="+pg);
%>