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
    
    
function idCheck() {
	//alert('함수 작동??')
	const idCheckField = document.querySelector('#idCheckField')
	const idCheckValue = document.querySelector("#idCheckValue")
	const preventDoubleId = document.querySelector("#preventDoubleId")
 	//alert(idCheckField)
 	idCheckValue.value += 1
	const formData = new FormData();
	formData.append('id', idCheckField.value);
	const payload = new URLSearchParams(formData);
	if (idCheckField != null && idCheckField.value.trim().length != 0) {
		fetch ('./idCheck', {
			method : 'POST',
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded' 
			},
			body : payload
		})
		.then( (result) => {
			return result.text()
		})
		.then( (text) => {
			//console.log(text)
			if (text == 0) {
				alert('회원가입 가능한 아이디입니다.')
				preventDoubleId.value=""
				preventDoubleId.value="1"
			} else {
				alert('중복된 아이디입니다.')
				preventDoubleId.value=""
				preventDoubleId.value="2"
			}
		})
	} else {
		alert('회원가입 할  아이디를 입력해주세요!!!')
	}
	
}   



const submitBtn = document.querySelector('#submitBtn')
submitBtn.addEventListener('click', (event) => {
	
	const id = document.getElementById("idCheckField")
	const password = document.querySelector('#password')
	const repassword = document.querySelector('#repassword')
	const idCheckValue = document.querySelector("#idCheckValue")
	const name = document.getElementById("name")
	const addrPost = document.getElementById("sample6_postcode")
	const addrMain = document.getElementById("sample6_address")
	const addrDetail1 = document.getElementById("sample6_extraAddress")
	const addrDetail2 = document.getElementById("sample6_detailAddress")
	const email = document.getElementById("email")
	const phone = document.getElementById("phone")
	const preventDoubleId = document.querySelector("#preventDoubleId")
	const currentPage = document.querySelector("#currentPage").value;
	const idxC = document.querySelector("#idxC").value;
	const status = document.getElementById("status").value;
	
	
	if (id.value.trim().length == 0) {
		event.preventDefault()
		alert("아이디를 입력해주세요.")
	} else if (idCheckValue.value == 0) {
		event.preventDefault()
		alert('아이디 중복체크를 해주세요.')
	} else if (name.value.trim().length == 0) {
		event.preventDefault()
		alert('이름을 입력해주세요.')
	} else if (password.value.trim().length == 0) {
		event.preventDefault()
		alert('비밀번호를 입력해주세요.')
	} else if (password.value != repassword.value) {
		event.preventDefault()
		alert('비밀번호 입력 필드를 확인해주세요.')
	} else if (addrMain.value.trim().length == 0) {
		event.preventDefault()
		alert('주소를 입력해주세요!!!')
	} else if (phone.value.trim().length == 0) {
		event.preventDefault()
		alert('전화번호를 입력해주세요!!!')
	} else if (preventDoubleId.value == 2) {
		event.preventDefault()
		alert("중복된 아이디입니다. 다른 아이디로 해주세요!!!")
	} else{
		event.preventDefault()
	
	console.log("id -> " + id.value)
	
	const formData = new FormData();
	formData.append("id", id.value);
	formData.append("name", name.value);
	formData.append("password", password.value);
	formData.append("addrPost", addrPost.value);
	formData.append("addrMain", addrMain.value);
	formData.append("addrDetail1", addrDetail1.value);
	formData.append("addrDetail2", addrDetail2.value);
	formData.append("email", email.value);
	formData.append("phone", phone.value);
	
	const payload = new URLSearchParams(formData);
	
	fetch ("./mSignUp", {
		method : "POST",
		headers : {
			"Content-Type" : "application/x-www-form-urlencoded"
		},
		body : payload 
	})
	.then( (result) => {
		return result.text()
	} )
	.then( (text) => {
		//console.log(text)
		if (text == 1) {
			alert("회원가입에 성공하였습니다. 로그인 해주세요.")
			if (status == "w") {
				location.href = `loginNotB?status=${status}&currentPage=${currentPage}`
			} else if(status == "ww") {
				location.href = `loginNotB?status=${status}&currentPage=${currentPage}&idxC=${idxC}`
			} else if (status == "n") {
				location.href = `loginNotB?status=${status}`
			} else {
				console.log(status)
 				location.href = "gateRedirect"
			}
		} else {
			event.preventDefault()
			alert("오류가 발생하여 회원가입에 실패하였습니다.")
		}
	})
	}
	
})



const repassword = document.querySelector("#repassword")
repassword.addEventListener("keyup", (event) => {
	//alert("함수작동")
	const repass = document.querySelector("#repass")
	const password  = document.querySelector("#password")
	if (password.value.trim().length != 0) {
		if (password.value === event.target.value ) {
			repass.innerHTML = "<i class=\"bi bi-check2 fs-3\"></i>"
		} else {
			repass.innerHTML = " "
		}
	} else {
		
	}
})


 
    
    
    
