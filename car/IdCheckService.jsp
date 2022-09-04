<%@page import="java.io.PrintWriter"%>
<%@page import="data.dao.cart.UserDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
	request.setCharacterEncoding("UTF-8");
	//ajax로 값을 받기 때문에 UTF-8로 인코딩해준다
	response.setCharacterEncoding("EUC-KR");
	//json 배열 선언
	JSONArray arr = new JSONArray();
	PrintWriter pout = response.getWriter();
	String userId = request.getParameter("userId");
	UserDao dao = new UserDao();
	int idChcek = dao.checkId(userId);

	// 성공여부 확인 : 개발자용
	if (idChcek == 0) {
		System.out.println("이미 존재하는 아이디입니다.");
	} else if (idChcek == 1) {
		System.out.println("사용 가능한 아이디입니다.");
	}
	
	JSONObject ob = new JSONObject();
	pout.write(idChcek + ""); // --> ajax 결과값인 result가 됨
%>	
		

		
