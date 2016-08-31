<%@page import="shop.product.ProductBean"%>
<%@page import="shop.order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="shop.order.OrderMgr"/>
<jsp:useBean id="productMgr" class="shop.product.ProductMgr"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
** 주문 상품 목록 **<p/>
<%@include file="guest_top.jsp" %>
<table style="width: 80%">
	<tr><th>주문번호</th><th>상품명</th><th>주문수</th><th>주문일</th><th>주문상태</th></tr>
	<%
	String id = (String)session.getAttribute("idKey");
	ArrayList<OrderBean> list = orderMgr.getOrder(id);
	if(list.size() == 0){
	%>
	<tr><td>주문한 상품이 없습니다.</td></tr>
	<%
	}else{
		for(OrderBean ord: list){
			ProductBean product = productMgr.getProduct(ord.getNo());
	%>
	<tr style="text-align: center;">
		<td><%=ord.getNo() %></td>
		<td><%=product.getName()%></td>
		<td><%=ord.getQuantity()%></td>
		<td><%=ord.getSdate()%></td>
		<td>
		<%
		switch(ord.getState()){
		case "1":out.println("접수");
			break;
		case "2":out.println("입금확인");
			break;
		case "3":out.println("배송준비");
			break;
		case "4":out.println("배송중");
			break;
		case "5":out.println("처리완료");
			break;
		default:out.println("접수중");
			break;
		}
		%>
		</td>
		
	</tr>
	<%
		}
	}
	%>
</table>
<%@include file="guest_bottom.jsp" %>
</body>
</html>