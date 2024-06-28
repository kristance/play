const m_button = document.querySelector("#m_button")
m_button.addEventListener("click", () => {
	//alert("함수 작동")
	const viewer = document.querySelector("#viewer")
	const viewDate = document.querySelector("#viewDate")
	const viewTime = document.querySelector("#viewTime") 
	const phone = document.querySelector("#phone")
	const email = document.querySelector("#email")
	const idxT = document.querySelector("#idxT")
	const currentPage = document.querySelector("#currentPage")
	if (viewDate != null && email != null && phone != null 
			&& viewer != null && viewTime != null ) 
	{
		
		if (viewer.value.trim().length == 0) {
			alert("관람인 이름을 다시 확인해주세요")
		}else if ( viewDate.options[viewDate.selectedIndex].value == "empty") {
			alert("관람 날짜를 다시 선택해주세요.")
		} else if ( viewTime.options[viewTime.selectedIndex].value == "empty") {
			alert("관람 시간을 다시 선택 해주세요.")
		} else if ( phone.value.trim().length == 0) {
			alert ("전화번호를 다시 확인 해주세요.")
		} else if ( email.value.trim().length == 0) {
			alert ("이메일을 다시 한번 확인해주세요")
		} else {
			//alert("정상작동")
			const infoData = {
				"idxT" : idxT.value,
				"viewer" : viewer.value,
				"viewDate" : viewDate.options[viewDate.selectedIndex].value,
				"viewTime" : viewTime.options[viewTime.selectedIndex].value,
				"phone" : phone.value,
				"email" : email.value
			}
			
			
			fetch ("./updateTicketInfo", {
				method : "POST",
				headers : {
					"content-type" : "application/json"
				},
				body : JSON.stringify(infoData)
			})
			.then ( (result) => {
				return result.text()
			})
			.then( (text) =>  {
				//console.log(text)
				if (text == 1) {
					alert("티켓 정보 수정되었습니다.")
					location.href = `ticketInfo?idxT=${idxT.value}&currentPage=${currentPage.value}`
				} else {
					alert("수정 실패하였습니다. 다시 시도해주세요.")
				}
			})
			
			
		}
			
			
	} else {
		alert ("오류가 발생했습니다.")
	}
	
	
	
	
})




const c_button = document.querySelector("#c_button")
c_button.addEventListener("click", () => {
	//alert("함수 작동")
	history.go(-1)
})



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



