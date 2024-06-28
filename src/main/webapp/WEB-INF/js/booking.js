	const selectPlayIdx = document.querySelector('#selectPlayIdx')
	const selectPlayName = document.querySelector('#selectPlayName')
	const selectPlayButton = document.querySelector('#selectPlayButton')
function clickButton (idx) {
	//alert('함수 작동' + idx)
	selectPlayIdx.value = idx;
	selectPlayName.innerHTML = '공연 선택이 완료되었습니다. '
}

function clickNextButton() {
	const selectPlayform = document.querySelector('#selectPlayform')
	let selectPlayIdxValue =  selectPlayIdx.value
	//alert(selectPlayIdxValue.trim().length)
	//alert(selectPlayIdxValue)
	if (selectPlayIdxValue != null && selectPlayIdxValue.trim().length != 0){
		selectPlayform.submit();
		//alert(selectPlayIdxValue.trim().length)
	} else {
		alert('보고싶은 공연을 선택해주세요!!!')
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

function firstOverPage() {
	alert('첫번째 페이지입니다.')
}

function lastOverPage() {
	alert('마지막 페이지입니다.')
}


