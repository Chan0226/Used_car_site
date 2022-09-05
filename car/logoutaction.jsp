<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에서 loginok 제거후 
	session.removeAttribute("loginok");
	session.removeAttribute("myid");
	session.removeAttribute("grade");
	// 로그인 메인으로 이동
	response.sendRedirect("main.jsp");
%>
