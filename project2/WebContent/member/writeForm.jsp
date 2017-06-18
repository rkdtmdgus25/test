<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src=../script/member.js></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../script/daum_post.js"></script>


</head>
<body>
<form name=writeForm method=post action=writeProc.jsp>
	<table border=1 cellpadding=3 cellspacing=0>
	<tr>
		<td>이름</td><td><input type=text size=5 name=name placeholder="이름입력"></td>
	</tr>
	<tr>
		<td>아이디</td><td><input type=text size=20 name=id id="id">
						 <input type="button" value="중복체크" onclick="javascript:checkId()">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input type=password size=20 name=pwd></td>
	</tr>
	<tr>
		<td>재확인</td><td><input type=password size=20 name=repwd></td>
	</tr>
	<tr>
		<td>성별</td><td><input type=radio value=0 name=gender checked>남
						<input type=radio value=1 name=gender>여
	</tr>	
	<tr>
		<td>이메일</td><td><input type=text name=email1>@
						<select name=email2>
							<option value=naver.com>naver.com</option>
							<option value=hanmail.net>hanmail.net</option>
							<option value=gmail.com>gmail.com</option>
						</select>
	</tr>
	<tr>
		<td>핸드폰</td><td>
						<select name=tel1>
							<option value=010>010</option>
							<option value=011>011</option>
							<option value=019>019</option>
						</select>
						-
						<input type=text name=tel2 size=4>-
						<input type=text name=tel3 size=4></td>
	</tr>
	<tr>
		<td>주소</td><td>
			<input type=text name=zipcode id="daum_zipcode" size=8>
			<input type="button" value="우편번호체크" onclick="checkPost()"><br>
			<input type=text name=addr1 id="daum_addr1" size=20><br>
			<input type=text name=addr2 id="daum_addr2" size=20><br></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
					<input type=button value=회원가입 onclick="javascript:checkWrite()">
					<input type=reset value=다시작성>
		</td>
	</tr>
	</table>
</form>
</body>
</html>