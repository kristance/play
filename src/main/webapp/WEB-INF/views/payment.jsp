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
<script type="text/javascript" src="./js/payment.js" defer="defer"></script>
<script src="https://cdn.jsdelivr.net/npm/crypto-js@4.2.0/index.min.js"></script>
</head>
<body>
	
<form id="paymentForm" action="paymentResult" method="POST"  class="container">
	
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
		<div class=" row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0 " >
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100 pt-3 text-white text-center" style=" background-color: black; height: 70px"> <h3><strong>F</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>

<!-- the Play name displayed here when select play -->
<!-- display : none before select play -->
				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
					 <hr><h4><b>* Payment</b></h4><hr/>
					 <div id="checkOutAlert" class="container px-2 text-break">
					 		
					 </div>
					 <div class="w-100 h-25"></div>
					 <span id="selectPlayName" class="bg-black text-white fw-bold fs-5"></span>
				</div>
				
				
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px">
					<div class="bg-black text-white text-center pt-2 fw-bold" style="width: 100px; height: 50px; display: inline-block;">카드 결제</div>
					&nbsp;
					<div class=" text-center pt-2 fw-bold" 
						style="width: 100px; height: 50px; display: inline-block; cursor: pointer;"
						onclick="checkOutAccount()"
						>계좌 결제</div>
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
					 	<input name="viewTime" type="text" value="${viewTime }">
					 	<input name="viewDate" type="text" value="${viewDate }">
					 	<input name="viewPlace" type="text" value="${viewPlace }">
					 	<input name="seatNumber" type="text" value="${seatNumber }">
					 	<input id="viewer" name="viewer" type="text" value="${viewer }">
					 	<input id="viewerCount" name="viewerCount" type="text" value="${viewerCount }">
					 	<input id="phone" name="phone" type="text" value="${phone }">
					 	<input id="email" name="email" type="text" value="${email }">
					 	<input id="addrMain" name="addrMain" type="text" value="${addrMain }">
					 	<input id="addrDetail1" name="addrDetail1" type="text" value="${addrDetail1 }">
					 	<input id="addrDetail2" name="addrDetail2" type="text" value="${addrDetail2 }">
					 	<input id="playTitle" name="playTitle" type="text" value="${playTitle }">
					 	<input id="playFee" name="playFee" type="text" value="${playFee }">
					 	<input name="loginCheck" type="text" value="${loginCheck }">
					 	<input name="poster" type="text" value="${poster }">
					 	<input name="amount" type="text" value="${amount }">
					 	<input id="chargeKey" name="chargeKey" type="text">
					 	<input id="idxCard" name="idxCard" type="text">
						<input id="submitBtn" type="submit" >
				
				</div>
				
				
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
					<div class="col-5 pt-3 w-50 bg-black text-white text-center " 
						onclick="history.go(-1)"
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>이전</strong></div>
					<label for="submitBtn" class="col-5 pt-3 w-50 bg-black text-white text-center" 
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>다음</strong></label>
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
						# 결제
				</div>
				<div class=" container px-0 mt-2">
					 <div class="w-100" style="height: 10px"></div>
					 <div class="w-100  row mx-0" style="height: 50px">
					 		<div class="col-2 "></div>
					 		<div class="col-2 "></div>
					 		<div class="col-2 "></div>
					 		<div class="col-2 "></div>
					 		<div class="col-2 "></div>
					 		<div class="col-2 "></div>
					 </div>
					 <div class="w-100 row mx-0" style="height: 60px">
					 		<div class="col-1 "></div>
					 		<div class="col-3" style="border-top-left-radius: 60px; border-top : 3px solid black; border-left : 3px solid black"></div>
					 		<div class="col-2" style="border-top: 3px solid black"></div>
					 		<div class="col-2 " style="border-top: 3px solid black"></div>
					 		<div class="col-3 pt-1" style="border-top-right-radius: 60px; border-right: 3px solid black; border-top: 3px solid black">
					 			<select id="kindOfCard" class="form-control form-control-lg w-75 text-center" style="border: 2px solid black" required="required">
					 				<option class="fw-bold" value="카드 선택">= 카드 선택 =  </option>
					 				<option value="삼성">삼성 카드</option>
					 				<option value="현대">현대 카드</option>
					 				<option value="우리">우리 카드</option>
					 				<option value="국민">국민 카드</option>
					 				<option value="신한">신한 카드</option>
					 			</select>
					 		</div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100 row mx-0" style="height: 55px">
					 		<div class="col-1 "></div>
					 		<div class="col-3 bg-black" style="border-left: 3px solid black"></div>
					 		<div class="col-2 bg-black "></div>
					 		<div class="col-2 bg-black "></div>
					 		<div class="col-3 bg-black " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row mx-0" style="height: 50px">
					 		<div class="col-1 "></div>
					 		<div class="col-3  " style="border-left: 3px solid black"></div>
					 		<div class="col-2 "></div>
					 		<div class="col-2  "></div>
					 		<div class="col-3  " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row mx-0" style="height: 30px">
					 		<div class="col-1 "></div>
					 		<div class="col-3  " style="border-left: 3px solid black"></div>
					 		<div class="col-2  "></div>
					 		<div class="col-2 "></div>
					 		<div class="col-3  " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100 row mx-0" style="height: 50px">
					 		<div class="col"></div>
					 		<div class="col " style="border-left: 3px solid black;"></div>
					 		<div class="col-2">
					 			<input id="cardNo1" class="form-control form-control-lg text-center"
													type="text" style="border: 2px solid black" placeholder="****" maxlength="4" pattern="^[0-9]{4}$" title="4자리 숫자로 입력해주세요" required="required">
					 		</div>
					 		<div class="col-2 ">
					 			<input id="cardNo2" class="form-control form-control-lg text-center" 
					 								type="text" style="border: 2px solid black" placeholder="****" maxlength="4" pattern="^[0-9]{4}$" title="4자리 숫자로 입력해주세요" required="required">
					 		</div>
					 		<div class="col-2 ">
					 			<input id="cardNo3" class="form-control form-control-lg text-center" 
					 								type="text" style="border: 2px solid black" placeholder="****" maxlength="4" pattern="^[0-9]{4}$" title="4자리 숫자로 입력해주세요" required="required">
					 		</div>
					 		<div class="col-2">
					 			<input id="cardNo4"class="form-control form-control-lg text-center" 
					 								type="text" style="border: 2px solid black" placeholder="****" maxlength="4" pattern="^[0-9]{4}$" title="4자리 숫자로 입력해주세요" required="required">
					 		</div>
					 		<div class="col" style="border-right: 3px solid black; padding-right: 7px"></div>
					 		<div class="col "></div>
					 </div>
					 <div class="w-100  row mx-0 " style="height: 30px">
					 		<div class="col-1 "></div>
					 		<div class="col-3  " style="border-left: 3px solid black"></div>
					 		<div class="col-2  "></div>
					 		<div class="col-2  "></div>
					 		<div class="col-3  " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row mx-0" style="height: 50px">
					 		<div class="col-1 "></div>
					 		<div class="col-2  " style="border-left: 3px solid black"></div>
					 		<div class="col-2  "></div>
					 		<div class="col-2  "></div>
					 		<div class="col-1 "></div>
					 		<div class="col-2"><input id="owner" name="owner" class="form-control form-control-lg text-center" type="text" style="border: 2px solid black" placeholder="소유자" required="required"></div>
					 		<div class="col-1" style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row mx-0" style="height: 30px">
					 		<div class="col-1 "></div>
					 		<div class="col-3  " style="border-left: 3px solid black"></div>
					 		<div class="col-2  "></div>
					 		<div class="col-2  "></div>
					 		<div class="col-3  " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row mx-0" style="height: 50px">
					 		<div class="col-1 "></div>
					 		<div class="col-3  " style="border-left: 3px solid black"></div>
					 		<div class="col px-0">
					 			<input id="exp1" class="form-control form-control-lg text-center" type="text" style="border: 2px solid black" placeholder="월"  title="ex)1월 -> '01' 입력 " pattern="^[1-12]{2}$" maxlength="2" required="required">
					 		</div>
					 		<div class="col fw-bold fs-3 text-center">/</div>
					 		<div class="col px-0">
					 			<input id="exp2" class="form-control form-control-lg text-center" type="text" style="border: 2px solid black" placeholder="일" pattern="^[1-31]{2}$" maxlength="2" required="required">
					 		</div>
					 		<div class="col-3  " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row  mx-0" style="height: 50px">
					 		<div class="col-1 "></div>
					 		<div class="col-3 " style="border-left: 3px solid black"></div>
					 		<div class="col-2 "></div>
					 		<div class="col-2 "></div>
					 		<div class="col-3 " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row  mx-0" style="height: 2px">
					 		<div class="col-1 "></div>
					 		<div class="col-3 bg-secondary" style="border-left: 3px solid black"></div>
					 		<div class="col-2 bg-secondary "></div>
					 		<div class="col-2 bg-secondary "></div>
					 		<div class="col-3 bg-secondary " style="border-right: 3px solid black"></div>
					 		<div class="col-1 "></div>
					 </div>
					 <div class="w-100  row mx-0" style="height: 50px">
					 		<div class="col-1 "></div>
					 		<div class="col-3 " style="border-bottom-left-radius: 60px; border-left: 3px solid black; border-bottom: 3px solid black"></div>
					 		<div class="col-2 " style="border-bottom: 3px solid black"></div>
					 		<div class="col-2 " style="border-bottom: 3px solid black"></div>
					 		<div class="col-3 " style="border-bottom-right-radius : 60px; border-right: 3px solid black; border-bottom: 3px solid black"></div>
					 		<div class="col-1 "></div>
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
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>



</body>
</html>