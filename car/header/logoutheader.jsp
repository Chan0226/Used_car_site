<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	li{
		font-size:20px;
	}
</style>
<header class="p-3">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		<img src="../image/logo.jpg" width="200px">
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 text-black">내차팔기</a></li>
          <li><a href="#" class="nav-link px-2 text-black">내차사기</a></li>
          <li><a href="#" class="nav-link px-2 text-black">렌트</a></li>
          <li><a href="#" class="nav-link px-2 text-black">금융</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search" id="searchingcar">
        </form>

<!--         <div class="text-end">
          <button type="button" class="btn btn-outline-light me-2">
          로그아웃</button>
          <button type="button" class="btn btn-warning">장바구니</button>
        </div> -->
		<ul class="nav justify-content-end">
		    <li class="nav-item">
		      	<a class="nav-link" href="loginform.jsp" style="float:left">
		      	<i class="bi bi-box-arrow-in-right"></i>&nbsp;Login</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="joinform.jsp">
		      <i class="bi bi-person-plus-fill"></i>&nbsp;Join</a>
		    </li>
		 </ul>
      </div>
    </div>
  </header>