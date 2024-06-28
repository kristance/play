<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking5 -> ###</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="./js/booking5.js" defer="defer"></script>
</head>
<body >
	
<div class="container">
	
	<div class="w-100">
		<div class="w-100" style=" height: 14px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	

	<div class="w-100">
		<div class="w-100 pt-3 text-white fixed-top" style=" height: 64px; border: 3px solid black; background-color: black; " >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;Reservation</h3>
		</div>
	</div>
	
<!-- left -->	
	<div class="container px-0">
		<div class="row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0" >
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100 text-white text-center pt-3" style=" background-color: black; height: 70px"> <h3><strong>E</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>
				
<!-- the Play name displayed here when select play -->
<!-- display : none before select play -->
				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
					 <hr><h4><b>* Check Order Info </b></h4><hr/>
					 <div class="container px-2 text-break">
					 </div>
				</div>
				
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"></div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"> </div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-4" style=" height: 70px"></div>
				<div class="w-100" style="height: 10px"></div>
				
				<hr>
				
			
				<form id="booking5Form" action="payment" method="POST" style="display: none;">
					 	<input name="idxP" type="text" value="${idxP }">
					 	<input name="id" type="text" value="${loginId }">
					 	<input name="viewTime" type="text" value="${viewTime }">
					 	<input name="viewDate" type="text" value="${viewDate }">
					 	<input name="viewPlace" type="text" value="${viewPlace }">
					 	<input name="viewer" type="text" value="${viewer }">
					 	<input name="seatNumber" type="text" value="${seatNumber }">
					 	<input name="viewerCount" type="text" value="${viewerCount }">
					 	<input name="phone" type="text" value="${phone }">
					 	<input name="email" type="text" value="${email }">
					 	<input id="addrMain" name="addrMain" type="text" value="${addrMain }">
					 	<input id="addrDetail1" name="addrDetail1" type="text" value="${addrDetail1 }">
					 	<input id="addrDetail2" name="addrDetail2" type="text" value="${addrDetail2 }">
				</form>
				
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
					<div class="col-5 pt-3 w-50 bg-black text-white text-center " 
						onclick="history.go(-1)"
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>이전</strong></div>
					<div class="col-5 pt-3 w-50 bg-black text-white text-center" 
						onclick="booking5NextButton()" 
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>결제하기 </strong></div>
				</div>
				
				
			</div>
			
<!-- right -->
			<div class="col-10 px-0" >

				<div class="row w-100 mx-0" style="height: 20px">
				
					<div class="col">
					</div>
				</div>		
				
				<div class="row w-100 mx-0 mb-1 mt-0" style=" height: 30px;">
					
					<div class="col pt-2" >
					</div>
					
					
				</div>
							
				<div class="row w-100 mx-0" style=" height: 10px">
				</div>
				
				
<!-- #Complete book play -->							
				<div class="row w-100 mx-0" style=" height: 50px">
					<div class="col-3"  >
					</div>
					<div class="col-6 text-center pt-0 fs-1 fw-bold" >
						# 예약 정보 확인
					</div>
					<div class="col-3" >
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 45px">
				</div>

<!-- booking title -->				
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-2 bg-black text-white text-start fw-bold fs-4" style="height:50px; border-radius: 7px">
						# 예약 공연 제목
					</div>
					<div class="col-6 fs-4 pt-2 text-truncate" >
						${playInfo.playTitle }
					</div>
					<div class="col-3 container ps-0 pt-3" style="height: 320px">
						<div  style="height: 280px; border: 10px ridge black ;">
							<img class="w-100 h-100" src="${playInfo.playPoster }" style="object-fit:contain"> 
						</div>
					</div>
				</div>
		
				<div class="row w-100 mx-0" style=" height: 20px">
				</div>
				
<!-- viewer Name -->							
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 관람인 </strong> </h4>
					</div>
					<div class="col-6 fs-4 pt-2" >
						${viewer}
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 20px">
				</div>
				
<!-- bought ticket count -->
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 관람인 수 </strong> </h4>
					</div>
					<div class="col-6 pt-2" >
						<span class="fs-3">${viewerCount }&nbsp;명</span>
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 20px">
				</div>
				
<!-- bought ticket count -->
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 결제 금액</strong> </h4>
					</div>
					<div class="col-6 pt-2" >
						<span class="fs-3">${playInfo.playFee * viewerCount }&nbsp;원</span>
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 20px">
				</div>

<!-- Order phone No -->
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 전화번호 </strong> </h4>
					</div>
					<div class="col-6 pt-2 fs-4"  >
						${phone }
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 20px">
				</div>
				
<!-- email -->
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 이메일 </strong></h4>
					</div>
					<div class="col-6 pt-2 fs-4"  >
						${email }
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row mx-0 bg-white" style=" height: 20px">
				</div>

<!-- Address -->
				<div class="row w-100 mx-0 container" style="height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 주소 </strong> </h4>
					</div>
					<div class="col-9" >
							<input class="form-control mb-1 fs-4" type="text" id="sample6_address" 
								placeholder="주소" 
								style="border: 3px solid white; 
								display: inline;"
								value="${addrMain }"  
								readonly="readonly" > <br>
							<input class="form-control mb-1 fs-4" 
									type="text"
									 id="sample6_extraAddress"
									  value="${addrDetail1 }"
									   style="border: 3px solid white;" 
									   readonly="readonly" >
							<input class="form-control mb-1 fs-4" 
									type="text" 
									id="sample6_detailAddress"
									 style="border: 3px solid white; 
									 display: inline;"
									 value="${addrDetail2 }" > 
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 20px">
				</div>

				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
					
					</div>
				</div>
							
							
			</div>
			
		</div>
		
		
		
	</div>
	

<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0 fixed-bottom">
	  <div class="container-fluid bg-black" style="height: 70px; ">
	    <a class="navbar-brand text-white" href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	    <div class="text-secondary" >예약하기 </div>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck })" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>


</div>



</body>
</html>