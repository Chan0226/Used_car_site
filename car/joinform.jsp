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
	@media (min-width: 1025px) {
	.h-custom {
	height: 100vh !important;
	}
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
 
<section class="h-100 h-custom" style="background-color: #F6F6F6;">
  <div class="container py-5 h-100">
  
    <div class="row d-flex justify-content-center align-items-center h-100" style="width:1500px">
      <div class="col-lg-8 col-xl-6">
        <div class="card rounded-3">
          <img src="../image/joinimg2.jpg"
            class="w-100" style="width:500px;height:300px; border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
            alt="Sample photo">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">회원가입</h3>


            <form class="px-md-2" action = "./joinaction.jsp" method = "post">

              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1q">아이디</label>
           		<input type = "text" name = "id" class = "input_id" style="margin-left: 15px">
				<font id = "checkId" size = "2"></font>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline datepicker">
                    <label for="exampleDatepicker1" class="form-label">비밀번호</label>
					<input type = "password" name = "pw" class = "pw" id = "password_1">
                  </div>
                </div>
                <div class="col-md-6 mb-4">
                  <div class="form-outline datepicker">
                    <label for="exampleDatepicker1" class="form-label">비밀번호 확인</label>
					<input type = "password" name = "pw2" class = "pw" id = "password_2">
					<font id = "checkPw" size = "2"></font>
					<input type="hidden" id="pwDoubleChk"/>					
                  </div>
                </div>
              </div>
              
              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1q">이름</label>
           		<input type = "text" name = "name" style="margin-left: 30px">
              </div>
              
              <div class="form-outline mb-4">
              <label class="form-label" for="form3Example1q">성별</label>
		       		<span style="margin-left:30px">남자</span>
					<input type = "radio" name = "sex" value = "1">
					<span>여자</span>
					<input type = "radio" name = "sex" value = "2">
		       </div>
              

              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1q">생년월일</label>
           		<input type = "text" name = "birth">
              </div>

              <div class="form-outline mb-4">
                <label class="form-label" for="form3Example1q">주소</label>
           		<input type = "text" name =  "address" style="margin-left: 30px">
              </div>
             
               <div class="input-group mb-3 input-group-sm" style="width: 600px;">
		 	       <span class="input-group-text">이메일</span>
		        <input type="text" class="form-control" style="width: 80px;" id="email1"  name = "emailid">&nbsp;<b>@</b>&nbsp;
		        <input type="text" class="form-control" style="width: 80px;" id="email2"  name = "emailaddr">&nbsp;&nbsp;
		
		        <select class="form-select" id="selemail">
		            <option hidden disabled selected>이메일선택</option>
		            <option value="-">직접입력</option>
		            <option value="naver.com">네이버</option>
		            <option value="nate.com">네이트</option>
		            <option value="google.com">구글</option>
		        </select>
		       </div>	
		       <br><br>
              <button type="submit" class="btn btn-success" id="submit">Submit</button>

            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
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
	});
	$("#password_2").blur(function(){
		if($("#password_1").val() == $("#password_2").val()){
			$("#checkPw").text("비밀번호가 일치합니다.");
			$("#checkPw").css("color", "green");
			$("#pwDoubleChk").val("true");
		}else{
			$("#checkPw").text("비밀번호가 일치하지 않습니다.");
			$("#checkPw").css("color", "red");
			$("#pwDoubleChk").val("false");
		}
	});	  
	
	$("#selemail").change(function () {
        // this == "#selemail option:selected"
        var txt = $(this).val();
        if (txt == '-') {
            $("#email2").val('');
            $("#email2").focus();
        }
        else
            // input은 val로 text 넣는다
            $("#email2").val(txt);
    });
	$("#submit").click(function () {
		if ($("#email1").val().trim() == '') {
	        alert("이메일에 공백이 포함되어 있습니다.\n다시입력해주세요")
	        $("#email").focus();  // email 입력칸으로 이동
	        return;
	    }
	    // 이메일 아이디 중간에 공백이 있을 경우 경고메시지후 종료
	    // indexOf 사용해서 코딩
	    if ($("#email1").val().indexOf(' ') >= 0) {
	        // 공백이 없을경우 -1반환, 있을경우 0보다 크거나 같은값이 반환
	        alert("이메일 사이에 공백이 있습니다.\n다시입력해주세요")
	        $('#email1').val('');      // 값 초기화
	        return;
	    }
	});
 </script>
</body>
</html>

