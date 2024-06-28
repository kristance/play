<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking6_complete -> ###</title>
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
<script type="text/javascript" src="./js/qrcode.js" defer="defer"></script>
<script src="./js/booking6.js" defer="defer"></script>
</head>
<body >
	
<form class="container" action="#">
	
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
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="javascript:clickButton(1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-house-door" ></i></a> &nbsp;Reservation</h3>
		</div>
	</div>
	
<!-- left -->	
	<div class="container px-0">
		<div class="row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0" >
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100 text-white text-center pt-3" style=" background-color: black; height: 70px"> <h3><strong>F</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>
				
<!-- the Play name displayed here when select play -->
<!-- display : none before select play -->
				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
						 <hr><h4><b>* Complete Booking</b></h4><hr/>
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
				<div style="display: none">
					<input id="playTitle" type="text" value="${playTitle }">
					<input id="bookNumber" type="text" value="${playTicketVO.bookNumber }">
					<input id="viewer" type="text" value="${playTicketVO.viewer }">
					<input id="viewerCount" type="text" value="${playTicketVO.viewerCount }">
					<input id="viewPlace" type="text" value="${playTicketVO.viewPlace }">
					<input id="viewDate" type="text" value="${playTicketVO.viewDate }">
					<input id="viewTime" type="text" value="${playTicketVO.viewTime }">
					<input id="phone" type="text" value="${playTicketVO.phone }">
					<input id="loginCheck" type="text" value="${loginCheck }">
				</div>
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
						<div class="col-12 w-100 pt-3 w-50 bg-black text-white text-center " 
							onclick="javascript:clickButton(1)"
							style="height: 50px; cursor: pointer; border-radius: 7px"><strong>* 돌아가기 </strong></div>
				</div>
				
				
			</div>
			
<!-- right -->
			<div class="col-10 px-0" >

				<div class="row w-100 mx-0" style="height: 20px">
				
					<div class="col">
					</div>
				</div>		
				
				<div class="row w-100 mx-0 mb-1 mt-0" style=" height: 40px;">
					
					<div class="col pt-2" >
					</div>
					
				</div>
				
				
<!-- #Complete book play -->							
				<div class="row w-100 mx-0" style=" height: 70px">
					<div class="col-3"  >
					</div>
					<div class="col-5 bg-black text-white text-center rounded-pill pt-2"  >
						<h1><strong># 예약 완료  </strong> </h1>
					</div>
					<div class="col-1" >
					</div>
					<div class="col-3" >
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 60px">
					<div class="col-3" >
					</div>
					<div class="col-6" >
					</div>
					<div class="col-3" >
					</div>
				</div>
				
<!-- 예약 공연 제목 -->							
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 공연제목 </strong> </h4>
					</div>
					<div class="col-6 pt-2 fs-3" >
						<!-- 공연 제목  -->
						<strong>${playInfo.playTitle }</strong> 
					</div>
					<div class="col-3 container mt-0 pt-0 me-5 w-25"  style=" height: 230px">
						<span class="fs-5 fw-bold d-inline-block">&emsp; # 예매확인 QR코드 </span>
						<div id="qrCodeLoc" class="ms-2 mt-2 w-100" style="height: 200px;"></div>
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>
				
<!-- Reservation No. -->				
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="height:50px; border-radius: 7px">
						<h4><strong># 예매 번호 </strong> </h4>
					</div>
					<div class="col-6 pt-2 fs-3" >
						<!-- 예매번호  -->
						<strong>${playTicketVO.bookNumber }</strong>
					</div>
					<div class="col-3" >
					</div>
				</div>
		
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>
				
				
<!-- viewer Name -->							
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 관람인 </strong> </h4>
					</div>
					<div class="col-6 pt-2 fs-3" >
						<!-- 관람자 이름  -->
						<strong>${playTicketVO.viewer }</strong>
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>

<!-- bought ticket count -->
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 관람인 수</strong> </h4>
					
					</div>
					<div class="col-6"  >
						<div class="row">
							<div class="col-5 pt-2 px-3">
								<!-- 관람인수  -->
								<span class="fs-3"><b>${playTicketVO.viewerCount }</b></span>
								<div class="fs-3" style="display: inline;"><strong>&nbsp;명</strong></div>
							</div>
							<div class="col-7">
							</div>
						</div>
						
						
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>

<!-- bought ticket total price-->
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 결제금액</strong> </h4>
					
					</div>
					<div class="col-6"  >
						<div class="row">
							<div class="col-5 pt-2 px-3">
								<!-- 결제금액  -->
								<span class="fs-3"><b>${playTicketVO.amount }</b></span>
								<div class="fs-3" style="display: inline;"><strong>&nbsp;원</strong></div>
							</div>
							<div class="col-7">
							</div>
						</div>
						
						
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>
				
<!-- Order phone No -->
				<div class="row w-100 mx-0 container" style=" height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px" >
						<h4><strong># 전화번호</strong> </h4>
					
					</div>
					<div class="col-6 pt-2"  >
						<!-- 연락처  -->
						<h4><strong>${playTicketVO.phone}</strong></h4>
					</div>
					<div class="col-3" >
					</div>
				</div>
							
				<div class="row mx-0 bg-white" style=" height: 25px">
				</div>

<!-- email -->
				<div class="row w-100 mx-0 container" style="height: 50px">
					<div class="col-3 pt-3 bg-black text-white text-start" style="border-radius: 7px">
						<h4><strong># 이메일 </strong></h4>
					
					</div>
					<div class="col-6 pt-2" >
						<!-- 이메일 주소 -->
						<h4><strong>${playTicketVO.email }</strong></h4>
					</div>
					<div class="col-3" >
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>

							
			</div>
			
		</div>
		
		
		
	</div>
</form>
	

<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0 fixed-bottom">
	  <div class="container-fluid bg-black" style="height: 70px; ">
	    <a class="navbar-brand text-white" onclick="javascript:clickButton(1)">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	    <div class="text-secondary" >예약하기 </div>
	    <a class="text-white"  href="javascript:clickButton(3)" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="javascript:clickButton(4)" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="javascript:clickButton(5)" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>


</div>



</body>
</html>