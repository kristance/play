window.addEventListener("load", () => {
	history.replaceState(null, "", "./block")
})


function clickButton(number) {
	console.log(number)
	fetch ("./deleteSessionValue", {
		method : "GET"
	})
	.then ( (result) => {
		return result.text()
	})
	.then ( (text) => {
		if (text == 400) {
			console.log("blockReload 세션값 없음")
		} else {
			console.log("정상처리 ")
		}
	})
	
	if (number == 1) {
		location.href ='gate'
		
	} else if (number == 2) { // 예약하기 
		const loginCheck = document.querySelector("#loginCheck").value
		if (loginCheck == 1) {
			location.href = 'booking'
		} else {
			alert ("로그인 해주세요. !!!!")
			location.href = "twoWay"
		}
		
	} else if (number == 3) { // 예약 확인 
		const loginCheck = document.querySelector("#loginCheck").value
		if (loginCheck == 1) {
			location.href = 'bookingCheckList'
		} else {
			alert ("로그인 해주세요. !!!!")
			location.href = "login?status=ch"
		}
	
	} else if (number == 4) { // 공연 리스트 
		location.href = 'playList'
		
	} else if (number == 5) { // 공연 후기
		location.href = 'AfterViewReplyList'
	} else {
		alert("예외 발생 ")
	}
	
	
}