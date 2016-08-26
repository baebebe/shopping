function zipCheck() {
	url = "zipcheck.jsp?check=y";
	
	window.open(url,"zip","toolbar=no,width=350,height=300,top=200,left=300,status=yes,scrollbars=yes,menubar=no");	
}

function idCheck() {
	if(regForm.id.value === ""){
		alert("ID를 입력하시오");
		regForm.id.focus();
	}else{
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url,"id","width=300,height=150,top=150,left=150")
	}
}

function inputCheck() {
	//입력자료 오류 검사.
	document.regForm.submit();
}

//쇼핑몰 로그인 후 자신의 정보 수정 시 
function memberUpdate() {
	//입력자료 오류 검사 (생략)
	document.updateForm.submit();
}

function memberUpdateCancel() {
	location.href = "../guest/guest_index.jsp";
}

function memberDelete() {
	alert("회원탈퇴는 죽음을 부름!!");
}