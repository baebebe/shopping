<%@page import="shop.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
** 관리자 전체회원관리 **<br>
<%@include file="admin_top.jsp" %>
<table style="width: 80%">
	<tr>
		<th>아이디</th><th>회원명</th><th>비밀번호</th><th>이메일</th><th>전화번호</th><th>수정</th>
	</tr>
	<%
	ArrayList<MemberBean> list = memberMgr.getMemberAll();
	for(MemberBean m:list){
	%>
	<tr style="text-align: center;">
		<td><%=m.getId() %></td><td><%=m.getName() %></td><td><%=m.getPasswd() %></td><td><%=m.getEmail() %></td><td><%=m.getPhone() %></td><td><a href="javascript:memUpdate('<%=m.getId()%>')">수정하기</a></td>
	<tr>
	<%		
	}
	%>
</table>
<%@include file="admin_bottom.jsp" %>
<form action="memberupdate2.jsp" name="updateFrm" method="get">
<input type="hidden" name="id">
</form>
</body>
</html>