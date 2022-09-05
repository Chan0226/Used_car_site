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
<script type="text/javascript">
$(function(){
	var srcImg = $("#photo").val();
	$("#myphoto").attr("src","../image2/"+srcImg+".jpg");
});

</script>
</head>
<body>
<div style="margin: 30px 30px;">
	<form action="addcaraction.jsp" method="post">
		<table class="table table-bordered" style="width:500px">
			<caption align="top"><h3><b>차량등록</b></h3></caption>
			<tr>
				<th width="100" style="background-color:#48d1cc">차량명</th>
				<td>
					<input type="text" name="carname" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">차량번호</th>
				<td>
					<input type="text" name="carnumber" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">색상</th>
				<td>
					<input type="color" name="color" value="#ffc0cb"
					class="form-control" style="width:150px">
				</td>
			</tr>			
			<tr>
				<th width="100" style="background-color:#48d1cc">제조사</th>
				<td>
					<input type="text" name="company" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">주행거리</th>
				<td>
					<input type="text" name="distance" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">종류</th>
				<td>
					<input type="text" name="sort" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">가스</th>
				<td>
					<input type="text" name="gas" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">연식</th>
				<td>
					<input type="text" name="caryear" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">배기량</th>
				<td>
					<input type="text" name="cc" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">변속기</th>
				<td>
					<input type="text" name="auto" required="required"
					class="form-control">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">가격</th>
				<td>
				<!-- pattern[0-9]{3,} : 0-9만 가능, 3글자 이상 -->
					<input type="text" name="price" required="required"
					class="form-control" pattern="[0-9]{3,}">
				</td>
			</tr>
			<tr>
				<th width="100" style="background-color:#48d1cc">이미지</th>
				<td>
					<input type="file" name="image" required="required"
					class="form-control">
				</td>
			</tr>			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">차량 추가</button>

					<button type="button" class="btn btn-info" 
					onclick="location.href='adminpage.jsp'">목록으로</button>
				</td>
			</tr>
		</table>	
	</form>
</div>
</body>
</html>

