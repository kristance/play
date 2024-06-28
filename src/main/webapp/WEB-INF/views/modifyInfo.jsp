<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyInfo -> ###</title>
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
<script type="text/javascript" src="./js/modifyInfo.js" defer="defer"></script>
<style>
	#addressBtn:hover {
		background-color: black;
		color: white;
		transition:0.5s;
	}
	
	#backBtn:hover {
		background-color: black;
		color: white;
		transition:0.5s;
	}
</style>
</head>
<body >
	
<form id="modifyInfoForm" class="container" method="POST" action="modifyInfoBridge" enctype="multipart/form-data">
	
	<div class="w-100">
		<div class="w-100" style=" height: 14px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style="background-color:black; height: 5px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	

	<div class="w-100">
		<div class="w-100 pt-3 text-white fixed-top" style=" height: 64px; border: 3px solid black; background-color: black; " >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;Modify_Info</h3>
		</div>
	</div>
	
	<div class="container px-0">
		<div class="row w-100 mx-3 mt-3" style="height: 10px; " >
		</div>
		
	
<!-- left -->	
		<div class="row w-100 mx-3" style="height: 830px;">
			<div class="col-9 mt-2 pt-3 px-4 border  border-black">
				<div class="row w-100 mx-0 px-3 pt-1 bg-black text-white fw-bold" style="height: 50px">
					<div class="col-5 fs-3">* 회원 정보 수정 </div>
					<div class="col-3"> <input id="idxM" name="idxM" type="hidden" value="${idxM }"></div>
					<div class="col-4 text-end px-2 pt-1 fs-4">
					</div>
				</div>
				<div class="w-100 mx-0 fs-3 fw-bold" style="height: 10px">
				</div>
				
				<div class="w-100  mx-0" style="height: 650px">
									
					<div class="row w-100 mx-0" style=" height: 5px">
					</div>
<!-- ID -->
					<div class="row w-100 mx-0 container" style="height: 75px">
						<div class="col-3 fw-bold fs-3 pt-2"># ID</div>
						<div id="idValue" class="col-8 pt-2 fw-bold fs-3"></div>
						<input id="id" name="id" type="text" style="display: none">
						<div class="col-1 "></div>
					</div>
<!-- name -->			
					<div class="row w-100 mx-0 container" style=" height: 80px">
						<div class="col-3 fw-bold fs-3 overflow-hidden "># 이름</div>
						<div class="col-8 ">
							<input id="name" name="name" class="form-control from-control-lg h-75 w-75" type="text" style="border: 3px solid black;">
						</div>
						<div class="col-1"></div>
					</div>
<!-- password -->			
					<div class="row w-100 mx-0 container" style=" height: 80px">
						<div class="col-3 fw-bold fs-3 overflow-hidden "># 비밀번호</div>
						<div class="col-8 ">
							<input id="password" name="password" class="form-control from-control-lg h-75 w-75" type="password" style="border: 3px solid black;">
						</div>
						<div class="col-1"></div>
					</div>
<!-- Adress -->					
					<div class="row w-100 mx-0 container" style=" height: 320px">
						<div class="col-3 fw-bold fs-3 overflow-hidden"># 주소</div>
						<div class="col-8">
							<input name="addrPost" class="form-control form-control-lg  w-50 mb-2" type="text" id="sample6_postcode" placeholder="우편번호" style="border: 3px solid black; display: inline;" readonly="readonly" > 
							<input id="addressBtn" class="form-control form-control-lg  w-50 mb-2" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="border: 3px solid black; display: inline; font-weight: bold;"> <br>
							<input name="addrMain" class="form-control form-control-lg  w-100 mb-2" type="text" id="sample6_address" placeholder="주소" style="border: 3px solid black; display: inline;"  readonly="readonly" > <br>
							<input name="addrDetail1" class="form-control form-control-lg  w-100 mb-2" type="text" id="sample6_extraAddress" placeholder="상세주소1" style="border: 3px solid black" readonly="readonly">
							<input name="addrDetail2" class="form-control form-control-lg  w-100 mb-2" type="text" id="sample6_detailAddress" placeholder="상세주소2" style="border: 3px solid black; display: inline;" > 
							 
							
							<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</div>
						<div class="col-1 "></div>
					</div>
<!-- Email -->					
					<div class="row w-100 mx-0 container" style=" height: 100px">
						<div class="col-3 fw-bold fs-3 overflow-hidden"># 이메일</div>
						<div class="col-8  ">
							<input id="email" name="email" class="form-control form-control-lg w-75" type="email" placeholder="example@example.co.kr" style="border: 3px solid black">
						</div>
						<div class="col-1  "></div>
					</div>
<!-- Phone No. -->					
					<div class="row w-100 mx-0 container" style="height: 100px">
						<div class="col-3 fw-bold fs-3 overflow-hidden"># 전화번호</div>
						<div class="col-8 ">
							<input class="form-control form-control-lg w-75"
								 	id="phone"
								 	name="phone"
								 	type="tel"
								 	placeholder="010-0000-0000"
								 	style="border: 3px solid black"
									pattern="[0-9]{3}-[0-9]{3-4}-[0-9]{4}"
									maxlength="13"
									title="ex) 010-0000-0000 형식으로 입력해주세요"
								 	style="border: 3px solid black">
						</div>
						<div class="col-1"> </div>
					</div>

					<div class="row w-100 mx-0" style="height: 100px">
					</div>
					
					
				
				</div>
			</div>
			
			
			
<!-- right -->
			<div class="col-3 mt-2 px-3" style="border: 1px solid black">

				<div id="imageLoc" class=" w-100 mx-0 mt-3 rounded d-flex justify-content-center align-items-center" style="height: 280px; border: 1px solid black">
					<img id="imageTag" class="rounded" src="saveImage/${memberVO.image }" style="object-fit:contain; width: 250px; height: 250px" >
				</div>
				<div class="w-100 mt-2" style="height: 20px;">
				</div>
			<!--  -->
				<label for="imageUpload" class="w-100 mt-2 pb-2 border border-black text-center fs-5 fw-bold rounded-pill" style="height: 33px; cursor: pointer;">
							&emsp;* 이미지 업로드&emsp;
				</label>
						<input id="imageUpload" name="imageUpload" type="file" style="display: none ">
			<!--  -->	
				<div class="w-100" style="height: 5px;">
				</div>
			<!--  -->	
				<label for="modifySubmit" class="w-100 mt-2 pt-1 bg-black text-white text-center fs-4 fw-bold rounded-pill" 
						style="height: 50px; cursor: pointer;">
					&emsp;* 수정완료&emsp;
				</label>
				<input id="modifySubmit" type="submit" style="display: none;">
			<!--  -->	
				<div class="w-100 mt-2" style="height: 20px;">
				</div>
			<!--  -->	
				<div class="w-100 mt-2 text-center" style="height: 50px;">
					<span id="backBtn" class="fw-bold fs-5 py-2 border border-black rounded-pill" onclick="location.href='bookingCheckList'" style="cursor: pointer;">
						&emsp;* 돌아가기 &emsp;
					</span>
				</div>
			<!--  -->	
				<div class="w-100 mt-2" style="height: 20px;">
				</div>
			<!--  -->
				<div class="w-100 mt-2 text-center" style="height: 50px;">
					<span class="fw-bold fs-5 bg-danger text-white rounded-pill" onclick="signOut()" style="cursor: pointer;">
						&emsp;* 회원탈퇴  &emsp;
					</span>
				</div>
			<!--  -->	
				<div class="w-100 mt-2" style="height: 100px;">
				</div>
							
			</div>
			
		</div>
		
		
		
	</div>
	
</form>

<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0 fixed-bottom">
	  <div class="container-fluid bg-black" style="height: 70px; ">
	    <a class="navbar-brand text-white" href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	    <a class="text-white"  href="javascript:bookingButton(${loginCheck })"  style="text-decoration: none;">예약하기 </a>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck })" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white" href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>





</body>
</html>