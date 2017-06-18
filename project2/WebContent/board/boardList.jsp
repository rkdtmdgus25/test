<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.currentPaging{
		color:red;
		text-decoration: underline;
	}
	.paging{
		color:black;
		text-decoration: none;
	}
	#subjectA:link{
		color:black;
		text-decoration: none; 
	}
	#subjectA:visited{
		color:black;
		text-decoration: none;
	}
	#subjectA:hover{
		color:green;
		text-decoration: underline;
	}
	#subjectA:active{
		color:black;
		text-decoration: none;
	}
</style>


<script type="text/javascript">
function isLogin(memId,seq){
	if(memId=="")	
		alert(memId+","+seq+" 먼저로그인하세요");
	else
		location.href="boardViewProc.jsp?seq="+seq+"&pg=${requestScope.pg}";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${list!=null }">
<table border="1" cellpadding="3" cellspacing="0">
<tr>
	<th width="100">글번호</th><!-- 굵게,가운데 -->
	<th width="300">제목</th>
	<th width="100">작성자</th>
	<th width="100">작성일</th>
	<th width="100">조회수</th>
</tr>

<c:forEach var="boardDTO" items="${list }">

<tr>                                          
	<td align="center">${boardDTO.seq }</td>
	
	<td><a href="#" id="subjectA" onclick="isLogin('${sessionScope.memId }',${boardDTO.seq })">
	${boardDTO.subject }</a></td>
	
	
	
	<td align="center">${boardDTO.id }</td>
	<td align="center">${boardDTO.logtime }</td>
	<td align="center">${boardDTO.hit }</td>
</tr>
</c:forEach>
</table>
</c:if>
		
		<div style="border:1px; text-align:center; width:740px;">
		
		
<!-- 페이징처리 -->
<div style="text-align: center; width:740px; ">

<c:forEach var="i" begin="1" end="${totalP }" step="1">
	<c:if test="${i==pg }">
		[ <a href="boardListProc.jsp?pg=${i }" class="currentPaging">${i }</a> ]
	</c:if>
	
	<c:if test="${i!=pg }">
		[ <a href="boardListProc.jsp?pg=${i }" class="paging">${i }</a> ]
	</c:if>
</c:forEach>

</div>
</body>
</html>