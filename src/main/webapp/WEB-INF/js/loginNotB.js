function loginButton() {
	const id = document.querySelector('#id')
	const password = document.querySelector('#password')
	const status = document.querySelector('#status')
	const currentPage = document.querySelector('#currentPage')
	const idxC = document.querySelector('#idxC')
	//alert('함수작동')
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
		//console.log(JSON.stringify(idPassword))
		
		
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
			//console.log(loginId)
			// 로그인 ㅇ	
			const loginCheck = data.resCode;
			if (loginCheck == 1) {
				if (status.value == "w") {
					alert('로그인 되었습니다 !!!')
					location.href = 'AfterViewReplyWrite?currentPage=' + currentPage.value;
				} else if (status.value == "ww") {
					alert('로그인 되었습니다 !!!')
					location.href = 'modifyWritedReplyForm?idxC=' + idxC.value + '&currentPage=' + currentPage.value;
				} else {
					alert('로그인 되었습니다 !!!')
					location.href = 'booking';
				}
			
			// 로그인 X	
			} else {
				alert('로그인 정보가 잘못되었습니다!!!')
			}
		} )
	}
}


function signUpClick(status, currentPage, idxC) {
	if (idxC == undefined) {
		if (status == "w") {
			location.href = `signUp?status=${status}&currentPage=${currentPage}`
		} else if (status == "n"){
			location.href = `signUp?status=${status}&currentPage=${currentPage}`
		}
	} else {
		if (status == "ww") {
			location.href = `signUp?status=${status}&currentPage=${currentPage}&idxC=${idxC}`
		}
// ---------  idxC
	}
}







