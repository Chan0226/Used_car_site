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
<script>
var loginok = "<%=(String)session.getAttribute("loginok")%>";
/* 장바구니에 추가하기 위한 헨들러 함수 */
function addToCart() {
	if(loginok=="null") {	/* confirm() : 사용자가 선택할 때 이용(확인, 취소) */
		alert("장바구니 담기는 로그인 후 사용하실 수 있습니다.");
		location.href="./loginform.jsp";
	}
	else{
		document.addForm.submit();
	}
}
</script>
</head>
<body>
<jsp:useBean id="dao" class="data.dao.cart.CarDao"></jsp:useBean>
<%
	//num을 읽는다
	String num = request.getParameter("num");
	String userId = (String)session.getAttribute("myid");
	//dto 가져오기
	CarDto dto = dao.getContent(num);
	//날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	
<div class="container">
		<div class="row" style="margin-top:50px">
			<div class="col-md-5">
				<img src="<%=dto.getImage() %>" style="width:400px; height:400px;">
			</div>
			<div class="col-md-6">
				<h3><%=dto.getCarname() %></h3>
				<p><b>차량번호 : </b><%=dto.getCarnumber() %></p>
				<p><b>색상 :</b> <%=dto.getColor()%></p>
				<p><b>제조사 : </b><%=dto.getCompany() %></p>
				<p><b>주행거리 : </b><%=dto.getDistance() %>Km</p>
				<p><b>종류 : </b><%=dto.getSort() %></p>
				<p><b>가스 : </b><%=dto.getGas() %></p>
				<p><b>연식 : </b><%=dto.getCaryear() %></p>
				<p><b>배기량 : </b><%=dto.getCc() %></p>
				<p><b>변속기 : </b><%=dto.getAuto() %></p>
				
				<span style="float:left">차량가격:</span><h4 style="color:red; float:left; margin-left:10px"><%=dto.getCost() %></h4>&nbsp;<span style="float:left;margin-left:5px">만원</span>
				<br>
				<p><form name="addForm" action="./addcart.jsp?num=<%=dto.getNum() %>" method="post">
				<!-- 상품 주문을 클릭하면 자바스크립트 핸들러 함수 addToCart()호출 -->
					<a href="#" class="btn btn-outline-success" onclick="addToCart()">장바구니 저장&raquo;</a>
					<!-- 장바구니 버튼 추가, 클릭시 /cart.jsp로 이동함 -->
					<a href="./cart.jsp" class="btn btn-outline-danger">장바구니 이동&raquo;</a>
					<a href="./main.jsp" class="btn btn-outline-secondary">상품 목록&raquo;</a>
				</form>
				
			</div>
		</div>
		<hr>
</div>

<div class="container mt-3">
    <div class="mb-3 mt-3">
      <label for="comment">리뷰 작성:</label>
      <textarea class="form-control" rows="5" id="comment" name="text"></textarea>
    </div>
    <button type="button" class="btn btn-primary" id="submit">등록하기</button>
</div>
<br><br>
<div  id="result" style="margin-left:30px">

</div>

<script type="text/javascript">
	
	getCommentList();


	$("#submit").click(function(){
		// this()는 버튼이기 때문에 $(#sangpum)을 사용
		
		addComment();
	});
	
	function addComment(){
		var comment = $("#comment").val();
		var userId = '<%=userId%>';
		var num = '<%=num%>';
		 $.ajax({
				type:"get",
				url:"addcomment.jsp",
				dataType:"html",  /* 백엔드(jsp)에서 front(html)로 보내는 res 데이터 타입 */
				data: {"num":num,"comment":comment,"userId":userId}, 	 
				success:function(res){
					location.reload();
		        },
				statusCode: {
					404:function(){
						alert("json 파일을 찾을수 없어요!");
					},
					500:function(){
						alert("서버 오류..코드를 다시 한번 보세요!");
					}
				}
			}); 
		
	}
	function getCommentList(num){
		var num = '<%=num%>';
		console.log(num);
		
		$.ajax({
			type:"get",
			url:"commentjson.jsp",
			dataType:"json",  /* 백엔드(jsp)에서 front(html)로 보내는 res 데이터 타입 */
			data: {"num":num}, 	 
			success:function(res){	
				var s="";
				s+= "<div class='container mt-3'>";
				s+= "<table class='table table-hover'>";
				s+=	"<thead>";
				s+= "<tr>";
				s+= "<th>작성자</th>";
				s+= "<th>리뷰 내용</th>";
				s+= "</tr>";
				s+= "</thead>";
				s+= "<tbody>";
				
				$.each(res,function(idx,item){
					s+= "<tr>";
					s+= "<td>"+item.userId+"</td>";
					s+= "<td>"+item.comment+"</td>";
					s+= "</tr>";
				});
				s+= "</tbody>";
				s+= "</table>";
				s+= "</div>";
				s+= "</div>";
				
				$("#result").html(s);
			},
			statusCode: {
				404:function(){
					alert("json 파일을 찾을수 없어요!");
				},
				500:function(){
					alert("서버 오류..코드를 다시 한번 보세요!");
				}
			}
		});
	}
	
</script>
</body>
</html>

