window.onload = () => {
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
													     '&phone=' + phone +
													     '&viewerCount=' + viewerCount +
													     '&viewPlace=' + viewPlace),
			width : 200,
			height : 200
	})
	
}