<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="shop.board.BoardMgr"/>
<%
String num = request.getParameter("num");
String spage = request.getParameter("page");
String pass = request.getParameter("pass");

boolean b = boardMgr.checkPass(Integer.parseInt(num),pass);

if(b){
	boardMgr.delData(num);	
	response.sendRedirect("boardlist.jsp?page" + spage);
}else{
%>
	<script>
		alert("비밀번호 불일치!");
		history.back();
	</script>
<%
}
%>