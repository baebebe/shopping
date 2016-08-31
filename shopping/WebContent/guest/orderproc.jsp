<%@page import="shop.order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session"/>
<jsp:useBean id="orderMgr" class="shop.order.OrderMgr"/>
<jsp:useBean id="productMgr" class="shop.product.ProductMgr"/>

<%
Hashtable hCart = cartMgr.getCartList();

Enumeration enu = hCart.keys();
if(hCart.size() == 0){
%>
	<script>
		alert("주문 내역이 없습니다.");
		location.href = "productlist.jsp";
	</script>
<%
}else{
	while(enu.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(enu.nextElement());
		orderMgr.insertOrder(order); //주문 DB에 저장
		productMgr.reduceProduct(order); //주문 수 만큼 상품 재고량 뺴기
		cartMgr.deleteCart(order);
	}
%>
	<script>
		alert("주문 신청 완료\n감사합니다.");
		location.href = "orderlist.jsp";
	</script>

<%
}

%>