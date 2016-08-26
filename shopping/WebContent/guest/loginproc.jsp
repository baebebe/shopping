<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr"/>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

boolean b = memberMgr.loginCheck(id, passwd);

if(b){
	session.setAttribute("idKey", id);
	response.sendRedirect("guest_index.jsp");
}else{
	response.sendRedirect("loginfail.jsp");
}
%>