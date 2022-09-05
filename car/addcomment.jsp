<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="data.dto.cart.CommentDto"/>
<jsp:useBean id="dao" class="data.dao.cart.CommentDao"/>
<jsp:setProperty name="dto" property="*"/>
<%
	dao.insertcommentDto(dto);
%>
