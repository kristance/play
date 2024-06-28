<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking -> ###</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
<script type="text/javascript" src="./js/paymentResult.js" defer="defer"></script>
<script src="https://cdn.jsdelivr.net/npm/crypto-js@4.2.0/index.min.js"></script>
</head>
<body>
	
<form id="processingForm" action="booking6" method="POST"  class="container">
	
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
	
	<div class="container px-0">
		<div class=" row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0 " >
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100 pt-3 text-white text-center" style=" background-color: black; height: 70px"> <h3><strong>F</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>

				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
					 <hr><h4><b>* Payment</b></h4><hr/>
					 <div id="checkOutAlert" class="container px-2 text-break">
					 		
					 </div>
					 <div class="w-100 h-25"></div>
					 <span id="selectPlayName" class="bg-black text-white fw-bold fs-5"></span>
				</div>
				
				
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px">
				</div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"></div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"></div>
				<div class="w-100" style="height: 10px"></div>
				<hr>
				
				<div style="display: none;">
					 	<input id="idxP" name="idxP" type="text" value="${idxP }">
					 	<input name="id" type="text" value="${loginId }">
					 	<input name="viewTime" type="text" value="${ticketVO.viewTime }">
					 	<input name="viewDate" type="text" value="${ticketVO.viewDate }">
					 	<input name="viewPlace" type="text" value="${ticketVO.viewPlace }">
					 	<input name="seatNumber" type="text" value="${ticketVO.seatNumber }">
					 	<input id="viewer" name="viewer" type="text" value="${ticketVO.viewer }">
					 	<input id="viewerCount" name="viewerCount" type="text" value="${ticketVO.viewerCount }">
					 	<input id="phone" name="phone" type="text" value="${ticketVO.phone }">
					 	<input id="email" name="email" type="text" value="${ticketVO.email }">
					 	<input id="addrMain" name="addrMain" type="text" value="${ticketVO.addrMain }">
					 	<input id="addrDetail1" name="addrDetail1" type="text" value="${ticketVO.addrDetail1 }">
					 	<input id="addrDetail2" name="addrDetail2" type="text" value="${ticketVO.addrDetail2 }">
					 	<input id="playTitle" name="playTitle" type="text" value="${playTitle }">
					 	<input id="playFee" name="playFee" type="text" value="${playFee }">
					 	<input name="loginCheck" type="text" value="${loginCheck }">
					 	<input name="poster" type="text" value="${poster }">
					 	<input name="amount" type="text" value="${ticketVO.amount }">
					 	<input id="chargeKey" name="chargeKey" type="text" value="${ticketVO.chargeKey }">
					 	<input id="idxCard" name="idxCard" type="text" value="${idxCard }">
					 	<input id="owner" name="owner" type="text" value="${owner }">
						<input id="submitBtn" type="submit" >
				
				</div>
				
				
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
					<div class="col-5 pt-3 w-100 bg-black text-white text-center " 
						onclick="location.href='gate'"
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong> * 돌아가기  </strong></div>
				</div>
				
			</div>
		 
<!-- right -->
			<div class="col-10 px-1 container " >

				<div class="row w-100 mx-0" style=" height: 2px">
					<div class="col">
					</div>
				</div>		
					
				<div class="row w-100 mx-0 mb-1 mt-0" style=" height: 36px; ">
					<div class="col-2 pt-2">
					</div>
					<div class="col-10 pt-2">
					</div>
					
				</div>
				
				<div class="row text-white bg-black px-3 w-100 mx-0 mb-1 mt-0 fs-1" style=" height: 60px;">
						<div class="col-12">
							# 결제중
						</div>
				</div>
				<div class=" container px-0 mt-2">
					 <div class="w-100" style="height: 10px"></div>
					 <div class="w-100  row mx-0" style="height: 50px">
					 	<div class="progress" style="height: 30px">
						  <div id="progreBar" class="progress-bar progress-bar-striped bg-black" role="progressbar" 
						  		style="width: 10%"
						  		aria-valuenow="10"
						  		aria-valuemin="0"
						  		aria-valuemax="100"></div>
						</div>
					 </div>
					 <div class="w-100 row mx-0" style="height: 60px">
					 </div>
					 <div class="w-100 row mx-0" style="height: 55px">
					 </div>
					 <div class="w-100  row mx-0" style="height: 50px">
					 </div>
					 <div class="w-100  row mx-0" style="height: 30px">
					 </div>
					 <div class="w-100 row mx-0" style="height: 50px">
					 </div>
				</div>

			</div>
			
		</div>
	</div>
</form>

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px;">
	    <a class="navbar-brand text-white"  href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  	<a class="text-white"  href="javascript:bookingButton(${loginCheck })" style="text-decoration: none;" >예약하기 </a>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck})" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>



</body>
</html>