<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id=request.getParameter("id");

	//DB
	MemberDAO memberDAO=MemberDAO.getInstance();
	boolean exist=memberDAO.isExistId(id); //메서드를 만든다. 사용가능,불가만 알려주기때문
	
%>
<html>
<head>
<script type="text/javascript"> 
function checkIdClose(){
	//opener.writeForm.id.value = '<%=id %>';
	opener.document.getElementById("id").value = '<%=id%>';
	window.close();
	opener.writeForm.pwd.focus();
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name=form method=post action=checkId.jsp>
	<%if(exist){ //아이디가 이미 있을때 true%> 
		<%=id %>는 <font color="red">사용 불가능합니다.</font>
		<br><br>
		아이디 <input type=text name=id>
		<input type=submit value=중복체크>
	<%}else{ %>
		<%=id %>는 <font color="blue">사용 가능합니다.</font>
		<br><br>
		<input type="button" value="사용하기" onclick="javascript:checkIdClose()">
	<%} %>
</form>
</body>
</html>