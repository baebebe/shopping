<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="shop.product.ProductMgr" />
<%
String flag = request.getParameter("flag");
boolean result = false;

if(flag.equals("insert")){
	result = productMgr.insertProduct(request);
}else if(flag.equals("update")){
	//result = productMgr.updateProduct(request);
}else if(flag.equals("delete")){
	response.sendRedirect("product_manager.jsp");
}

if(result){
%>
	<script>
		alert("정상적으로 처리되었습니다");
		location.href = "product_manager.jsp";
	</script>
<%}else{%>
	<script>
		alert("오류 발생!");
		location.href = "product_manager.jsp";
	</script>
<%
}
%>