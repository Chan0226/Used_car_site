<%@page import="data.dao.cart.CarDao"%>
<%@page import="data.dao.MyShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 1.num 읽기
	String num = request.getParameter("num");
	// 2.dao 선언
	CarDao dao = new CarDao();	
	// 3.삭제 메서드 호출
	dao.deleteCar(num);
	// 4.목록으로 이동
	response.sendRedirect("adminpage.jsp");
%>

