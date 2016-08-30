<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr"/>
<%
String adminid = request.getParameter("adminid");
String adminpasswd = request.getParameter("adminpasswd");

boolean b = memberMgr.adminloginCheck(adminid, adminpasswd);
if(b){
	session.setAttribute("adminKey", adminid);
	response.sendRedirect("admin_index.jsp");
}else{
%>
	<script>
		alert("관리자 로그인 실패");
		location.href = "admin_login.jsp";
	</script>
<%
}
	
%>