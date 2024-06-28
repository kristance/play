
const id = document.querySelector("#id")
const name = document.querySelector("#name")
const email = document.querySelector("#email")
const searchButton = document.querySelector("#searchButton")
searchButton.addEventListener( "click", (event) => {
	//alert("함수작동")
	if (id.value.trim().length == 0) {
		alert("아이디를 입력해주세요.")
	} else if (name.value.trim().length == 0) {
		alert("이름을 입력해주세요.") 
	} else if (email.value.trim().length == 0) {
		alert("이메일을 입력해주세요.")
	} else {
		//alert("하암수 작동")
		const jsonData = {
			"id" : id.value,
			"name" : name.value,
			"email" : email.value
			
		}
		
		
		fetch ( "./searchPasswordForPassForm", {
			method : "POST",
			headers : {
				"content-type" : "application/json"
			},
			body : JSON.stringify(jsonData)
		})
		.then ((result) => {
			return result.text()
		})
		.then ((text) => {
			//console.log(text.length)
			if (text.trim().length == 0) {
				alert("일치하는 정보가 없습니다.")
			} else {
				const password = CryptoJS.enc.Base64.stringify(CryptoJS.enc.Utf8.parse(text)) 
				location.href = `searchIdPasswordResult?result=${password}&status=fpass`
			}
		})
		
		
	}
	
	
})


