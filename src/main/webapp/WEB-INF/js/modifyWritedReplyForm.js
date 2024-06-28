function upStar() {
	//alert("함수작동")
	const starTemp = document.querySelector("#starTemp")
	const star = document.querySelector("#star")
	
	starTemp.value++
	if (starTemp.value >= 6) {
		starTemp.value = 1
	}
	temp = ""
	for (let  i= 0; i < starTemp.value ;i++){
		 temp += '<span><img src="./image/star.png"width="35px"></span>'
	}
	star.innerHTML =  temp
	//console.log("star => " + starTemp.value)
}




const imageFile = document.querySelector("#imageFile")
const imageTag = document.querySelector("#imageTag")
imageFile.addEventListener("change", (event) => {
	//console.log(event.target.files[0])
	const file = event.target.files[0]
	const imageValue = URL.createObjectURL(file)
	imageTag.src = ""
	imageTag.src = imageValue
	imageTag.addEventListener("load", () => {
		URL.revokeObjectURL(this.src)
	})
})


const modifyButton = document.querySelector("#modifyButton")
const subjectReply = document.querySelector("#subjectReply")
const contentReply = document.querySelector("#contentReply")
const idxC = document.querySelector("#idxC")
const currentPage = document.querySelector("#currentPage")
modifyButton.addEventListener("click", (event) => {
	event.preventDefault()
	//alert("함수작동")
	if (subjectReply != null && contentReply != null) {
		if (subjectReply.value.trim().length == 0) {
			alert("제목을 입력해주세요.")
		} else if (contentReply.value.trim().length == 0) {
			alert("내용을 입력해주세요.")
		} else {
			const confirmV = confirm("수정하시겠습니까???", false)
			if (confirmV == true) {
				const file = imageFile.files[0]
				const formData = new FormData();
				formData.append("notFile", 1)
				if (file != null || file != undefined) {
					formData.append("image", file)
				} else {
					formData.append("notFile", 2)
				}
				formData.append("idxC", idxC.value)
				formData.append("subjectReply", subjectReply.value)
				formData.append("contentReply", contentReply.value)
				console.log(idxC.value)
				console.log(subjectReply.value)
				console.log(contentReply.value)
				fetch ("./modifyAfterViewReply", {
					method : "POST", 
					body : formData
				})
				.then( (result) => {
					return result.text()
				})
				.then ( (text) => {
					if (text == 1) {
						alert("수정 완료되었습니다.")
						location.href=`AfterViewReplyRead?idxC=${idxC.value}&currentPage=${currentPage.value}`
					} else {
						alert("오류가 발생되었습니다. 수정에 실패하였습니다.")
					}
				})
				
			}
		}
	} else {
	}
})


function movePageLostContent(number) {
	const confirmV = confirm("페이지를 벗어나면 작성된 내용이 유실됩니다. 동의하십니까?", false)
	if (confirmV == true) {
		// 페이지 벗어나기 동의 
		history.replaceState(null, "", "./block")
		const loginCheck = document.querySelector("#loginCheck").value
		switch (number) {
			case 1:
				location.href = 'gate'
				break;
			case 2:
				if (loginCheck == 1) {
					location.href = 'booking'
					break;
				} else {
					alert ("로그인 해주세요. !!!!")
					location.href = "twoWay"
					break;
				}
			case 3: 
				if (loginCheck == 1) {
					location.href = "bookingCheckList"
					break;
				} else {
					alert ("로그인 해주세요. !!!!")
					location.href = "login?status=ch"
					break;
				}
			case 4: 
				location.href = 'playList'
				break;
			case 5:
				location.href = 'AfterViewReplyList'
			case 6:
				const idxC = document.querySelector("#idxC").value
				const currentPage = document.querySelector("#currentPage").value
				location.href = `AfterViewReplyRead?idxC=${idxC}&currentPage=${currentPage}`
		}
	} else {
		// 페이지 벗어나길 거부 
	}
}




















