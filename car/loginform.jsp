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
<%-- <div style="margin:100px 100px">
	<form action='loginaction.jsp' method='post'>
		<table class="table table-bordered" style="width:300px">
			<caption align="top">
													<!-- 아이디 저장 누른경우 다시 로그인 할 때 체크 -->
				<input type="checkbox" name="saveid" <%=savechk?"checked":"" %>>아이디저장
			</caption>
			<tr>
				<th style="background-color:orange">아이디</th>
				<td>
					<input type="text" name="myid" class="form-control" style="width:160px"
					value="<%=myid%>">
					<!-- 아이디 저장 누른경우 다시 로그인 할 때 아이디 칸에 넣기 -->
				</td>
			</tr>
			<tr>
				<th style="background-color:orange">비밀번호</th>
				<td>
					<input type="password" name="mypass" class="form-control" style="width:160px">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">회원 로그인</button>
				</td>
			</tr>
		</table>
	</form>
</div> --%>

<div class="container mt-3" style="width:600px">
  <h3>로그인</h3>
    
  <form action='loginaction.jsp' method='post' class="was-validated">
    <div class="mb-3 mt-3">
      <label for="uname" class="form-label">ID:</label>
      <input type="text" class="form-control" id="myid" placeholder="Enter username" name="myid" value="<%=myid%>" required>
      <div class="valid-feedback">유효합니다.</div>
      <div class="invalid-feedback">아이디를 입력해주세요</div>
    </div>
    <div class="mb-3">
      <label for="pwd" class="form-label">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="mypass" required>
      <div class="valid-feedback">유효합니다.</div>
      <div class="invalid-feedback">비밀번호를 입력해주세요</div>
    </div>
    <div class="form-check mb-3">
      <input class="form-check-input" type="checkbox" id="myCheck"  name="saveid" <%=savechk?"checked":"" %>>아이디저장
    </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>

