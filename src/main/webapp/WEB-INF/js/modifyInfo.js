window.addEventListener("load", (event) => {
	//alert("함수 작동")
	const idxM = document.querySelector("#idxM")
	//alert("idxM -> " + idxM.value)
	fetch ("./defaultFormValue_modifyInfo", {
		method : "POST",
		headers : {
			"Content-Type" : "application/json"
		},
		body :  JSON.stringify({
			"idxM" : idxM.value
		})
	})
	.then( (result) => {
		return result.json()
	})
	.then( (json) => {
		//console.log(json)
		//console.log(decodeURIComponent(json.addrMain).replaceAll("+", " "))
		const idV = decodeURIComponent(json.id).replaceAll("+", " ");
		const passwordV = decodeURIComponent(json.password).replaceAll("+", " ");
		const addrPostV = decodeURIComponent(json.addrPost).replaceAll("+", " ");
		const addrMainV = decodeURIComponent(json.addrMain).replaceAll("+", " ");
		const addrDetail1V = decodeURIComponent(json.addrDetail1).replaceAll("+", " ");
		const addrDetail2V = decodeURIComponent(json.addrDetail2).replaceAll("+", " ");
		const emailV = decodeURIComponent(json.email).replaceAll("+", " ");
		const phoneV = decodeURIComponent(json.phone).replaceAll("+", " ");
		const nameV = decodeURIComponent(json.name).replaceAll("+", " ");
		
		
		const id = document.querySelector("#id")
		const idValue = document.querySelector("#idValue")
		const password = document.querySelector("#password")
		const addrPost = document.querySelector("#sample6_postcode")
		const addrMain = document.querySelector("#sample6_address")
		const addrDetail1 = document.querySelector("#sample6_extraAddress")
		const addrDetail2 = document.querySelector("#sample6_detailAddress")
		const email = document.querySelector("#email")
		const phone = document.querySelector("#phone")
		const name = document.querySelector("#name")
		
		idValue.innerText = idV;
		id.value = idV;
		password.value = passwordV;
		addrPost.value = addrPostV;
		addrMain.value = addrMainV;
		addrDetail1.value = addrDetail1V;
		addrDetail2.value = addrDetail2V;
		email.value = emailV;
		phone.value = phoneV;
		name.value = nameV;
		
	})
	
})


function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    

// signOut button     
function signOut() {
	let promptValue = prompt('회원탈퇴를 원하시면 비밀번호를 입력해주세요??') //prompt는 취소를 누르면 null를 반환
	//console.log(promptValue)
	
	if(promptValue != null) {
		if (promptValue.trim().length != 0) {
			const id = document.querySelector("#id")
			const password = document.querySelector("#password")
			//alert("id -> " + id.value + " password -> " + password.value)
			const sendData = { 
				"id" : id.value,
				"password" : password.value
			}
			fetch ("./signOut", {
				method : "POST",
				headers : {
					"content-type" : "application/json"
				},
				body : JSON.stringify( sendData )
			})
			.then ( (result) => {
				return result.text()
			})
			.then ( (text) => {
				//alert("text -> " + text)
				if (text == 1) {
					alert("회원탈퇴가 완료되었습니다.")
					location.href = "gate"
				} else {
					alert("회원탈퇴가 실패하였습니다. 다시 시도해주세요.")
				}
			})
			
		} else {
			alert('비밀번호가 틀렸습니다.')
		}
	} else {
		
	}
}
    
    
    
// preview image after upload
const imageUpload = document.querySelector('#imageUpload')
const imageTag = document.querySelector('#imageTag')
	const imageLoc = document.querySelector("#imageLoc")

imageUpload.addEventListener('change', (event) => {
	console.log(imageUpload)
	//console.log(event.target.files[0])
	imageFile = event.target.files[0]
	imageValue = URL.createObjectURL(imageFile)
	//console.log(imageValue)/
	imageLoc.src =""
	imageTag.src = imageValue
	imageTag.addEventListener('load', () => {
		URL.revokeObjectURL(this.src)
	})
})    
    

 const modifyInfoForm = document.querySelector("#modifyInfoForm")
 modifyInfoForm.addEventListener("submit", (event) => {
	//alert("함수 작동")
	const name = document.querySelector("#name")
	const password = document.querySelector("#password")
	const email = document.querySelector("#email")
	const phone = document.querySelector("#phone")
	const addrPost = document.querySelector("#sample6_postcode")
	const addrMain = document.querySelector("#sample6_address")
	const addrDetail1 = document.querySelector("#sample6_extraAddress")
	const addrDetail2 = document.querySelector("#sample6_detailAddress")
	//console.log("imageUpload -> "+ imageUpload.value.trim().length);
	
	if (password != null && password.value.trim().length == 0) {
		event.preventDefault()
		alert("비밀번호 입력 필드를 확인해주세요.")
	} else if (addrMain != null && addrMain.value.trim().length == 0) {
		event.preventDefault()
		alert("주소  입력 필드를 확인해주세요.")
	} else if (name != null && name.value.trim().length == 0) {
		event.preventDefault()
		alert("이름  입력 필드를 확인해주세요.")
	} else if (phone != null && phone.value.trim().length == 0) {
		event.preventDefault()
		alert("전화번호  입력 필드를 확인해주세요.")
	} else if (email != null && email.value.trim().length == 0 ) {
		event.preventDefault()
		alert("이메일  입력 필드를 확인해주세요.")
	} else {
		alert("수정 되었습니다.")
		const modifyInfoForm = document.querySelector("#modifyInfoForm")
		modifyInfoForm.submit();
	}
	
})



function bookingButton (loginCheck) {
	//alert("함수 작동 ")
	if (loginCheck == 1){
		location.href = "booking"
	} else {
		alert ("로그인 해주세요. !!!!")
		location.href = "twoWay"
	}
}

function bookingCheckButton (loginCheck) {
	//alert("함수 작동 ")
	if (loginCheck == 1) {
		location.href = "bookingCheckList"
	} else {
		alert ("로그인 해주세요. !!!!")
		location.href = "login?status=ch"
	}
	
}





    
   
    
    
