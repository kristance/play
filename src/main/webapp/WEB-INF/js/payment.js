
const paymentForm = document.querySelector("#paymentForm")
paymentForm.addEventListener("submit", (event) => {
		
		event.preventDefault();
		const kindOfCard = document.querySelector("#kindOfCard")
		const cardNo1 = document.querySelector("#cardNo1")
		const cardNo2 = document.querySelector("#cardNo2")
		const cardNo3 = document.querySelector("#cardNo3")
		const cardNo4 = document.querySelector("#cardNo4")
		
		const exp1 = document.querySelector("#exp1")
		const exp2 = document.querySelector("#exp2")
		
		const owner = document.querySelector("#owner")
		
		if (kindOfCard.value == "카드 선택") {
			event.preventDefault()
			alert("카드를 선택해주세요.")
		} else {
		
		//console.log(kindOfCard.value)
		//console.log(cardNo1.value)
		//console.log(cardNo2.value)
		//console.log(cardNo3.value)
		//console.log(cardNo4.value)
		//console.log(exp1.value)
		//console.log(exp2.value)
		//console.log(owner.value)
		const cardNoArr = [cardNo1.value.trim(), cardNo2.value.trim(),
							 cardNo3.value.trim(), cardNo4.value.trim()]
		const cardNumber = cardNoArr.join("-")
		const expDate = exp1.value.trim() +  "/" + exp2.value.trim()
		console.log(expDate)
	 
		 
		
		//console.log(ownerEnc)
		const cardInfo = {
			"owner": owner.value,
			"cardNumber" : cardNumber,
			"kindOfCard" : kindOfCard.value,
			"expDate" : expDate
		}
		
		
		
		fetch ("./checkCardOwner", {
			method : "POST",
			headers : {
				"content-type" : "application/json"
			},
			body: JSON.stringify(cardInfo)
		})
		.then ( (result) => {
			return result.text()
		})
		.then( (json) => {
			console.log("json -> " + json)
			if (json == 1) { // 카드 정보 일치
				const password = prompt("카드 비밀번호를 입력해주세요.")
				//console.log(password)
				
				if (password.trim().length == 0) {
					
					alert("비밀번호를 입력해주세요.")
					
				} else {
				
					const cardInfowithPassword = {
							"owner": owner.value.trim(),
							"cardNumber" : cardNumber.trim(),
							"kindOfCard" : kindOfCard.value,
							"expDate" : expDate.trim(), 
							"password" : password.trim()
						}
					
					// 카드 비밃번호 확인
					fetch ("./isYourCardPassword", {
						method : "POST",
						headers : {
							"content-type" : "application/json"
						},
						body : JSON.stringify(cardInfowithPassword)
					})
					.then ( (res) => {
						return res.json()
					})
					.then( (returnJson) => {
						//console.log(returnJson.result)
						if (returnJson.result == 1) { // 비밀번호 OK
							document.querySelector("#chargeKey").value = returnJson.chargeKey
							document.querySelector("#idxCard").value = returnJson.idxCard
							//console.log("owner -> " + owner.value);
							//console.log(returnJson.chargeKey)
							history.replaceState(null, "", "./block")
							paymentForm.submit()
							
						} else { // 비밀번호 불일치
							event.preventDefault()
							alert("카드 비밀번호가 다릅니다. 다시 진행해 주세요.")
						}
						
					})
					
				}		
			} else { // 카드 정보 불일치
				event.preventDefault()
				alert("카드 정보를 확인바랍니다.")
				
			}
			
			
			
		})
		
	}	
		
})

function checkOutAccount () {
	//alert("함수작동")
	const checkOutAlert = document.querySelector("#checkOutAlert")
	checkOutAlert.innerHTML = "현재 카드 결제만 지원합니다. 다른 결제는 추후 지원할 예정입니다."
}














