<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="../image/a.gif" onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
	<%
		//String id =request.getParameter("id");
		//String name=request.getParameter("name");
	%>
	${sessionScope.memId }님이 로그인<br>
	${memName }님이 로그인<br><br>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
</body>
</html>