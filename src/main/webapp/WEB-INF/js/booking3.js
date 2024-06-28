	const seatNumber = document.querySelector('#seatNumber')
function selectSeat(obj) {
	let confirmSeat = confirm(obj.innerText + '가 맞습니까?', false)
	let selectSeatResult = document.querySelector('#selectSeatResult')
	//console.log(confirm(obj.innerText + '가 맞습니까?', false))
	// 확인 -> true, 취소 -> false
	
	if (confirmSeat == true) {
		selectSeatResult.innerHTML = ''
		selectSeatResult.innerHTML = '<div class="bg-black text-white"><h4><b>' +
									  obj.innerText + '석</b></h4></div>'
		seatNumber.value = obj.innerHTML
		
	}
		
}
		
	

function booking3NextButton() {
	const selectSeatForm = document.querySelector('#selectSeatForm')
	//alert('함수작동')
	if (seatNumber.value != null && seatNumber.value.trim().length != 0) {
		//alert('함수 작동')
		selectSeatForm.submit();
	} else {
		alert('좌석을 선택해주세요!!!!')
	}	
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