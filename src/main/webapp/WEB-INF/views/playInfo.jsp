<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>playInfo -> ###</title>
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

<style>
	#detailBtn:hover {
		background-color: black;
		color:white;
		transition: 0.5s
	}
</style>
</head>
<body >

<div class="container">
	
	
	<div class="w-100">
		<div class="w-100" style=" height: 15px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style="background-color:black; height: 5px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	
	<div class="w-100">
		<div class="w-100 pt-3 text-white fixed-top" style=" height: 64px; border: 3px solid black; background-color: black" >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; border-radius: 13px "><i class="bi bi-arrow-left" ></i></a> &nbsp;Play Information</h3>
		</div>
	</div>	
	
	<div class="w-100 container px-0" style=" height: 83vh;">			
		
		<div class="row w-100 " style="height: 45px"> </div>
		<div class="row w-100 pt-1 px-3 bg-black text-white fs-2 fw-bold rounded" style="height: 55px"># 공연정보  </div>
		<div class="row w-100 " style="height: 10px"> </div>
		
		<div class="row w-100 bg-dark bg-gradient rounded" style="height: 330px">
			<div class="col-2"></div>
			<div class="row col-8">
				<div class="col-3"></div>
				<div class="col-6 text-white fs-3"> 
					<div class="w-75 h-75" >
						<img class=" mx-3" src="${playInfoVO.playPoster }" style="object-fit: contain; height: 330px;">
					</div>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row w-100" style="height: 5px"> </div>
		<div class="row w-100 pt-2 px-3 bg-black text-white fs-2 fw-bold fst-italic text-truncate rounded" style="height: 70px">
			* ${playInfoVO.playTitle }
		</div>
		<div class="row w-100 " style="height: 7px"></div>
		<div class="row w-100 " style="height: 60px">
			<div class=" col-2 bg-black text-white fs-4 fw-bold text-center pt-2"
				style="border-top-left-radius: 20px; border-top-right-radius: 30px; border-bottom-left-radius: 18px" >
				* 공연 일시 
			</div>
			<div class="col-1">	</div>
			<fmt:formatDate var="startDate" value="${playInfoVO.playStartDate }" pattern="YYYY-MM-dd"/>
			<fmt:formatDate var="endDate" value="${playInfoVO.playEndDate }" pattern="YYYY-MM-dd"/>
			<div class="col-7 px-3 pt-2 fs-2 fw-bold"><span>${startDate }</span> ~ <span>${endDate }</span> </div>
			<div class="col-2">	</div>
		 </div>
		 
		<div class="row w-100 mt-1 " style="height: 60px">
			<div class="col-2 bg-black text-white fs-4 fw-bold text-center pt-2"
				style="border-top-left-radius: 20px; border-top-right-radius: 30px; border-bottom-left-radius: 18px" >
				* 공연 장소 
			</div>
			<div class="col-1"></div>
			<div class="col-7 px-3 pt-2 fs-2 fw-bold"> ${playInfoVO.playPlace } </div>
			<div class="col-2"></div>
		 </div>
		 
		<div class="row w-100 mt-1 " style="height: 60px">
			<div class="col-2 bg-black text-white fs-4 fw-bold text-center pt-2"
				style="border-top-left-radius: 20px; border-top-right-radius: 30px; border-bottom-left-radius: 18px" >
				* 평점 
			</div>
			<div class="col-1"></div>
			<div class="col-7 px-3 pt-2 fs-2 fw-bold"><span>${playInfoVO.playStar }</span>/<span>10</span> </div>
			<div class="col-2"></div>
		 </div>
		 
		<div class="row w-100 mt-1 " style="height: 60px">
			<div class="col-2 bg-black text-white fs-4 fw-bold text-center pt-2"
				style="border-top-left-radius: 20px; border-top-right-radius: 30px; border-bottom-left-radius: 18px" >
				* 상세 정보  
			</div>
			<div class="col-1"></div>
			<div class="col-7 px-3 pt-1 fs-2 fw-bold">
				<span id="detailBtn" class=" border border-black rounded-pill fs-5 py-2" style="cursor: pointer;"  onclick="location.href='playInfoDetail?idxP=${playInfoVO.idxP}'">&emsp;상세 정보 보기&emsp;</span>
			</div>
			<div class="col-2"></div>
		 </div>
		 
		<div class="row w-100 " style="height: 50px"> </div>
		
		
		
	</div>	

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px">
	    <a class="navbar-brand text-white" href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	    <a class="text-white"  href="booking" style="text-decoration: none;">예약하기 </a>
	    <a class="text-white"  href="bookingCheckList" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white"  href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>


</div>



</body>
</html>