<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
	<h3>변수설정</h3>
	<c:set var="name">홍길동</c:set>
	<c:set var="age" value="25" />
	나의 이름은 ${name } 입니다<br>
	내 나이는 <c:out value="${age }">살입니다.</c:out><br>
	나의 키는 ${height } 입니당.
	
<h3>** forEach **</h3>
<c:forEach var="i" begin="1" end="10" step="1">
	${i }
	<c:set var="sum" value="${sum+i }" />
</c:forEach>
<br>
	1 ~ 10 까지의 합 = ${sum }
<br><Br>
	
<c:forEach var="i" begin="1" end="11" step="1">
	${11-i }
</c:forEach><br>	
	
	
		<c:set var="ar" value="10,20,30,40,50" />
		<c:forEach var="data" items="${ar}">
			${data} &nbsp;&nbsp;
		</c:forEach>
		
<h3>** 문자열분리 **</h3>
<c:forTokens var="car" items="소나타,그랜저,아우디,링컨,페라리" delims=",">
	${car }<br>
</c:forTokens>

<h3>** if **</h3>
<c:set var="age" value="15" />
나의 나이는 ${age }살 이므로 
<c:if test="${age>=20 }">성인</c:if>임
<c:if test="${age<20 }">청소년</c:if>임

<h3>** 다중 if **</h3>

<c:set var="color" value="red,green,blue,magenta,cyan"></c:set>
<c:forEach var="data" items="${color }" varStatus="i">
	index=${i.index } &nbsp;&nbsp; count=${i.count }
	<c:choose>
		<c:when test="${data=='red'}">빨강</c:when>
		<c:when test="${data=='green'}">초록</c:when>
		<c:when test="${data=='blue'}">파랑</c:when>
		<c:when test="${data=='magenta'}">핑크</c:when>
		<c:otherwise>하늘</c:otherwise>
	</c:choose>
	<br>
</c:forEach>


</body>
</html>