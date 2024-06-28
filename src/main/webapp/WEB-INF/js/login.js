function loginButton() {
	const id = document.querySelector('#id')
	const password = document.querySelector('#password')
	//alert('함수작동')h
	//alert('id -> ' + id.value + ' password -> ' + password.value)
	if (id != null && id.value.trim().length == 0 ) {
		alert ('아이디를 입력해주세요!!!!')
	} else if (password != null && password.value.trim().length == 0) {
		alert( '비밀번호를 입력해주세요!!!!' )
	} else {
		
		const idValue = id.value;
		const passwordValue = password.value;
		const idPassword = {
			'id' : idValue,
			'password' : passwordValue
		}
		console.log(JSON.stringify(idPassword))
		
		
		fetch ('./loginCheck', {
			method : 'POST',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(idPassword)
		})
		.then ( (result) => {
			return result.json()
		})
		.then( (data) => {
			//console.log(data.resCode)
			const loginCheck = data.resCode;
			const status = document.querySelector("#status")
			if (loginCheck == 1) {
				alert('로그인 되었습니다 !!!')
				if (status.value.trim() === "ch") {
					location.href="bookingCheckList"
				} else {
					document.querySelector("#loginForm").submit()
				}
			} else {
				alert('로그인 정보가 잘못되었습니다!!!')
			}
		} )
	}
}