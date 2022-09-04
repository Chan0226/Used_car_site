<%@page import="data.dto.cart.CarDto"%>
<%@page import="data.dao.cart.CarDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.MyshopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MyShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NumberFormat nf = NumberFormat.getNumberInstance();
	String company = request.getParameter("company");
	Integer mincost = Integer.parseInt(request.getParameter("mincost"));
	Integer maxcost = Integer.parseInt(request.getParameter("maxcost"));
	
	//String carname = "";
	CarDao dao = new CarDao();
	// 검색한 상품만 얻기
	List<CarDto> list = dao.getCostCar(company, mincost, maxcost);

	// json 배열 선언
	JSONArray arr = new JSONArray();
	
	for(CarDto dto:list){
		JSONObject ob = new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("carnumber",dto.getCarnumber());
		ob.put("company",dto.getCompany());
		ob.put("carname",dto.getCarname());
		ob.put("cost",dto.getCost());
		ob.put("sort",dto.getSort());
		ob.put("caryear",dto.getCaryear());
		ob.put("distance",dto.getDistance());
		ob.put("color",dto.getColor());
		ob.put("gas",dto.getGas());
		ob.put("fuel",dto.getFuel());
		ob.put("cc",dto.getCc());
		ob.put("auto",dto.getAuto());
		ob.put("image",dto.getImage());
		
		arr.add(ob);
	}
%>
<%=arr.toString() %>