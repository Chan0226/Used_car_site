<%@page import="data.dto.cart.CarDto"%>
<%@page import="data.dao.cart.CarDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.MyshopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MyShopDao"%>
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
</head>
<body>
<%
	// dao 선언
	CarDao dao = new CarDao();
	// 전체 목록 가져오기
	int totalCount = dao.getTotalCount();
	int perPage=20;	// 한 페이지당 보여질 글의 갯수
	int perBlock=5;	// 한 블럭당 보여질 페이지의 갯수
	int startNum;	// db에서 가져올 글의 시작번호(mysql은 첫글이 0번, 오라클은 1번)
	int startPage;	// 각 블럭당 보여질 시작페이지 번호
	int endPage;	// 각 블럭당 보여질 끝 페이지 번호
	int currentPage; // 현재 페이지
	int totalPage; 	// 총 페이지수 
	int no; 		// 각 페이지당 출력할 시작번호(1,6,...)
	// 현재 페이지를 읽는다. 단, null일 경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		// 계산을 해야하므로 int로 변환
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	startPage = (currentPage-1)/perBlock*perBlock+1;
	endPage = startPage+perBlock-1;
	if(endPage>totalPage)
		endPage=totalPage;
	startNum = (currentPage-1)*perPage;
	no = totalCount - (currentPage-1)*perPage;
	List<CarDto> list = dao.getPagingList(startNum, perPage);
	
%>
<div style="margin: 30px 30px">
	<h3 class="alert alert-danger" style="width:1350px">등록차량 목록</h3>
	<br>
	<button type="button" class="btn btn-outline-primary" onclick="location.href='addcarform.jsp'">차량등록</button>
	<button type="button" class="btn btn-outline-dark" onclick="location.href='main.jsp'">메인페이지</button>
	<br><br>
	<table class="table table-bordered" style="width:1350px">
		<tr class="table-info">
			<th width="50">등록번호</th>
			<th width="250">차량명</th>
			<th width="100">차량번호</th>
			<th width="60">색상</th>
			<th width="60">제조사</th>
			<th width="100">주행거리</th>
			<th width="60">종류</th>
			<th width="60">가스</th>
			<th width="150">연식</th>
			<th width="100">배기량</th>
			<th width="60">변속기</th>
			<th width="150">차량가격</th>
			<th>수정 및 삭제</th>
		</tr>
		<%
		if(list.size()==0){%>
			<tr>
				<td colspan="6" align="center">
					<h3><b>등록된 차량이 없습니다.</b></h3>
				</td>
			</tr>	
		<% }else{
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH시");
			for(int i=0;i<list.size();i++){
				CarDto dto= list.get(i);
				%>
					<tr>
						<td align="center"><%=no-- %></td>
						<td>
							<img src=<%=dto.getImage()%>
							width="60" height="60" class="img-thumbnail">		
							<a href="detailview.jsp?num=<%=dto.getNum()%>" style="color:black;text-decoration:none;">   <!-- 상품명 클릭시 디테일뷰로 연결 -->
								<b><%=dto.getCarname() %></b>
							</a>
						</td>
						<td align="center"><%=dto.getCarnumber() %></td>
						<td align="center"><%=dto.getColor()%></td>
						<td align="center"><%=dto.getCompany()%></td>
						<td align="center"><%=dto.getDistance()%></td>
						<td align="center"><%=dto.getSort()%></td>
						<td align="center"><%=dto.getGas()%></td>
						<td align="center"><%=dto.getCaryear()%></td>
						<td align="center"><%=dto.getCc()%></td>
						<td align="center"><%=dto.getAuto()%></td>
						<td align="center" style="color:red"><%=dto.getCost()%> 만원</td>
						<td align="center">
							<!-- 업데이트는 아이디가 필요하다 -->
							<button type="button" class="btn btn-outline-info btn-sm"
							onclick="location.href='carupdateform.jsp?num=<%=dto.getNum()%>'">수정</button>

							<button type="button" class="btn btn-outline-danger btn-sm"
							onclick="location.href='cardelete.jsp?num=<%=dto.getNum()%>'">삭제</button>
					</tr>
			<%}
		}
		%>
	</table>
		<div class="container mt-3" style="width:750px;text-align: center;">
		<ul class="pagination justify-content-center">
		<% 
			// 이전
			if(startPage>1){%>
			<li class="page-item"><a class="page-link" href="adminpage.jsp?currentPage=<%=startPage-1 %>">Previous</a></li>
			&nbsp;
 			<%}
			for(int pp=startPage;pp<=endPage;pp++){
			// 현재 페이지와 같은경우 약간의 css 추가(현재 페이지번호만 css 적용)
			if(pp==currentPage){%>
				<li class="page-item active"><a class="page-link" href="adminpage.jsp?currentPage=<%=pp %>"><%=pp %></a></li>
				&nbsp;
			<% }else{%>
				<li class="page-item"><a class="page-link" href="adminpage.jsp?currentPage=<%=pp %>" ><%=pp %></a></li>
				&nbsp;
			<% }
		}
		// 다음버튼을 누르면 다음 페이지의 첫번호()
		if(endPage<totalPage){%>
			<li class="page-item"><a class="page-link" href="adminpage.jsp?currentPage=<%=endPage+1 %>">Next</a></li>
		<%}
	%>
	</ul>
	</div>
</div>
</body>
</html>

