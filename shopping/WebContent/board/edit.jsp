<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="shop.board.BoardMgr"/>
<jsp:useBean id="dto" class="shop.board.BoardDto"/>
<%
String spage = request.getParameter("page");
String num= request.getParameter("num");
dto = boardMgr.getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script>
function check(){
	if(frm.name.value==""){
		alert("이름을 입력하세요");
		frm.name.focus();
	}else if(frm.pass.value ==""){
		alert("비밀번호를 입력하세요");
		frm.pass.focus();
	}else if(frm.mail.value ==""){
		alert("이메일을 입력하세요");
		frm.mail.focus();
	}else if(frm.title.value ==""){
		alert("제목을 입력하세요");
		frm.title.focus();
	}else if(frm.cont.value ==""){
		alert("내용을 입력하세요");
		frm.cont.focus();
	}else{
		if(confirm("정말 수정하시겠습니까?"))
		frm.submit();
	}
}
</script>
</head>
<body>
<h2 class="title">*** 글수정 ***</h2>
<form name="frm" method="post" action="editsave.jsp">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="page" value="<%=spage%>">
	
	<table border="1" width="90%">
		<tr>
			<td align="center" width="100">이 름</td>
			<td width="430"><input name="name" size="15" value="<%=dto.getName()%>"></td>
		</tr>
		<tr>
			<td align="center">암 호</td>
			<td><input type="password" name="pass" size="15"></td>
		</tr>
		<tr>
			<td align="center">메 일</td>
			<td><input name="mail" size="25" value="<%=dto.getMail()%>"></td>
		</tr>
		<tr>
			<td align="center">제 목</td>
			<td><input name="title" size="50" value="<%=dto.getTitle()%>"></td>
		</tr>
		<tr>
			<td align="center">내 용</td>
			<td><textarea name="cont" cols="50" rows="10"><%=dto.getCont()%></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="30">
				<input type="button" value="수정완료" onClick="check()">&nbsp;
				<input type="button" value="목록보기"
				  onClick="location.href='boardlist.jsp?page=<%=spage%>'"></td>
		</tr>
	</table>
</form>
</body>
</html>