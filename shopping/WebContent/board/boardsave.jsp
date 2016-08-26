<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="shop.board.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardMgr" class="shop.board.BoardMgr"/>

<%
int maxNum = boardMgr.currentGetNum() + 1;
bean.setNum(maxNum);
bean.setGnum(maxNum);
bean.setBip(request.getRemoteAddr());
bean.setBdate();
boardMgr.saveData(bean); //새글 저장

response.sendRedirect("boardlist.jsp?page=1");
%>