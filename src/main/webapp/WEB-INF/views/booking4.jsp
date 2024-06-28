<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking4 -> ###</title>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer="defer"></script>
<script  src="./js/booking4.js" defer="defer"></script>

<style>
	#addressBtn:hover {
		background-color: black;
		color: white;
		transition:0.5s;
	
	}
</style>

</head>
<body >
	
<form id="orderInfoForm" method="POST" class="container" action="booking5">
	
	<div class="w-100">
		<div class="w-100" style=" height: 14px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	

	<div class="w-100">
		<div class="w-100 pt-3 text-white fixed-top" style=" height: 64px; border: 3px solid black; background-color: black;  " >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;Reservation</h3>
		</div>
	</div>
	
<!-- left -->	
		<div class="row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0" >
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100  text-white text-center pt-3" style=" background-color: black; height: 70px"> <h3><strong>D</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>
				
<!-- the Play name displayed here when select play -->
<!-- display : none before select play -->
				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
					 <hr><h4><b>* Insert Your Info</b></h4><hr/>
					 <div class="container px-2 text-break">
					 </div>
				</div>
				
				<div style="display: none;">
					 	<input name="idxP" type="text" value="${idxP }">
					 	<input name="viewTime" type="text" value="${viewTime }">
					 	<input name="viewDate" type="text" value="${viewDate }">
					 	<input name="viewPlace" type="text" value="${viewPlace }">
					 	<input name="seatNumber" type="text" value="${seatNumber }">
					 	<input id="id" name="id" type="text" value="${loginId }" >
					 	<input id="playFee" name="playFee" type="text" value="${playFee }">
					 	<input id="addrMain" name="addrMain" type="text">
					 	<input id="addrDetail1" name="addrDetail1" type="text">
					 	<input id="addrDetail2" name="addrDetail2" type="text">
				</div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"></div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"> </div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"> </div>
				<div class="w-100" style="height: 10px"></div>
				<hr/>
				
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
					<div class="col-5 pt-3 w-50 bg-black text-white text-center " 
						onclick="history.go(-1)"
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>이전</strong></div>
					<label for="submitBtn" class="col-5 pt-3 w-50 bg-black text-white text-center" 
						onclick="bookingNextButton()" 
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>다음</strong></label>
				</div>
				<input type="submit" id="submitBtn" style="display: none">
			</div>
			
<!-- right -->
			<div class="col-10 px-0 mx-0" >

				<div class="row w-100 mx-0" style=" height: 2px">
					<div class="col">
					</div>
				</div>		
				
				<div class="row text-white w-100 mx-0 mb-1 mt-0" style=" height: 45px; ">
					
					<div class="col pt-2" >
					</div>
					
					
				</div>
							
				<div class="row w-100 mx-0" style=" height: 10px">
					<div class="col-3" >
					</div>
					<div class="col-6" >
					</div>
					<div class="col-3" >
					</div>
				</div>
				
<!-- #Complete book play -->							
				<div class="row w-100 text-center pt-4 mx-0" style=" height: 100px">
						<h1><strong># 주문자 정보 입력 </strong> </h1>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 10px">
					<div class="col-3"  >
					</div>
					<div class="col-6"  >
					</div>
					<div class="col-3"  >
					</div>
				</div>
				
				
				
				
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>
<!-- Viewer Person -->				
				<div class="row w-100 mx-0 container" style="border: height: 50px">
					
					<div class="col-1">
					</div>
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 관람인</strong> </h4>
					</div>
					<div class="col-6"">
						<input name="viewer" class="form-control form-control-lg" type="text" style="border: 3px solid black" required="required">
					</div>
					
					<div class="col-2">
					</div>
				</div>
				
				
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>
				
<!-- Viewer Count -->							
				<div class=" row w-100 mx-0 container" style="height: 50px">
					<div class="col-1">
					</div>
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 관람인 수</strong> </h4>
					</div>
					
					<div class="col-6">
						<input name="viewerCount"
								id="viewerCount" 
								class="form-control form-control-lg w-25" 
								type="text" style="border: 3px solid black; display: inline" pattern="^[0-9]{1,2}$" required="required">
						<span class="fs-3"><strong>&nbsp;명</strong></span>
						&emsp;<span class="fs-3">X</span>&emsp;<span class="fs-3"><strong>&nbsp;${playFee }원</strong></span>
						
					</div>
					<div class="col-2">
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>
				
<!-- Phone No -->							
				<div class=" row w-100 mx-0 container" style="height: 50px">
					<div class="col-1">
					</div>
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 전화번호</strong> </h4>
					</div>
					<div class="col-6">
						<input class="form-control form-control-lg" 
								name="phone"
								type="tel"
								style="border: 3px solid black"
								maxlength="13"
								title="ex) 010-0000-0000 형식으로 입력해주세요" 
								placeholder="010-0000-0000"
								style="border: 3px solid black"
								required="required">
					</div>
					<div class="col-2">
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 25px;">
				</div>
			
<!-- E-mail -->				
				<div class=" row w-100 mx-0 container" style="height: 50px">
					<div class="col-1">
					</div>
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 이메일</strong> </h4>
					</div>
					<div class="col-6">
						<input name="email" class="form-control form-control-lg" type="email" placeholder="example@example.co.kr" style="border: 3px solid black" required="required">
					</div>
					<div class="col-2">
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 25px;">
				</div>

<!-- Address -->							
				<div class="row w-100 mx-0 container" style=" height: 50px; ">
					<div class="col-1">
					</div>
					<div class="col-3  bg-black text-white pt-3 text-start" style=" border-radius: 7px" >
						<h4><strong># 주소 </strong> </h4>
					</div>
					<div class="col-6"  >
				
						<div class="pt-3 px-0" >
							<input class="form-control w-50 mb-1" type="text" id="sample6_postcode" placeholder="우편번호" style="border: 3px solid black; display: inline;" readonly="readonly" > 
							<input id="addressBtn" class="form-control w-25 mb-1" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="border: 3px solid black; display: inline; font-weight: bold;"> <br>
							<input class="form-control mb-1" type="text" id="sample6_address" placeholder="주소" style="border: 3px solid black; display: inline;"  readonly="readonly" required="required"> <br>
							<input class="form-control mb-1" type="text" id="sample6_extraAddress" placeholder="상세주소1" style="border: 3px solid black" readonly="readonly">
							<input class="form-control mb-1" type="text" id="sample6_detailAddress" placeholder="상세주소2" style="border: 3px solid black; display: inline;" > 
							 
							
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
					</div>
					
					<div class="col-2"  >
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 25px">
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

</form>	




</body>
</html>