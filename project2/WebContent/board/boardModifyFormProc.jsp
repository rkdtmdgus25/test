<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="board.bean.BoardDTO" %>

<%
	//데이터받음
	int seq=Integer.parseInt(request.getParameter("seq"));
	int pg=Integer.parseInt(request.getParameter("pg"));
	//DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardDTO boardDTO=boardDAO.boardView(seq); //select 문을 갖고있는 메서드
	
	//데이터 실는다.
	request.setAttribute("pg", pg);
	request.setAttribute("boardDTO", boardDTO);
	
	//페이지이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("boardModifyForm.jsp");
	dispatcher.forward(request, response);
%>