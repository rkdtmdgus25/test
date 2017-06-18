<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../script/member.js"> 
</script>
</head>
<body>
	<form name=loginForm method=post action=login.jsp>
	<table>
	<tr>
		<td>아이디</td><td><input type=text size=20 name=id></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input type=password size=20 name=pwd></td>
	</tr>
	<tr>
		<td colspan=2>
		<input type=button value=로그인 onclick="javascript:checklogin()">
		<input type=button value=회원가입 onclick="javascript:location.href='writeForm.jsp'">
		</td>
	</tr>
	</table>
	</form>
</body>
</html>