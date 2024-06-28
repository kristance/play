const anonymousLoginForm = document.querySelector('#anonymousLoginForm')
anonymousLoginForm.addEventListener("submit", (event) => {
		const bookNumber = document.querySelector('#bookNumber')
		const email = document.querySelector('#email')
		const viewer = document.querySelector('#viewer')
		const status = document.querySelector("#status")
		
	
	if (bookNumber != null && email != null) {
		if (bookNumber.value.trim().length != 0 && email.value.trim().length != 0) {
				event.preventDefault();
				const loginInfo = {
					'bookNumber' : bookNumber.value,
					'email' : email.value
				}
				
				fetch ('./anonymousLoginCheck', {
					method : 'POST',
					headers : {
						'Content-Type' : 'application/json'
					},
					body : JSON.stringify(loginInfo)
				})
				.then ( (result) => {
					return result.json()
				})
				.then ( (data) => {
					if (data == 0) {
						alert("일치하는 예매 정보가 없습니다.")
					} else {
						if (status.value.trim() === "ch") {
							location.href="bookingCheckList"
						} else {
							anonymousLoginForm.submit()
						}
					}			
				})
					
			} else {
				event.preventDefault();
				alert("입력 필드를 모두 채워주세요.")
			}
		} else {
			
		}
	})
	
