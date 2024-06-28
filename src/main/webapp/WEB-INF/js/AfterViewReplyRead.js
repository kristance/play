

const modifyWritedReplyForm = document.querySelector("#modifyWritedReplyForm")
modifyWritedReplyForm.addEventListener("submit", (event) => {
	event.preventDefault()
	const loginCheck = document.querySelector("#loginCheck")
	if (loginCheck != null) {
		if (loginCheck.value == 1) {
			modifyWritedReplyForm.submit()
		} else {
			event.preventDefault()
			alert("글을 수정하려면 로그인 해주세요.")
			const currentPage = document.querySelector("#currentPage")
			const idxC = document.querySelector("#idxC")
			console.log(idxC.value)
			location.href="loginNotB?status=ww&idxC=" + idxC.value + "&currentPage=" + currentPage.value
		}
	}
	
	//alert("함수작동")
})




function open1() {
	const leftSide = document.getElementsByClassName("leftSide")
	const rightSide = document.getElementsByClassName("rightSide")
	//alert("함수작동")
	for (let i = 0; i < leftSide.length; i++) {
		leftSide[i].style.display = "none";
		rightSide[i].style.display = "block";
	}
}

function open2() {
	const leftSide = document.getElementsByClassName("leftSide")
	const rightSide = document.getElementsByClassName("rightSide")
	//alert("함수작동")
	for (let i = 0; i < leftSide.length; i++) {
		leftSide[i].style.display = "block";
		rightSide[i].style.display = "none";
	}
}




function bookingButton (loginCheck) {
	//alert("함수 작동 ")
	if (loginCheck == 1){
		location.href = "booking"
	} else {
		alert ("로그인 해주세요. !!!!")
		location.href = "twoWay"
	}
}

function bookingCheckButton (loginCheck) {
	//alert("함수 작동 ")
	if (loginCheck == 1) {
		location.href = "bookingCheckList"
	} else {
		alert ("로그인 해주세요. !!!!")
		location.href = "login?status=ch"
	}
	
}










