<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String adminid = (String)session.getAttribute("adminKey");
if(adminid == null){
	response.sendRedirect("admin_login.jsp");
}
%>
<table style="width: 80%">
	<tr style="background-color: #aabbcc; text-align: center;" >
		<td><a href="../guest/guest_index.jsp">홈페이지</a></td>
		<td><a href="admin_logout.jsp">로그아웃</a></td>
		<td><a href="member_manager.jsp">회원관리</a></td>
		<td><a href="product_manager.jsp">상품관리</a></td>
		<td><a href="order_manager.jsp">주문관리</a></td>
	</tr>
</table>