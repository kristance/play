<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login -> ###</title>
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
<script src="./js/twoWay.js" defer="defer" ></script>
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
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; border-radius: 13px "><i class="bi bi-arrow-left" ></i></a> &nbsp;Login</h3>
		</div>
	</div>	
	
	<div class="w-100 container px-0" style=" height: 83vh;">			

		<div class="w-100 row mx-0" style=" height: 30px">
		
		</div>

		<div class="w-100 row mx-0" style=" height: 100px"> 
		</div>

		<div class="w-100 row px-0 mx-0 pt-1 text-center" style=" height: 100px">
			<h1><strong>* 예약 방식 선택</strong></h1>
		</div>

		<div class="w-100 row mx-0" style=" height: 70px">
		</div>

		<div class="w-100 row mx-0" style=" height: 60px">
			<div class="col-6">
			</div>
			
			<div class="col-3 text-end px-5 pt-2">
			</div>	
		</div>
		
		<div class="w-100 row mx-0" style=" height: 20px">
		</div>
		
		<div class="w-100 row mx-0" style=" height: 100px">
			<div class="col-1">
			</div>
			<div class=" col-4 h-100 bg-black text-white pt-4 fs-3 text-center" 
				style="cursor: pointer;" onclick="location.href='loginNotB?status=n'">
				로그인하고 예약하기
			</div>	
			<div class="col-2">
			</div>
			<div class="col-4 h-100 bg-black text-white pt-4 fs-3 text-center" 
				style="cursor: pointer;" onclick="anonymousBooking()">
				비로그인 상태로 예약하기
			</div>	
			<div class="col-1">
			</div>
		</div>
		
		<div class="w-100 row mx-0" style=" height: 15px">
		</div>
		
		<div class="w-100 row mx-0" style=" height: 30px">
		</div>
		
		<div class="w-100 row mx-0" style=" height: 15px">
		</div>
		
		<div class="w-100 row mx-0" style=" height: 50px">
		</div>
		
		<div class="w-100" style="height: 10px"></div>
		
		<div class="w-100 row mx-0" style=" height: 50px">
		</div>
		
		<div class="w-100 row mx-0" style=" height: 100px">
		</div>
		
		<div class="w-100 row mx-0" style=" height: 15px">
			
		</div>
		
		
	</div>	

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px">
	    <a class="navbar-brand text-white" href="gate">* Bookers</a>
	  </div>
	</nav>


</div>



</body>
</html>