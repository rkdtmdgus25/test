<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.bean.BoardDTO,board.dao.BoardDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	int su=0;
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//데이터 얻어옴
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	//세션으로부터 얻어옴
	String id=(String)session.getAttribute("memId"); 
	String name=(String)session.getAttribute("memName");
	String email=(String)session.getAttribute("memEmail"); 
	
	//DTO 데이터 저장
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	
	//DB연동
	BoardDAO boardDAO = BoardDAO.getInstance();  
	boardDAO.boardWrite(boardDTO);
	
	response.sendRedirect("boardWrite.jsp");
%>