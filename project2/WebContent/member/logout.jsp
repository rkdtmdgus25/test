<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
/*
	Cookie[] ar = request.getCookies();
	if(ar!=null){
		for(int i=0;i<ar.length;i++){
			if(ar[i].getName().equals("memId")){
				ar[i].setMaxAge(0); //쿠키삭제 
				response.addCookie(ar[i]);//클라이언트에게 저장
			}else if(ar[i].getName().equals("memName")){
				ar[i].setMaxAge(0);
				response.addCookie(ar[i]);
			}
				
		}
	}
	*/
	
	//세션
	session.removeAttribute("memId");
	session.removeAttribute("memName");
	
	session.invalidate(); //모든 세션 제거
%>
<html>
<head>
<script type="text/javascript">
	window.onload=function(){
		alert("로그아웃");
		location.href='../main/index.jsp';
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>