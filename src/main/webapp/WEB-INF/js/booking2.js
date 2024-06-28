const selectTimeForm = document.querySelector('#selectTimeForm')

function selectTimeNextButton() {
	//alert('함수작동')
	const viewPlace = document.querySelector('#viewPlace')
	const viewTime = document.querySelector('#viewTime')
	const dateTag = document.querySelector('#dateTag')
	const startDate = document.querySelector('#startDate')
	const endDate = document.querySelector('#endDate')
	//console.log("nowDate V -> " + typeof(nowDate.value))
	//console.log("dateTag V -> " + typeof(dateTag.value))
	//console.log("nowDate V -> " + nowDate.value)
	//console.log("dateTag V -> " + dateTag.value)
	//alert(play_place.value)
	if (viewPlace != null && viewPlace.value == '공연장소 선택' ) {
		alert(' 공연 장소를 선택해주세요!!!')
	} else if ( dateTag != null && dateTag.value == "공연날짜 선택"  ) {
		alert( '원하는 공연 날짜를 선택해주세요.' )
	} else if ( viewTime != null && viewTime.value == '공연시간 선택' ) {
		alert( '공연시간을 선택해주세요!!!! ' )
	} else {
		selectTimeForm.submit()
		
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