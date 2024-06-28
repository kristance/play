<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="./js/gate.js" defer="defer"></script>
<title>Gate -> ###</title>

</head>
<body style="background-color: black">

<div class="container">

		<div class="container">
			<div class="container w-100" style=" height: 120px; background-color : black" >
				<div class="row h-50">
					<div class="col-11"></div>
					<div class="col-1 text-align-end text-white"></div>
				</div>
				<div class="row h-50">
					<div class="col-9"></div>
					<div class="col-xl-3 text-end text-white px-1 pt-4 pb-1">
						<c:if test="${loginCheck == 1 }">
							<a class="text-white" href="logout" style="text-decoration: none;"><i class="bi bi-key"></i> Logout</a> &nbsp;&nbsp;
						</c:if>
						<c:if test="${loginCheck != 1 }">
							<a class="text-white" href="login" style="text-decoration: none;"><i class="bi bi-key"></i> Login</a> &nbsp;&nbsp;
						</c:if>
						<a class="text-white" href="signUp" style="text-decoration: none;"><i class="bi bi-person-fill"></i> Sign up</a> 
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- Carousel -->
		<div id="carouselExampleAutoplaying" class="carousel slide mt-0 container carousel-fade"
			data-bs-ride="carousel">
			<div class="carousel-inner h-75"  >
				<div class="carousel-item active ">
					<img src="${playInfoActive.playPoster }" class="d-block w-100" alt="..." 
						style="object-fit:contain; height: 500px" onclick="location.href='playInfo?idxP=${playInfoActive.idxP}'">
				</div>
					<c:if test="${list.length != 0 }">
					<c:forEach var="list" items="${modelList }">
						<div class="carousel-item">
							<img src="${list.playPoster }" class="d-block w-100" alt="..."  
								style="object-fit:contain" onclick="location.href='playInfo?idxP=${list.idxP}'">
						</div>
					</c:forEach>
					</c:if>
					<c:if test="${list.length == 0 }">
						<div class="carousel-item">
							<img src="${modelList.playPoster }" class="d-block w-100" alt="..." style="object-fit:cover;">
						</div>
					</c:if>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<div class="container">
			<div class="container w-100" style=" height: 20px; background-color : black" ></div>
		</div>
		
		<!-- navbar -->
		<nav class="navbar bg-black bg-body-tertiary pt-0 pb-0">
		  <div class="container-fluid bg-black">
		    <a class="navbar-brand text-white" href="gate">* Bookers</a>
		    <a class="text-white" style="text-decoration: none;"> </a>
		    <c:if test="${loginCheck != 1 }">
			    <a class="text-white" href="twoWay" style="text-decoration: none;">예약하기 </a>
		    </c:if>
		    <c:if test="${loginCheck == 1  }">
			    <a class="text-white" href="booking" style="text-decoration: none;">예약하기 </a>
		    </c:if>
		    <a class="text-white" href="javascript:bookingCheckButton(${loginCheck})" style="text-decoration: none;">예약확인 </a>
		    <a class="text-white" href="playList" style="text-decoration: none;">공연리스트 </a>
		    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
		    <a class="text-white" style="text-decoration: none;"> </a>
		  </div>
		</nav>
		
		<div class="w-100">
			<div class="w-100" style=" height: 350px; background-color : black" >
			</div>
		</div>
		
		
		
		<!-- footer -->
		<hr style="color: gray">
		<div class="container" style="height: 100px; background-color: black">
			<footer>
				<div class="text-white">&copy;Copyright in *Bookers</div>
			</footer>
		</div>
		
		
		
	</div>



</body>
</html>