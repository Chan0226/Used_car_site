<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.cart.CarDao"%>
<%@page import="data.dto.cart.CarDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SimpleBoardDao"%>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<div class="container mt-3">
  <form action="/action_page.php">
    <div class="mb-3 mt-3">
      <label for="comment">리뷰:</label>
      <textarea class="form-control" rows="5" id="comment" name="text"></textarea>
    </div>
    <button type="submit" class="btn btn-primary" id="submit">제출</button>
  </form>
</div>
<div id="result">

</div>
<%
	String id = (String)session.getAttribute("myid");
%>
<script>
function addcomment(comment)
	$.ajax({
		type:"get",
		url:"commentjson.jsp",
		dataType:"json",
		data:{"comment":comment},
		success:function(res){	
			var s="";
			
			$.each(res,function(idx,item){
				s+="<p>"+item.carname+"</p>";
			});
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
});
</script>
</body>
</html>
