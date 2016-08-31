<%@page import="shop.product.ProductBean"%>
<%@page import="shop.order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session"/>
<jsp:useBean id="productMgr" class="shop.product.ProductMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
** 장바구니 목록 **<p/>
<%@include file="guest_top.jsp" %>
<table style="width: 80%">
	<tr style="background-color: silver;">
		<th>주문상품</th><th>가격(소계)</th><th>수량</th><th>수정/삭제</th><th>상세보기</th>
	</tr>
<%
int totalPrice = 0;
Hashtable hCart = cartMgr.getCartList();
if(hCart.size() == 0){
	%>
	<tr><td>주문 상품이 없습니다.</td></tr>
	<%
}else{
	Enumeration enu = hCart.keys();
	while(enu.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(enu.nextElement());
		ProductBean product = productMgr.getProduct(order.getProduct_no());
		int price = Integer.parseInt(product.getPrice());
		int quantity = Integer.parseInt(order.getQuantity());
		int subTotal = price * quantity; //소계
		totalPrice += subTotal; //총계
%>
<form action="cartproc.jsp" method="get">
	<input type="hidden" name="flag">
	<input type="hidden" name="product_no" value="<%=product.getNo()%>">
	<tr style="text-align: center;">
		<td><%=product.getName() %></td>
		<td><%=subTotal %></td>
		<td>
			<input style="text-align: center;" type="text" name="quantity" size="5" value="<%=quantity%>">
		</td>
		<td>
			<input type="button" style="background-color: aqua;" value="수정" onclick="cartUpdate(this.form)">/
			<input type="button" style="background-color: aqua;" value="삭제" onclick="cartDelete(this.form)">
		</td>
		<td>
			<a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a>
		</td>
	</tr>
</form>
<%
	}
%>
	<tr>
		<td colspan="5" style="text-align: right;">
			<br>
			<b>총 결제금액: <%=totalPrice %>원 &nbsp;&nbsp;&nbsp;
			<a href="orderproc.jsp">[ 주문하기 ]</a>
			</b>
		</td>
	</tr>
<%	
}
%>
</table>
<%@include file="guest_bottom.jsp" %>
<form action="productdetail_g.jsp" name="detailFrm">
	<input type="hidden" name="no">
</form>
</body>
</html>