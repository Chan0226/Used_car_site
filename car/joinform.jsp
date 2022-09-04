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
<style>
	<!-- 섹션 크기 -->
	.bg-light{
		height: 1053px;
		padding-top:55px;
		padding-bottom:75px;
	}
	.flex-fill.mx-xl-5.mb-2{
		margin: 0 auto;
		width : 700px;
		padding-right: 7rem;
		padding-left: 7rem;
	}
    <!-- 입력창 -->
	.container.py-4{
		margin: 0 auto;
		width : 503px;
	}
    <!-- 가입하기 -->
	.d-grid.gap-2{
		padding-top: 30px;
	}
    
    <!-- 생년월일 -->
	.bir_yy,.bir_mm,.bir_dd{
		width:160px;
		display:table-cell;
	}
	.bir_mm+.bir_dd, .bir_yy+.bir_mm{
		padding-left:10px;
	}

</style>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	// 세션으로부터 아이디와 체크값을 얻는다
	String myid = (String)session.getAttribute("myid");
	String saveid = (String)session.getAttribute("saveid");
	
	boolean savechk = true;  // 초기값 true로
	
	//조건이 여러가지일 경우 반드시 널조건을 먼저 쓴다. 
	if(saveid==null || saveid.equals("no")){  // 처음 로그인, 체크 안할 경우
		myid="";  //아이디저장을 체크하지 않을 경우 아이디를 없앤다.
		savechk=false;		// 체크하지 않았을경우 false, 그 이외에는 초기값이 true이므로 true가 된다.
	}
%>
<body>
 <form action = "JoinService" method = "post">
  <table border = "1px solid black">
	<tr>
	  <td>ID</td>
	  <td>
		<input type = "text" name = "id" class = "input_id">
		<font id = "checkId" size = "2"></font>
	  </td>				
	</tr>
	<tr>
	  <td>PW</td>
	  <td><input type = "password" name = "pw" class = "pw" id = "password_1"></td>
	</tr>
	<tr>
	  <td>PW 확인</td>
	  <td colspan = "2">
		<input type = "password" name = "pw2" class = "pw" id = "password_2">
		<font id = "checkPw" size = "2"></font>
	  </td>
	</tr>
	<tr>
	  <td>이름</td>
	  <td><input type = "text" name = "name"></td>
	</tr>
	<tr>
	  <td>닉네임</td>
	  <td><input type = "text" name = "display_name"></td>
	</tr>
	<tr>
	  <td>전화번호</td>
	  <td><input type = "text" name = "phone"></td>
	</tr>
	<tr>
	  <td>주소</td>
	  <td><input type = "text" name =  "address"></td>
	</tr>
	<tr>
	  <td>성별</td>
	  <td>
		<span>남자</span>
		<input type = "radio" name = "sex" value = "man">
		<span>여자</span>
		<input type = "radio" name = "sex" value = "woman">
	  </td>	
	</tr>
	<tr>
	  <td colspan = "2" align = "center"><input type = "submit" value = "가입하기"></td>
	</tr>
  </table>
</form>

<script>
	$('.input_id').focusout(function(){
		let userId = $('.input_id').val(); // input_id에 입력되는 값
		
		$.ajax({
			url : "IdCheckService.jsp",
			type : "post",
			data : {"userId": userId},
			dataType : 'json',
			success : function(result){
				if(result == 0){
					$("#checkId").html('이미 존재하는 아이디입니다.');
					$("#checkId").attr('color','red');
				} else{
					$("#checkId").html('사용할 수 있는 아이디입니다.');
					$("#checkId").attr('color','green');
				} 
			},
			error : function(){
				alert("서버요청실패");
			}
		})
		 
	})
 </script>
</body>
</html>

