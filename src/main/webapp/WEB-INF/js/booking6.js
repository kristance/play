
window.addEventListener('load', (event) => {
	
	//alert('함수 작동 ')
	const qrCodeLoc = document.querySelector('#qrCodeLoc')
	
	const playTitle = document.querySelector('#playTitle').value
	const viewer = document.querySelector('#viewer').value
	const viewPlace = document.querySelector('#viewPlace').value
	const bookNumber = document.querySelector('#bookNumber').value
	const viewerCount = document.querySelector('#viewerCount').value
	const viewDate = document.querySelector('#viewDate').value
	const viewTime = document.querySelector('#viewTime').value
	const phone = document.querySelector('#phone').value
	
	//console.log(('localhost:8080/play/qr_ticket?' + 'playTitle=' + playTitle.trim() +
	//												     '&bookNumber=' + bookNumber.trim() + 
	//												     '&viewer=' + viewer.trim() +
	//												     '&viewDate=' + viewDate.trim() +
	//												     '&viewerCount=' + viewerCount.trim() +
	//												     '&viewPlace=' + viewPlace.trim()))
	
	new QRCode(document.getElementById("qrCodeLoc"), {
		
			text :	('localhost:8080/play/qr_ticket?' + 'playTitle=' + playTitle +
													     '&bookNumber=' + bookNumber + 
													     '&viewer=' + viewer +
													     '&viewDate=' + viewDate +
													     '&viewTime=' + viewTime +
													     '&viewerCount=' + viewerCount +
													     '&viewPlace=' + viewPlace),
			width : 200,
			height : 200
	})
	
	
})




function clickButton(number) {
	//console.log(number)
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
	
	if (number == 1) { // 메인페이지 
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







