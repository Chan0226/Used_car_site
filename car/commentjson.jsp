<%@page import="data.dao.cart.CommentDao"%>
<%@page import="data.dto.cart.CommentDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	CommentDao dao = new CommentDao();
	
	// 검색한 상품만 얻기
	List<CommentDto> list = dao.getComment(num);
	// json 배열 선언
	JSONArray arr = new JSONArray();
	
	for(CommentDto dto:list){
		JSONObject ob = new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("comment",dto.getComment());
		ob.put("userId",dto.getUserId());
		
		arr.add(ob);
	}
%>
<%=arr.toString() %>