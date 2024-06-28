function replyWrite(loginCheck, status, currentPage) {
	//alert("loginCheck -> " + loginCheck)
	
	if (loginCheck == 1) {
		location.href="AfterViewReplyWrite"
	} else {
		//console.log(currentPage)
		alert("글을 작성하기 위해서 로그인 해주세요.")
		location.href="loginNotB?status=" + status + "&currentPage=" + currentPage;
		
	}
	
}



function bookingButton(loginCheck) {
	//alert("함수 작동")
	if (loginCheck == 1) {
		location.href = "booking"
	} else {
		alert('로그인 해주세요!!!')
		location.href = "twoWay"
	}
	
}



function bookingCheckButton(loginCheck) {
	//alert("함수 작동")
	if (loginCheck == 1) {
		location.href = "bookingCheckList"
	} else {
		alert('로그인 해주세요!!!')
		location.href = "login?status=ch"
	}
}



