window.addEventListener("load", (event) => {
	const loginId = document.querySelector("#loginId")
	const currentPage = document.querySelector("#currentPage")
	//alert("loginId -> " + loginId.value)
	const formData = new FormData()
	formData.append("id", loginId.value)
	const payload = new URLSearchParams(formData);
	fetch ("./canYouSawPlay", {
		method : "POST", 
		headers : {
			"content-type" : "application/x-www-form-urlencoded"
		},
		body : payload
	})
	.then( (result) => {
		return result.text()
	})
	.then ( (text) => {
		//console.log(text)
		if (text == 0) {
			alert("관람한 공연이 없어 공연 후기 작성이 불가합니다.")
			location.href="AfterViewReplyList?currentPage=" + currentPage.value;
		} else {
			
		}
	})
})



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
	
}


const contentReply = document.querySelector("#contentReply")
const typingCount = document.querySelector("#typingCount")
contentReply.addEventListener("keyup", (event) =>{
	//console.log(event.key)
 	typingCount.innerHTML = contentReply.value.length
})


const viewedPlaySel = document.querySelector("#viewedPlaySel")
const playTitle = document.querySelector("#playTitle")
viewedPlaySel.addEventListener("change", (event) => {
	//alert(event.target.value)
	fetch ("./getTitle?idxT=" + event.target.value , {
		method:"GET"
	}).then( (result) => {
		return result.text()
	}).then ( (text) => {
	playTitle.innerHTML = text
	})
})


const imageUpload = document.querySelector("#imageUpload")
const imageTag = document.querySelector("#imageTag")
imageUpload.addEventListener("change", (event) => {
	//console.log(event.target.files[0])	
	imageFile = event.target.files[0]
	imageValue = URL.createObjectURL(imageFile)
	imageTag.innerHTML = ""
	imageTag.innerHTML = `<img class="w-100 h-100" src="${imageValue}" style="object-fit:contain">`
	imageTag.addEventListener("load", () => {
		URL.revokeObjectURL(this.innerHTML)
	})
} )


const replyForm = document.querySelector("#replyForm")

replyForm.addEventListener("submit", (event) => {
	//console.log(imageUpload.files[0])
	
const imageUpload = document.querySelector("#imageUpload")
const starTemp = document.querySelector("#starTemp")
const subjectReplyTag = document.querySelector("#subjectReply")
const contentReplyTag = document.querySelector("#contentReply")
const loginId = document.querySelector("#loginId")
//console.log(imageUpload.files[0] == undefined)
	if (viewedPlaySel.value.trim() == "공연 선택") {
		event.preventDefault()
		alert("공연 후기를 작성할 공연을 선택해주세요.")
	} else if (subjectReplyTag.value.trim().length == 0) {
		event.preventDefault()
		alert("제목을 작성해주세요.")
	} else if (contentReplyTag.value.trim().length == 0) {
		event.preventDefault()
		alert("내용을 작성해주세요. 내용은 250자까지 가능합니다.")		
	} else if (imageUpload.files[0] == undefined) {
		event.preventDefault()
		alert("공연 후기와 관련된 사진을 올려주세요.")
	} else {
		event.preventDefault()
		const imageFile = imageUpload.files[0]
		const playStar = starTemp.value
		//const playTitle = viewedPlaySel.options[viewedPlaySel.selectedIndex].value
		const subjectReply = subjectReplyTag.value
		const contentReply = contentReplyTag.value
		const viewedPlaySelV = viewedPlaySel.value
		
		
		const formDate = new FormData()
		formDate.append("file", imageFile)
		formDate.append("playStar", playStar)
		formDate.append("playTitle", playTitle.innerText)
		formDate.append("subjectReply", subjectReply)
		formDate.append("contentReply", contentReply)
		formDate.append("loginId", loginId.value)
		formDate.append("idxT", viewedPlaySelV)
		//console.log("1번쨰 -> " + viewedPlaySel.options[viewedPlaySel.selectedIndex].value)
		//console.log("2번쨰 -> " + viewedPlaySel.value)
		fetch ("./saveReply", {
			method : "POST",
			body : formDate
		})
		.then ( (result) => {
			return result.text()
		})
		.then( (res) => {
			alert("res -> " + res)
			if (res == 1) {
				event.preventDefault()
				alert("공연 후기가 저장 되었습니다.")
				location.href="AfterViewReplyList"
			} else {
				event.preventDefault()
				alert("공연 후기 저장에 실패하였습니다.")
			}
		})
	}

	
	
})



function bookingButton(loginCheck) {
	//alert("함수 작동")
	if (loginCheck == 1) {
		location.href = "booking"
	} else {
		alert("로그인 해주세요. !!!!")
		location.href = "twoWay"
	}
}

function bookingCheckButton(loginCheck) {
	//alert("함수 작동")
	if (loginCheck == 1) {
		location.href = "bookingCheckList"
	} else {
		alert("로그인 해주세요. !!!!")
		location.href = "login?status=ch"
	}
}






