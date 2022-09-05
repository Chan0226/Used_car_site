<%@page import="data.dao.cart.CarDao"%>
<%@page import="data.dto.cart.CarDto"%>
<%@page import="data.dao.MyShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 인코딩 
	request.setCharacterEncoding("utf-8");
	// 데이터 읽기
	String carname=request.getParameter("carname");
	String carnumber=request.getParameter("carnumber");
	String color=request.getParameter("color");
	String company=request.getParameter("company");
	Integer distance=Integer.parseInt(request.getParameter("distance"));
	String sort=request.getParameter("sort");
	String gas=request.getParameter("gas");
	String caryear=request.getParameter("caryear");
	String cc=request.getParameter("cc");
	String auto=request.getParameter("auto");
	Integer cost=Integer.parseInt(request.getParameter("price"));
	String image = request.getParameter("image");
	
	// dto에 담기
	CarDto dto = new CarDto();
	dto.setCarname(carname);
	dto.setCarnumber(carnumber);
	dto.setColor(color);
	dto.setCompany(company);
	dto.setDistance(distance);
	dto.setSort(sort);
	dto.setGas(gas);
	dto.setCaryear(caryear);
	dto.setCc(cc);
	dto.setAuto(auto);
	dto.setCost(cost);
	dto.setImage(image);
	
	// dao 선언
	CarDao dao = new CarDao();

	// insert (dao의 insert 메서드)
	dao.insertcar(dto);
	
	// 목록으로 이동
	response.sendRedirect("adminpage.jsp");
%>

