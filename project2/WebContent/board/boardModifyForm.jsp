<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function checkBoardModify(){
		var subject=document.boardModifyForm.subject.value;
		if(subject==""){
			alert("제목넣어라");
		}
		else if(document.boardModifyForm.content.value=="")
			alert("내용넣어라");
		else
			document.boardModifyForm.submit();
	}
</script>

</head>
<body>
<form name=boardModifyForm method=post action="boardModifyProc.jsp">
<input type="hidden" name="seq" value="${boardDTO.seq }">
<input type="hidden" name="pg" value="${pg }">


	<table border=1 cellpadding=3 cellspacing=0>
		<tr>
			<td width=50>제목</td><td><input type=text name=subject size=25 value="${boardDTO.subject }"></td>
		</tr>
		<tr>
		 	<td>내용</td><td><textarea cols=50 rows=15 name=content>${boardDTO.content}</textarea></td>
		</tr>
		<tr>
			<td colspan=2 align=center>
						  <input type=button onclick="checkBoardModify()" value="글수정">
						  <input type=reset value=다시작성></td>
		</tr>
			
	</table>
</form>

</body>
</html>