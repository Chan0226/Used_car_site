<%@page import="data.dto.cart.CarDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SimpleBoardDto"%>
<%@page import="data.dao.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
	
	span.day{
		color: #ccc;
		font-size: 0.8em;
	}
</style>
</head>
<body>
<jsp:useBean id="dao" class="data.dao.cart.CarDao"></jsp:useBean>
<%
	//num을 읽는다
	String num = request.getParameter("num");
	//dto 가져오기
	CarDto dto = dao.getContent(num);
	
	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	
<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="<%=dto.getImage() %>">
			</div>
			<div class="col-md-6">
				<h3><%=dto.getCarname() %></h3>
				<p><b>색상 :</b> <%=dto.getColor()%></p>
				<p><b>제조사 : </b><%=dto.getCompany() %></p>
			
				<h4><%=dto.getCost() %>만원</h4>
				
				<p><form name="addForm" action="./addcart.jsp?num=<%=dto.getNum() %>" method="post">
				<!-- 상품 주문을 클릭하면 자바스크립트 핸들러 함수 addToCart()호출 -->
					<a href="#" class="btn btn-info" onclick="addToCart()">장바구니 저장&raquo;</a>
					<!-- 장바구니 버튼 추가, 클릭시 /cart.jsp로 이동함 -->
					<a href="./cart.jsp" class="btn btn-warning">장바구니 이동&raquo;</a>
					<a href="./main.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
				</form>
				
			</div>
		</div>
		<hr>
</div>
	<script type="text/javascript">
		/* 장바구니에 추가하기 위한 헨들러 함수 */
		function addToCart() {
			if(confirm('해당 상품을 장바구니에 추가하겠습니까?')) {	/* confirm() : 사용자가 선택할 때 이용(확인, 취소) */
				document.addForm.submit();
			}
			else {
				document.addForm.reset();
			}
		}
	</script>
</body>
</html>

