<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up -> ###</title>
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
<script type="text/javascript" src="./js/signUp.js" defer="defer"></script>
<style>
	#addressBtn:hover {
		background-color: black;
		color: white;
		transition:0.5s;
	}
	
	#idCheckBtn:hover {
		background-color: black;
		color: white;
		transition:0.5s;
	}
</style>
</head>
<body >
	
<div class="container">
	
	<div class="w-100">
		<div class="w-100" style=" height: 30px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style=" height: 30px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 55px">
	</div>
	

	<div class="w-100">
		<div class="w-100 pt-2 text-white bg-black fixed-top" style=" height: 60px; border: 3px solid black;" >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;Sign Up</h3>
		</div>
	</div>	

<!-- 히든 Value -->
<div style="display: none">
<input id="status" type="text" value="${status }">
<input id="currentPage" type="text" value="${currentPage }">
<input id="idxC" type="text" value="${idxC }">
</div>
<!-- login form -->
	<form id="memberSignUp" method="POST" class=" w-100 ms-5 pt-0"  style="border: 1px solid white">
		<div class="w-100 container px-0" style=" height: 764px;">
					

<!-- id -->				
			<div class="w-100 row mx-0 container" style=" height: 50px">
				<div class="col-4 text-start pt-2 px-5 overflow-hidden" style="border-radius: 7px">
					<h3><strong># ID</strong></h3>
				</div>
				<div class="col-8 mx-0 ps-4" >
					<input class="form-control form-control-lg w-50"
							id="idCheckField"
							name="id"
							type="text"
							style="border: 3px solid black; display: inline;"
							required="required"
							pattern="^[A-Za-z0-9]*$"
							title="영문과 숫자 조합으로 입력하세요."
							>
					<div id="idCheckBtn"
						 class="form-control form-control-lg overflow-hidden"
						 onclick="javascript:idCheck()" 
						 style="border: 3px solid black; width:40px; height: 40px; cursor:pointer; display: inline;" >
						<strong>아이디 중복검사</strong>
					</div>
					<input id="idCheckValue" type="hidden" value="0" >
					<input id="preventDoubleId" type="hidden">
				</div>
			</div>
			
			<div class="row w-100" style="height: 20px">
			</div>
			
<!-- name -->				
			<div class="w-100 row mx-0 container" style=" height: 50px">
				<div class="col-4 text-start pt-2 px-5 overflow-hidden" style="border-radius: 7px">
					<h3><strong># Name</strong></h3>
				</div>
				<div class="col-8 mx-0 ps-4" >
					<input class="form-control form-control-lg w-50"
							id="name"
							name="name"
							type="text"
							style="border: 3px solid black; display: inline;"
							required="required"
							title="이름을 입력해주세요."
							>
				</div>
			</div>
			
			<div class="row w-100" style="height: 20px">
			</div>

<!-- password -->
			<div class="w-100 row mx-0 container" style=" height: 50px">
				<div class="col-4 text-start pt-2 px-5 overflow-hidden" >
					<h3><strong># Password</strong></h3>
				</div>
				<div class="col-8 px-4" >
					<input class="form-control form-control-lg w-50"
							name="password"
							id="password" 
							type="password"
							style="border: 3px solid black;"
							required="required">
				</div>
			</div>
			
			<div class="row w-100" style="height: 20px">
			</div>

<!-- re-password -->
			<div class="w-100 row mx-0 container" style="  height: 50px">
				<div class="col-4 text-start pt-3 px-5 text-wrap overflow-hidden" >
					<h3><strong># Repassword</strong></h3>
				</div>
				<div class="col-8 px-4 pt-2" >
					<input class="form-control form-control-lg w-50"
							id="repassword"
							type="password"
							required="required"
							style="border: 3px solid black; display: inline">
					&emsp;
					<div id="repass" style="display: inline;"></div>
				</div>
			</div>
			
			<div class="row w-100" style="height: 20px">
			</div>
			
<!-- address -->
			<div class="w-100 row mx-0 container" style=" height: 178px">
				
				<div class="col-4 text-start px-5 pt-3 overflow-hidden" >
					<h3><strong># Address</strong></h3>
				</div>
				
				<div class="col-8 px-4 pt-2" >
					<input class="form-control  w-50 mb-2 " name="addrPost" type="text" id="sample6_postcode" placeholder="우편번호" style="border: 3px solid black; display: inline;" readonly="readonly" > 
					<input id="addressBtn" class="form-control  w-25 mb-2" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="border: 3px solid black; display: inline; font-weight: bold;"> <br>
					<input class="form-control  w-50 mb-2 " name="addrMain" type="text" id="sample6_address" placeholder="주소" style="border: 3px solid black; display: inline;" required="required"  readonly="readonly" > <br>
					<input class="form-control  w-50 mb-2" name="addrDetail1" type="text" id="sample6_extraAddress" placeholder="상세주소1" style="border: 3px solid black" readonly="readonly">
					<input class="form-control  w-50 mb-2" name="addrDetail2" type="text" id="sample6_detailAddress" placeholder="상세주소2" style="border: 3px solid black; display: inline;" > 
					 
					
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					
				</div>
			</div>
			
			<div class="row w-100" style="height: 20px">
			</div>
			
<!-- email -->
			<div class="w-100 row mx-0 mt-2 container" style=" height: 50px">
				<div class="col-4 text-start pt-3 px-5 overflow-hidden" >
					<h3><strong># Email</strong></h3>
				</div>
				<div class="col-8 px-4 pt-2" >
					<input class="form-control form-control-lg w-50"
							id="email"
							name="email"
							type="email"
							placeholder="example@example.co.kr"
							required="required"
							style="border: 3px solid black" >
				</div>
			</div>
			<div class="row w-100" style="height: 20px">
			</div>
			
<!-- phone -->			 
			<div class="w-100 row mx-0 mt-2 container" style=" height: 50px">
				<div class="col-4 text-start pt-2 px-5 overflow-hidden" >
					<h3><strong># Phone</strong></h3>
				</div>
				<div class="col-8 px-4" >
					<input class="form-control form-control-lg w-50 "
							id="phone"
							name="phone"
							 type="tel"
							  style="border: 3px solid black"
							  pattern="^[0-9]{3}-[0-9]{3-4}-[0-9]{4}$"
							  maxlength="13"
							  title="ex) 010-0000-0000 형식으로 입력해주세요"
							  placeholder="010-0000-0000"
							  required="required">
				</div>
			</div>
			
			<div class="row w-100" style="height: 20px">
			</div>
			
<!-- submit -->			
			<div class="w-100 row mt-3 mx-0 pb-3 mb-0" style=" height: 70px">
				<div class="col-4">
				</div>
				<div class="col-2">
					<input id="submitBtn" class="form-control form-control-lg w-100 h-25 text-white" type="submit" style="border: 3px solid black; background-color: black" value="Save">
				</div>
				<div class="col-2">
					<input class="form-control form-control-lg w-100 h-25" 
							type="button"
							style="border: 3px solid black;"
							value="Back"
							onclick="history.go(-1)">
				</div>
				<div class="col-4" style="height: 150px">
				</div>
			</div>
			
		</div>	
	</form>

<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0 fixed-bottom">
	  <div class="container-fluid bg-black" style="height: 70px;">
	    <a class="navbar-brand text-white" href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	    <a class="text-white" href="booking" style="text-decoration: none; cursor: pointer;">예약하기 </a>
	    <a class="text-white" href="bookingCheckList" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white" href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>


</div>



</body>
</html>