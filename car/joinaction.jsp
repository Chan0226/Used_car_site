<%@page import="java.sql.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.cart.UserDao"%>
<%@page import="data.dto.cart.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	// 아이디와 비번, 체크박스를 읽는다
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");	
	String password = request.getParameter("pw");	
	String name = request.getParameter("name");	// 체크박스 on or null;	
	String birth = request.getParameter("birth");	// 체크박스 on or null;	
	String emailid = request.getParameter("emailid");	// 체크박스 on or null;	
	String emailaddr = request.getParameter("emailaddr");	// 체크박스 on or null;	
	String sex = request.getParameter("sex");	// 체크박스 on or null;	
	
	
	UserDto dto = new UserDto();
	dto.setId(id);
	dto.setPassword(password);
	dto.setName(name);
	dto.setBirthday(birth);
	dto.setEmailid(emailid);
	dto.setEmailaddr(emailaddr);
	dto.setSex(sex);
	// dao 선언
	UserDao dao = new UserDao();

	// insert (dao의 insert 메서드)
	dao.signup(dto);
	
	System.out.println(name);
	// 목록으로 이동
	response.sendRedirect("main.jsp");
%>