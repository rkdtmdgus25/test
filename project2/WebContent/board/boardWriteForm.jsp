<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function checkBoardWrite(){
		var subject=document.boardWriteForm.subject.value;
		if(subject==""){
			alert("제목넣어라");
		}
		else if(document.boardWriteForm.content.value=="")
			alert("내용넣어라");
		else
			document.boardWriteForm.submit();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name=boardWriteForm method=post action="boardWriteProc.jsp">
	<table border=1 cellpadding=3 cellspacing=0>
		<tr>
			<td width=50>제목</td><td><input type=text name=subject size=25></td>
		</tr>
		<tr>
			<td>내용</td><td><textarea cols=50 rows=15 name=content></textarea></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
						  <input type=button onclick="checkBoardWrite()" value="글쓰기">
						  <input type=reset value=다시작성></td>
		</tr>
			
	</table>
</form>
</body>
</html>