<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@page import="board.bean.BoardDTO" %>
<%
	int pg=Integer.parseInt(request.getParameter("pg"));
	//한페이지당 5개씩 추출하기위한...
	int endNum=pg*5;
	int startNum=endNum-4;
	
	//db
	BoardDAO boardDAO=BoardDAO.getInstance();
	ArrayList<BoardDTO> list=boardDAO.boardList(startNum,endNum);//한줄씩 BoardDTO 담아오며, 여러개를 list에 넣어온다.
	
	//페이징처리
	int totalA=boardDAO.getTotalArticle();
	int totalP=(totalA+4)/5;
	//페이지 이동 - forward와 같은 의미
	request.setAttribute("pg", pg); //request에 데이터 실어서 넘김 이름은pg로 pg값을 보냄
	request.setAttribute("list", list);
	request.setAttribute("totalP", totalP);
	RequestDispatcher dispatcher = request.getRequestDispatcher("boardList.jsp");
	//제어권넘기기
	dispatcher.forward(request, response);
%>
<%-- <jsp:forward page="boardList.jsp"/> --%> 