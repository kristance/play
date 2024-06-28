window.onload = () => {
	const status = document.querySelector("#status")
	const result = document.querySelector("#result")
	const statusV = document.querySelector("#statusV")
	const resultV = document.querySelector("#resultV")
	
	if (statusV.value.trim() == "비밀번호") {
		status.innerHTML = ""
		status.innerHTML = " * 비밀번호 "
		result.innerHTML = ""
		const cValue = window.atob(resultV.value)
		result.innerHTML = cValue
	} else if (statusV.value.trim() == "아이디") {
		status.innerHTML = ""
		status.innerHTML = " * 아이디 "
		result.innerHTML = ""
		result.innerHTML = resultV.value
	} else {
		console.log("아이디 / 비밀번호 찾기 에러 발생")
	}
	
}