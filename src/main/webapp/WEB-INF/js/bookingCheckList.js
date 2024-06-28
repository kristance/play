

function clickFirstPage() {
	alert("첫번째 페이지 입니다.")
}

function clickLastPage() {
	alert("마지막 페이지입니다.")
}





function bookingButton(loginCheck) {
	//alert('함수 작동')
	//console.log(loginCheck)
	if (loginCheck == 1) {
		location.href = 'booking';
	} else {
		alert('로그인 해주세요!!!')
		location.href = 'twoWay'
	}
}		