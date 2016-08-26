<%@page import="shop.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="shop.board.BoardMgr"/>
<jsp:useBean id="dto" class="shop.board.BoardDto"/>
<%
int spage = 1;
int pageSu = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnSearch").onclick = function(){
		if(frm.sword.value == ""){
			frm.sword.focus();
			alert("검색어를 입력하시오!");
			return;
		}
		frm.submit();
	}
}
</script>
</head>
<body>
<table>
	<tr>
		<td>
			[<a href="../guest/guest_index.jsp">메인으로</a>]&nbsp;
			[<a href="boardlist.jsp">최신목록</a>]&nbsp;
			[<a href="boardwrite.jsp">새글작성</a>]&nbsp;
			[<a href="#" onclick="window.open('admin.jsp','','width=300,height=150,top=200,left=300')">관리자용</a>]&nbsp;
		<br><br>
		<table style="width: 100%">
			<tr style="background-color: silver;">
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			</tr>
		<%
		request.setCharacterEncoding("utf-8");
		try{
			spage = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e){
			spage = 1;
		}
		if(spage <= 0) spage = 1;
		
		//검색이 있는 경우
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		boardMgr.totalList();
		pageSu = boardMgr.getPageSu(); //전체 페이지수 얻기
		
		
		ArrayList<BoardDto> list = boardMgr.getDataAll(spage,stype, sword);
		for(int i = 0; i < list.size(); i++){
			dto = (BoardDto)list.get(i);
			//댓글 들여쓰기 준비 ------
			int nst = dto.getNested();
			String tab = "";
			String icon = "";
			for(int k = 0; k < nst; k++){
				tab += "&nbsp;&nbsp;";
				icon = "<img src='../image/re.gif' />";
			}
		%>
			<tr>
				<td><%=dto.getNum()%></td>
				<td>
					<%=tab %><%=icon %><a href="boardcontent.jsp?num=<%=dto.getNum()%>&page=<%=spage%>"><%=dto.getTitle()%></a>
				</td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getBdate()%></td>
				<td><%=dto.getReadcnt()%></td>
			</tr>
		<%
		}
		%>
		</table>
		<br>
		<table style="width: 100%">
			<tr>
				<td style="text-align: center;">
					<%
					for(int i = 1; i <= pageSu; i++){
						if(i == spage){
						out.print("<b style='font-size:14px;color:red;'>[" + i + "]</b>");							
						}else{
						out.print("<a href='boardlist.jsp?page=" + i +"'>[" + i + "]</a>");
						}
					}
					%>
					<br/><br/>
					<form action="boardlist.jsp" name="frm" method="post">
					<select name="stype">
						<option value="title" selected="selected">글제목</option> 
						<option value="name">작성자</option>
					</select>
					<input type="text" name="sword">
					<input type="button" value="검색" id="btnSearch">
					</form>
				</td>
			</tr>
		</table>
		</td>
		
	</tr>
</table>
</body>
</html>