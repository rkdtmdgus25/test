<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	***메인화면***<br><br>
	<%if(session.getAttribute("memId")==null){ %>
	<a href="../member/writeForm.jsp">회원가입</a><br>
	<a href="../member/loginForm.jsp">로그인</a><br>
	<%}else{ %>
	<a href="../member/logout.jsp">로그아웃</a><br>
	<a href="../board/boardWriteForm.jsp">글쓰기</a>
	<%} %>
	<br><br><BR>
	<a href="../board/boardListProc.jsp?pg=1"><h3>목 록</h3></a>
</body>
</html>