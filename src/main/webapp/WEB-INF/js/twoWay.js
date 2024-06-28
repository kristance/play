function anonymousBooking() {
	//alert('함수작동')
	fetch('./anonymousBooking', {
		method:'GET'
	})
	.then ( (result) => {
		return result.status
	})
	.then ( (data) => {
		//console.log(data)
		if (data == 200) {
			location.href = 'booking'
		} else {
			alert('에러가 발생했습니다.')
		}
	})
}