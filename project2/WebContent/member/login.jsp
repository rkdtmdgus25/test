<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO,java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//DB-select
	//MemberDAO memberDAO = new MemberDAO();
	MemberDAO memberDAO = MemberDAO.getInstance(); 
	Map<String,String> map =memberDAO.login(id,pwd); //결과값을 map으로 받고, login에 id와 pwd를 넘겨줌.
	
%>


	<%if(map!=null){ %>
		<%	//세션
		session.setAttribute("memId", id);
		session.setAttribute("memName", map.get("name"));
		session.setAttribute("memEmail", map.get("email1")+"@"+map.get("email2"));
			
		response.sendRedirect("loginOk.jsp");//페이지 이동
		%>
	<%}else{ %>
		<% response.sendRedirect("loginFail.jsp"); 
			
		%> 
	<% } %>
	
	
</body>
</html>