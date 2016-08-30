<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnAdminLogin").onclick = funcAdminLogin;
	document.getElementById("btnHome").onclick = funcHome;
}

function funcAdminLogin(){
	if(adminlogin.adminid.value == ""){
		alert("ID를 입력하세요");
		adminlogin.adminid.focus();
		return;
	}
	if(adminlogin.adminpasswd.value == ""){
		alert("패스워드를 입력하세요");
		adminlogin.adminpasswd.focus();
		return;
	}
	adminlogin.submit();
}
function funcHome(){
	location.href = "../guest/guest_index.jsp";
}


	
</script>
</head>
<body>
<form action="admin_loginproc.jsp" name="adminlogin" method="post">
<table style="">
	<tr>
		<td colspan="2" style="text-align: center;">
			** 관리자 로그인 **
		</td>
	</tr>
	<tr>
		<td>id :</td>
		<td><input type="text" name="adminid"></td>
	</tr>
	<tr>
		<td>pwd :</td>
		<td><input type="text" name="adminpasswd"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="button" value="관리자 로그인" id="btnAdminLogin">
			<input type="button" value="메 인 화 면" id="btnHome">
		</td>
	</tr>
</table>
</form>
</body>
</html>