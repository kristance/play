window.addEventListener("load", (event) => {
	//alert("함수작동")
	const qrCodeLoc = document.querySelector('#qrCodeLoc')
	
	const playTitle = document.querySelector('#playTitle').value
	const viewer = document.querySelector('#viewer').value
	const viewPlace = document.querySelector('#viewPlace').value
	const bookNumber = document.querySelector('#bookNumber').value
	const viewerCount = document.querySelector('#viewerCount').value
	const viewDate = document.querySelector('#viewDate').value
	const viewTime = document.querySelector('#viewTime').value
	const phone = document.querySelector('#phone').value
	
	
	new QRCode(document.getElementById("qrCodeLoc"), {
		
			text :	('localhost:8080/play/qr_ticket?' + 'playTitle=' + playTitle +
													     '&bookNumber=' + bookNumber + 
													     '&viewer=' + viewer +
													     '&viewDate=' + viewDate +
													     '&viewTime=' + viewTime +
													     '&viewerCount=' + viewerCount +
													     '&viewPlace=' + viewPlace),
			width : 250,
			height : 250
	})
	
})


const c_button = document.querySelector("#c_button")
c_button.addEventListener("click", () => {
	const confirmValue = confirm("예약취소하사겠습니까??", false);
	//console.log(confirmValue)
	if (confirmValue != null && confirmValue == true) {
		//alert("예약취소하신단다.")
		const bookNumber = document.querySelector("#bookNumber")
		const promptValue = prompt("취소하려는 예약번호를 입력해주세요")
		//console.log(promptValue)
		if (bookNumber != null && promptValue != null &&
			 promptValue.trim().length != 0 &&
			 promptValue== bookNumber.value)	{
			// 입력 예약 번호 일치
				const idxT = document.querySelector("#idxT")
				
				const formData = new FormData();
				formData.append("idxT", idxT.value)
				const payload = new URLSearchParams(formData)
				
				fetch ("./cancelBooking", {
					method : "POST",
					headers : {
						"content-type" : "application/x-www-form-urlencoded"
					},
					body : payload
				})
				.then ( (result) => {
					return result.text()
				})
				.then( (text) => {
					//console.log("cancelBooking => " + text)
					if (text == 1) {
						alert("예약 취소 되었습니다. 다음엔 더 좋은 공연으로 뵙겠습니다.")
						location.href = "bookingCheckList"
					} else {
						alert("예약 취소에 실패하였습니다. 다시 시도해주세요.")
					}
				})
		} else {
			// 입력 예약번호 불일치
			alert("취소하려는 예약번호가 일치하지 않습니다. 다시 입력해주세요.")
		}	
		
		
	}else {
		alert("취소되지 않았습니다.")
	}
})



const m_button = document.querySelector("#m_button")
m_button.addEventListener("click", () => {
	const idxT = document.querySelector("#idxT")
	const currentPage = document.querySelector("#currentPage")
	//alert("함수 작동")
	console.log(idxT.value)
	alert("관람 인원수 및 공연 변경은 취소 후 다시 예매 부탁드립니다..")
	location.href="modifyPlayTicketInfo?idxT=" + idxT.value + "&currentPage=" + currentPage.value;
})















