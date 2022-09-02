<%@page import="java.io.PrintWriter"%>
<%@page import="data.dao.cart.UserDao"%>
<%@page import="data.dto.cart.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아이디와 비번, 체크박스를 읽는다
	String id = request.getParameter("myid");	
	String mypass = request.getParameter("mypass");	
	String saveid = request.getParameter("saveid");	// 체크박스 on or null;	

	UserDto dto = new UserDto();

%>
<%
//로그인 페이지에서 넘겨준 userID와 userPassword를 받아서 로그인 판별
		UserDao userDAO = new UserDao();
		int result = userDAO.login(id, mypass);
		if (result == 1){ // 로그인 정보가 맞으면 자바스크립트를 실행하여 페이지를 이동시킴
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'"); // main 페이지로 사용자를 보냄 
			script.println("</script>");
			session.setMaxInactiveInterval(60*60*8);
			/* 		session.setMaxInactiveInterval(20); */
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveid", saveid==null?"no":"yes");
		}
		else if (result == 0){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");	
			script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
			script.println("</script>");
		}
		else if (result == -2){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");	
			script.println("history.back()");	
			script.println("</script>");
		}
		else if (result == -1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스에 오류가 발생했습니다.')");	
			script.println("history.back()");	
			script.println("</script>");
		}
%>
