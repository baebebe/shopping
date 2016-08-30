<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bean" class="shop.member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr"/>
<%
String id = request.getParameter("id");
boolean b = memberMgr.memberUpdate(bean, id);

if(b){
%>
	<script>
		alert("수정 성공");
		location.href = "member_manager.jsp";
	</script>
<%}else{%>
	<script>
		alert("수정 실패");
		history.back();
	</script>
<%
}
%>