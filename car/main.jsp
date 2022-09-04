<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.cart.CarDao"%>
<%@page import="data.dto.cart.CarDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 10초마다 main.jsp 새로고침 -->
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css"> -->
 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>                             
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
	}
	
	a:link, a:visited {
		text-decoration: none;
		color: black;
	}
	a:hover {
		text-decoration: underline;
		color: red;
	}
.card {
    border: none;
    background: #eee;

}
#card{
	margin-top: 500px;
	height:350px;
}

.search {
    width: 50%;
    margin-bottom: auto;
    margin-top: 20px;
    height: 50px;
    background-color: #fff;
    padding: 10px;
    border-radius: 5px
}

.search-input {
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 0;
    margin-top: 5px;
    caret-color: transparent;
    line-height: 20px;
    transition: width 0.4s linear
}

.search .search-input {
    padding: 0 10px;
    width: 100%;
    caret-color: #536bf6;
    font-size: 19px;
    font-weight: 300;
    color: black;
    transition: width 0.4s linear
}

#search-icon {
    height: 34px;
    width: 34px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    background-color: #536bf6;
    font-size: 10px;
    bottom: 30px;
    position: relative;
    border-radius: 5px
}

.search-icon:hover {
    color: #fff !important
}

a:link {
    text-decoration: none
}

.card-inner {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, .125);
    border-radius: 10px;
    border: none;
    cursor: pointer;
    transition: all 2s
}

.card-inner:hover {
    transform: scale(1.1);
    -webkit-box-shadow: 0px 0px 13px 2px rgba(0, 0, 0, 0.75);
    -moz-box-shadow: 0px 0px 13px 2px rgba(0, 0, 0, 0.75);
    box-shadow: 0px 0px 13px 2px rgba(0, 0, 0, 0.75);
}

.mg-text span {
    font-size: 12px
}
.carousel-inner {
            width: 80%;
            margin:auto;
            text-align:center;
            height: 400px; /* 이미지 높이 변경 */
        }

.mg-text {
    line-height: 14px
}
</style>
<script>
$(function(){
	
	search('');  
	
	$(".search-input").keyup(function(e){
		if(e.keyCode==13){
			search($(this).val().trim());
		}
	});
	// 상품명 입력후 버튼 클릭하면 함수 호출
	$("#search-icon").click(function(){
		// this()는 버튼이기 때문에 $(#sangpum)을 사용
		search($(".search-input").val().trim());
	});
	//searched
	
	function search(carname){
		$.ajax({
			type:"get",
			url:"carjson.jsp",
			dataType:"json",  /* 백엔드(jsp)에서 front(html)로 보내는 res 데이터 타입 */
			data: {"carname":carname}, 	 // 방법1
			success:function(res){	
				var s="<div class='cardbox' style='margin-top:100px'>";
				
				$.each(res,function(idx,item){
					s+="<div class='cards' style='margin-bottom:80px;width:300px; float:left; width:33%; margin:auto;text-align: center;'>";
					s+="<a href='detailview.jsp?num="+item.num+"'>";
					s+="<img src='"+item.image+"' style='width:300px; height:300px; border-radius:10px; cursor:pointer'>";
					s+="</a>";
					s+="<div class='card-body' style='width:300px;height:300px; margin:auto;text-align: center;'>";
					s+="<h5 class='card-title'>"+item.carname+"</h5>";
					s+="<h5 class='card-subtitle mb-2 text-muted'>"+item.cost+"만원</h5>";
					s+=item.caryear+"·";
					s+=item.distance+"km ·";
					s+=item.gas;
					s+="</div>";
					s+="</div>";
				});
				s+="</div>";
				$(".result").html(s);
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
	$("#searched").click(function(){
		var company=$("#company option:selected").text();
		var mincost=$("#mincost option:selected").val();
		var maxcost=$("#maxcost option:selected").val();
		console.log(company);
		console.log(mincost);
		console.log(maxcost);
		var s = "company="+company+"&mincost="+mincost+"&maxcost="+maxcost;

		// 총점, 평균
		$.ajax({
			type:"get",
			url:"filtering.jsp",
			dataType:"json",
			data:s,
			success:function(res){	
				var s="<div class='cardbox' style='margin-top:100px'>";
				
				$.each(res,function(idx,item){
					s+="<div class='cards' style='margin-bottom:80px;width:300px; float:left; width:33%; margin:auto;text-align: center;'>";
					s+="<a href='detailview.jsp?num="+item.num+"'>";
					s+="<img src='"+item.image+"' style='width:300px; height:300px; border-radius:10px; cursor:pointer'>";
					s+="</a>";
					s+="<div class='card-body' style='width:300px;height:300px; margin:auto;text-align: center;'>";
					s+="<h5 class='card-title'>"+item.carname+"</h5>";
					s+="<h5 class='card-subtitle mb-2 text-muted'>"+item.cost+"만원</h5>";
					s+=item.caryear+"·";
					s+=item.distance+"km ·";
					s+=item.gas;
					s+="</div>";
					s+="</div>";
				});
				s+="</div>";
				$(".result").html(s);
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
	});
});

</script>
</head>
<%
	//dao선언
	CarDao dao = new CarDao();
	
	// 페이징 처리에 필요한 변수들
	//전체갯수
	int totalCount = dao.getTotalCount();
	int perPage=15;	// 한 페이지당 보여질 글의 갯수
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
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	startPage = (currentPage-1)/perBlock*perBlock+1;
	endPage = startPage+perBlock-1;
	if(endPage>totalPage)
		endPage=totalPage;
	startNum = (currentPage-1)*perPage;
	no = totalCount - (currentPage-1)*perPage;
	
	List<CarDto> list = dao.getPagingList(startNum, perPage);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
	NumberFormat nf = NumberFormat.getNumberInstance();
%>
<body>
    <div>
	<%String loginok = (String)session.getAttribute("loginok");
	if(loginok==null)
	{%>
		<jsp:include page="header/logoutheader.jsp"></jsp:include>		
	<%}else{%>
		<jsp:include page="header/loginheader.jsp"></jsp:include>		
	<%}%>
	</div>
	
	
  <div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://img.kcar.com/FILE_UPLOAD2/IMAGE_UPLOAD/SLOT/PC_Main_img_05qMMO6EpbKzzl1jJf6nt8.png" alt="Los Angeles" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="https://img.kcar.com/FILE_UPLOAD2/IMAGE_UPLOAD/SLOT/PC_Main_img_02YOyILIf64eT0zJhJ3XwN.png" alt="Chicago" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="https://img.kcar.com/FILE_UPLOAD2/IMAGE_UPLOAD/SLOT/PC_Main_imgSuBZW4G6oRUB4w4tQDPM.png" alt="New York" class="d-block" style="width:100%">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>


    <div class="card p-4 mt-3" id="card" style="margin-top:100px">
        <h3 class="heading mt-5 text-center">어떤 차를 찾으세요?</h3>
        <div class="d-flex justify-content-center px-5">
        
        <div class="search" style=" margin: auto; text-align: center;"> <input type="text" class="search-input" placeholder="Search..." name=""> 
         <button type="button" class="btn btn-primary" id="search-icon"> <i class="fa fa-search"></i> </button> 
        </div>
        </div>
        
        <div class='select' style=" margin: auto; text-align: center;">
        <select class="form-select" style="width:150px; margin-top:30px;float:left" id="company">
		  <option value="" disabled selected>제조사 선택</option>
		  <option value="현대">현대</option>
		  <option value="기아">기아</option>
		  <option value="르노삼성">르노삼성</option>
		  <option value="쉐보레">쉐보레</option>
		  <option value="쌍용">쌍용</option>
		  <option value="제네시스">제네시스</option>
		</select>
        <select class="form-select" style="width:200px;margin-left:20px;margin-top:30px;float:left" id="mincost">
		  <option value="" disabled selected>최소금액</option>
		  <option value="100">100만원</option>
		  <option value="500">500만원</option>
		  <option value="700">700만원</option>
		  <option value="1000">1000만원</option>
		  <option value="1500">1500만원</option>
		  <option value="2000">2000만원</option>
		  <option value="2500">2500만원</option>
		  <option value="3000">3000만원</option>
		  <option value="3500">3500만원</option>
		  <option value="4000">4000만원</option>
		</select>
        <select class="form-select" style="width:200px;margin-left:20px;margin-top:30px;float:left" id="maxcost">
		  <option value="" disabled selected>최대금액</option>
		  <option value="500">500만원</option>
		  <option value="700">700만원</option>
		  <option value="1000">1000만원</option>
		  <option value="1500">1500만원</option>
		  <option value="2000">2000만원</option>
		  <option value="2500">2500만원</option>
		  <option value="3000">3000만원</option>
		  <option value="3500">3500만원</option>
		  <option value="4000">4000만원</option>
		  <option value="14000">4000만원 이상</option>
		</select>
		<button type="button" class="btn btn-outline-danger" style="margin-left: 10px;margin-top: 30px" id="searched">검색하기</button>
    	</div>
	</div>
	
	<div class="result">
	
	</div>
	<!-- 페이지 번호 출력 -->
<%-- <div style="width:800px;height:200px; margin:auto;text-align: center; margin-top: 900px;">
		<% 
			// 이전
			if(startPage>1){%>
			<a href="main2.jsp?currentPage=<%=startPage-1 %>" 
				style="color:red;">이전</a>
				&nbsp;
			<%}
			for(int pp=startPage;pp<=endPage;pp++){
			// 현재 페이지와 같은경우 약간의 css 추가(현재 페이지번호만 css 적용)
			if(pp==currentPage){%>
				<a href="main2.jsp?currentPage=<%=pp %>" 
				style="color:red;"><%=pp %></a>
				&nbsp;
			<% }else{%>
				<a href="main2.jsp?currentPage=<%=pp %>" 
				style="color:black;"><%=pp %></a>
				&nbsp;
			<% }
			
		}
			
		if(endPage<totalPage){%>
		<a href="main.jsp?currentPage=<%=endPage+1 %>" 
			style="color:red;">다음</a>
		<%}
	%>
	</div>  --%>
	
</body>
</html>
