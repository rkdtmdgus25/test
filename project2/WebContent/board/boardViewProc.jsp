<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>

<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

//DB
BoardDAO boardDAO = BoardDAO.getInstance();

boardDAO.updateHit(seq);//조회수

BoardDTO boardDTO = boardDAO.boardView(seq);

//페이지 이동
request.setAttribute("pg", pg);
request.setAttribute("boardDTO", boardDTO);

RequestDispatcher dispatcher = request.getRequestDispatcher("boardView.jsp");
dispatcher.forward(request, response);
	
%>