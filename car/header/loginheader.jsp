<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	li{
		font-size:20px;
		margin-left:10px;
	}
	.form-control{
		width:150px;
		float:right;
	}
    li.main>a:hover {
       cursor: pointer;
   }

    ul.submenu {
        margin-left: 0px;
        font-size: 12px;
        font-family: 'Jua';
        padding-left: 0px;
        margin-top: 15px;
    }

    ul.submenu>li {
        display: block;
        width: 180px;
        height: 20px;
        color: #333;
    }

    /* active : 클릭 이벤트 */
    ul.submenu>li:hover {
        color: violet;
        cursor: pointer;
    }
</style>
<script>
$(function () {
    // 서브메뉴는 처음에 안보이게 설정
    $("ul.submenu").hide();

    // 메인제목에 마우스를 올리면 서브메뉴가 보이고 벗어나면 사라지게 하기
    $('li.main').mouseover(function () {
        $(this).siblings().find("ul").slideUp('slow');
        $(this).find('ul').slideDown('slow');
    });
    $('ul.submenu').hover(function () {
        $(this).slideDown('slow');
    }, function () {
        $(this).slideUp('slow');
    });

});

</script>
<header class="p-3">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		<img src="../image/logo.jpg" width="200px">
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li class="main" style="margin-left: 20px">
          	<a href="#" class="nav-link px-2 text-black">내차팔기</a>
    	    <ul class="submenu">
               <li>내차팔기 홈서비스</li>
               <li>법인차매각신청</li>
               <li>폐차신청</li>
               <li>내차팔기 고객후기</li>
         	 </ul>
   		  </li>
          <li class="main" style="margin-left: 40px">
          	<a href="#" class="nav-link px-2 text-black">내차사기</a>
          	<ul class="submenu">
               <li>차량검색</li>
               <li>내차사기 홈서비스</li>
               <li>판매준비차량</li>
         	 </ul>
          </li>
          <li class="main" style="margin-left: 40px">
          	<a href="#" class="nav-link px-2 text-black">렌트</a>
          	<ul class="submenu">
               <li>중고차렌트</li>
               <li>렌트특가</li>
               <li>신차렌트</li>
               <li>기사포함렌트</li>
               <li>렌트지점</li>
               <li>렌트일반정비소</li>
         	 </ul>
          </li>
          <li class="main">
          	<a href="#" class="nav-link px-2 text-black" style="margin-left: 40px; margin-right: 40px">금융</a>
          	<ul class="submenu">
               <li>할부</li>
               <li>리스</li>
         	 </ul>
          </li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>

<!--         <div class="text-end">
          <button type="button" class="btn btn-outline-light me-2">
          로그아웃</button>
          <button type="button" class="btn btn-warning">장바구니</button>
        </div> -->
        <ul class="nav justify-content-end" style="float:right">
		    <li class="nav-item">
		      <a class="nav-link" href="logoutaction.jsp"> 
		      <i class="bi bi-person-dash-fill"></i>&nbsp;Logout</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="cart.jsp">
		      <i class="bi bi-cart3"></i>&nbsp; Cart</a>
		    </li>
		 </ul>
      </div>
    </div>
  </header>
  
<!-- <ul class="nav justify-content-end">
    <li class="nav-item">
      <a class="nav-link" href="logoutaction.jsp"> 
      <i class="bi bi-person-dash-fill"></i>&nbsp;Logout</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="cart.jsp">
      <i class="bi bi-cart3"></i>&nbsp; Cart</a>
    </li>
 </ul> -->