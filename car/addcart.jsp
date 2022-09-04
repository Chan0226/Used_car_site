<%@page import="data.dao.cart.CartDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.cart.CarDto"%>
<%@page import="data.dao.cart.CarDao"%>
<%@page import="data.dto.cart.CartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">   

 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
</style>
</head>
<body>
<jsp:useBean id="cardao" class="data.dao.cart.CarDao"></jsp:useBean>
<jsp:useBean id="cartdao" class="data.dao.cart.CartDao"></jsp:useBean>
	<%
		//전송된 상품 id
		String userId = (String)session.getAttribute("myid");
		String carId = request.getParameter("num");
		
		//상품 id 넘어오지 않았을때 강제로 products.jsp 이동시키고 종료()
		if(carId == null || carId.trim().equals("")) {
			response.sendRedirect("detailview.jsp");
			return;
		}
/* 		if(userId == null || userId.trim().equals("")) {
			response.sendRedirect("./loginform.jsp");
			return;
		} */

		cartdao.addCart(userId, carId);
		CarDto dto = cardao.getContent(carId);	
		/* session.setAttribute("name", dto.getCarname());
		session.setAttribute("color", dto.getColor());
		session.setAttribute("cost", dto.getCost());
		session.setAttribute("company", dto.getCompany());
		session.setAttribute("caryear", dto.getCaryear()); */
		
 		response.sendRedirect("cart.jsp?"); 
 		
 		
	%>
</body>
</html>

