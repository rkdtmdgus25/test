<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>

<%
//데이터
request.setCharacterEncoding("UTF-8");//post인 경우
%>

<jsp:useBean id="memberDTO" class="member.bean.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO"/>

<%
//DB-insert
MemberDAO memberDAO = MemberDAO.getInstance();
int su = memberDAO.write(memberDTO);

//페이지 이동
response.sendRedirect("write.jsp?su="+su);
%>




