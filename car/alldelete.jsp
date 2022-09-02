<%@page import="data.dto.cart.CarDto"%>
<%@page import="data.dao.cart.CarDao"%>
<%@page import="data.dto.cart.CartDto"%>
<%@page import="data.dao.cart.CartDao"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// nums 읽기
	String nums = request.getParameter("nums");
	String userId = (String)session.getAttribute("myid");
	// ,로 분리하기 변수 String []num
	String [] num = nums.split(",");
	CartDao cartdao = new CartDao();
	CarDao cardao = new CarDao();
	CarDto cardto = new CarDto();
	CartDto cartdto = new CartDto();
	// for문으로 num 갯수만큼 반복해서 delete 메소드 호출
	/* for(int i=0;i<num.length;i++){
		dao.deleteSmart(num[i]);
	} */
	for(String n:num){
		cartdao.rmvCart(userId,n);
	}
	// 목록으로 이동
	response.sendRedirect("cart.jsp"); 
%>
