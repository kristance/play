function limitPrev () {
	//alert("함수 작동 1")
	alert("첫번째  페이지 입니다.!!!!!")
}


function limitNext() {
	//alert("함수 작동 2")
	alert("마지막 페이지 입니다.!!!!!!")
}




function bookingCheckButton(loginCheck) {
	//alert('함수 작동')
	//console.log(loginCheck)
	if (loginCheck == 1) {
		location.href = 'bookingCheckList';
	} else {
		alert('로그인 해주세요!!!')
		location.href = 'login?status=ch'
	}
}




function bookingButton(loginCheck) {
	//alert("함수 작동")
	if (loginCheck == 1) {
		location.href = 'booking';
	} else {
		alert('로그인 해주세요!!!')
		location.href = 'twoWay'
	}
	
}