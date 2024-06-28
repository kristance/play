

const name = document.querySelector("#name")
const email = document.querySelector("#email")
const searchButton = document.querySelector("#searchButton")
searchButton.addEventListener("click", (event) => {
	//alert("함수작동")
	if (name.value.trim().length == 0) {
		alert("아이디를 입력해주세요.")
	} else if (email.value.trim().length == 0) {
		alert("이메일을 입력해주세요 ")
	} else {
		//alert("하암수 작동")
		const formData = new FormData();
		formData.append("name", name.value)
		formData.append("email", email.value)
		const payload = new URLSearchParams(formData)
		
		fetch ("./searchPasswordForIdForm", {
			method : "POST",
			headers : {
				"content-type" : "application/x-www-form-urlencoded"
			},
			body : payload
		})
		.then ((result) => {
			return result.text()
		})
		.then( (text) =>  {
			//console.log(text.length)
			if (text.trim().length == 0) {
				alert("일치하는 아이디가 없습니다.")
				window.close()
			} else {
				location.href = `searchIdPasswordResult?result=${text}&status=fid`
			}
		})
		
	}
	
	
})