
function bookingCheckButton(loginCheck) {
	//alert('함수 작동')
	//console.log(loginCheck)
	if (loginCheck == 1) {
		location.href = 'bookingCheckList';
	} else if (loginCheck == 2) {
		alert('로그인 해주세요!!!')
		location.href = 'login?status=ch'
	} else {
		
	}
}


