		
function bookingCheckButton(loginCheck) {
	//alert('함수 작동')
	//console.log(loginCheck)
	if (loginCheck == 1) {
		location.href = 'bookingCheckList';
	} else  {
		alert('로그인 해주세요!!!')
		location.href = 'login?status=ch'
	}
}		


function booking5NextButton() {
	//alert('함수작동')
	const booking5Form = document.querySelector('#booking5Form')
	let confirmValue = confirm('입력했던 내용이 맞으면 결제하기 화면으로 이동합니다', false)
	if (confirmValue == true) {
		booking5Form.submit();
	} else {
		
	}
	
}



