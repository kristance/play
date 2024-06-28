window.addEventListener("load", () => {
	const progreBar = document.querySelector("#progreBar")
	const processingForm = document.querySelector("#processingForm")
	//console.log(progreBar.getAttribute("aria-valuenow"))
	//console.log(progreBar.style.width)
	for (let i = 1; i < 5; i++) {
		if (i == 4) {
			setTimeout( () => {
				//console.log(i)
				progreBar.setAttribute("aria-valuenow", (25 * i))
				progreBar.style.width = (25 * i) + "%"
			}, (i * 1000) + 100 )			
					
		} else {
			setTimeout( () => {
				//console.log(i)
				progreBar.setAttribute("aria-valuenow", (25 * i))
				progreBar.style.width = (25 * i) + "%"
			}, i * 1000)
		}
	}
	
	setTimeout (() => {
		alert("결제가 완료되었습니다. 페이지 이동합니다.")
		processingForm.submit()
	}, 5020)
	
})


