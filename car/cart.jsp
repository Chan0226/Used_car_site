<%@page import="data.dao.cart.CarDao"%>
<%@page import="com.mysql.cj.jdbc.result.CachedResultSetMetaDataImpl"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.cart.CartDao"%>
<%@page import="data.dto.cart.CartDto"%>
<%@page import="data.dto.cart.CarDto"%>
<%@page import="java.util.ArrayList"%>
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
	th{
		text-align: center;
	}
</style>
	<%
		//세션 ID값 가져오기
		String cartId = session.getId();
		CartDao cartdao = new CartDao();
		CarDao cardao = new CarDao();
		CarDto cardto = new CarDto();
		CartDto cartdto = new CartDto();
		
		String userId = (String)session.getAttribute("myid");
 		List<CarDto> list = cartdao.findUsercart(userId);	
		%>
</head>
<body>
<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	
	<div class="container">		
		<div style="padding-top: 50px;">
			<!-- table-hover : 마우스 포인터가 있는 행의 배경을 바꾸어 눈에 띄도록 만들어진 클래스 -->
			<table class="table table-hover">
				<tr>
					<th></th>
					<th>차량번호</th>
					<th>차량명</th>
					<th>제조사</th>
					<th>차량가격</th>
					<th>분류</th>
					<th>연식</th>
					<th>색상</th>
					<th>주행거리</th>
					<th>조작여부</th>
				</tr>
		<%	for(CarDto dto:list){
			%>
			<tr>
				<td align="center">
					<input type="checkbox" class="alldel" value="<%=dto.getNum()%>">
				</td>
				<td align="center"><%=dto.getCarnumber()%></td>
				<td align="center"><%=dto.getCarname()%></td>
				<td align="center"><%=dto.getCompany()%></td>
				<td align="center"><%=dto.getCost()%></td>
				<td align="center"><%=dto.getSort()%></td>
				<td align="center"><%=dto.getCaryear()%></td>
				<td align="center"><%=dto.getColor()%></td>
				<td align="center"><%=dto.getDistance()%></td>
				<td align="center"><%=dto.getAuto()%></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="5">
					<input type="checkbox" class="alldelcheck">&nbsp;전체 선택
					<span style="float:right">
						<button type="button" class="btn btn-danger btn-sm"
						id="btndel" onclick="./deleteCart.jsp?cartId=<%= cartId %>">삭제</button>
						&nbsp;
						<a href="./main.jsp" class="btn btn-secondary">
						차량 계속 알아보기 &raquo;</a>
					</span>
				</td>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript">
	// 전체 체크 클릭시 체크값 얻어서 모든 체크 값 전달하기 
	$(".alldelcheck").click(function(){
		// 전체 체크값 얻기
		var chk = $(this).is(":checked");
		$(".alldel").prop("checked",chk)
	})
	// 삭제 버튼 클릭시 삭제
	// 전체 체크 클릭시 체크값 얻어서 모든 체크 값 전달하기 

	// 삭제 버튼 클릭시 삭제
	$("#btndel").click(function(){
		// 체크를 안했을 경우 최소 1개 이상의 글을 선택해주세요 라고 alert

		// 체크된 길이 구하기
		var len = $(".alldel:checked").length;
		if(len==0){
			alert("최소 1개 이상의 글을 선택해주세요")
		}else{
			var a = confirm(len+"개의 글을 삭제하려면 [확인을 눌러주세요]")
			
			if(a){
			// 체크된 곳의 value값 (num) 얻기
			var n = "";
			$(".alldel:checked").each(function(){
				n+= $(this).val()+",";									
			});
			// 마지막 컴마 제거하기
			n = n.substring(0,n.length-1);
			console.log(n);
			// 삭제 파일로 get 방식 전송
			location.href = "alldelete.jsp?nums="+n;
			}
		}
	});
</script>
	
</body>
</html>
 

