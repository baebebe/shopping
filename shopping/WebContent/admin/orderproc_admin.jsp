<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="shop.order.OrderMgr"/>

<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
String state = request.getParameter("state");

boolean b = false;

if(flag.equals("update")){
	b = orderMgr.updateOrder(no, state);
}else if(flag.equals("delete")){
	b = orderMgr.deleteOrder(no);
}else{
	response.sendRedirect("ordermanager.jsp");
}

if(b){
%>
	<script>
	alert("정상적으로 처리되었습니다.");
	location.href = "order_manager.jsp";
	</script>
<%}else{%>
	<script>
	alert("오류 발생\n오류!!");
	location.href = "order_manager.jsp";
	</script>
<%	
}
%>