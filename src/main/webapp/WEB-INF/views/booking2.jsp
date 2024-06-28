<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking2 -> ###</title>
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
<script type="text/javascript" src="./js/booking2.js" defer="defer"></script>
  
</head>
<body >
	
<form id="selectTimeForm" method="POST" action="booking3" class="container">
	
	<div class="w-100">
		<div class="w-100" style=" height: 14px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style="	 height: 5px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	

	<div class="w-100">
		<div class="w-100 pt-3 text-white bg-black fixed-top" style=" height: 64px; border: 3px solid black;  " >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;Reservation</h3>
		</div>
	</div>
	
<!-- left -->	
	<div class="container px-0">
		<div class="row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0">
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100 text-white text-center pt-3" style=" background-color:black; height: 70px"><h3><strong>B</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>

<!-- the Play name displayed here when select play -->
<!-- display : none before select play -->
				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
					 <hr><h4><b>* Select Play Time</b></h4><hr/>
					 <div class="container px-2 text-break">
					 </div>
				</div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"></div> 
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"> </div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"> </div>
				<div class="w-100" style="height: 10px"></div>
				<hr>
				
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
					<div class="col-5 pt-3 w-50 bg-black text-white text-center " 
						onclick="history.go(-1)"
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>이전</strong></div>
					<div class="col-5 pt-3 w-50 bg-black text-white text-center" 
						onclick="selectTimeNextButton()" 
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>다음</strong></div>
				</div>
				
			</div>
			
<!-- right -->
			<div class="col-10 px-0 ">

				<div class="row w-100 mx-0" style="border: 1px solid white; height: 2px">
					<div class="col">
					</div>
				</div>		

				<div class="row text-white w-100 mx-0 mb-1 mt-0" style=" height: 100px;">
					
					<div class="col pt-2" >
					</div>
					
				</div>
				<div class="row w-100 mx-0" style=" height: 100px">
					<div class="col-12 px-5 text-center"  style=" font-size: 75px">
						<h1><strong>* 공연 시간 선택 </strong></h1>
					</div>
				</div>
				
<!-- selected play title-->							
				<div class="row w-100 mx-3 container" style=" height: 80px">
					<div class="col-3 pt-4 bg-black text-white text-start" style="border-radius: 7px; height: 80px;" >
						<h4># 공연 제목</h4>
					</div>
					<div class="col pt-4 px-4 text-start">
						<h3><strong>${playInfo.playTitle } </strong></h3>
					    <input name="idxP" type="hidden" value="${playInfo.idxP }">
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 28px">
					<div class="col-3 px-5 text-end"  style=" font-size: 75px">
					</div>
				</div>
							
<!-- selected play place-->							
				<div class="row w-100 mx-3 container" style=" height: 100px">
					<div class="col-3 pt-4 bg-black text-white text-start" style="border-radius: 7px; height: 85px" >
						<h4># 공연 장소</h4>
					</div>
					<div class="col pt-2 px-4 text-center">
						<select class="form-control form-control-lg w-100 h-75" 
								id="viewPlace"
								name="viewPlace"
								style="border: 3px solid black">
							<option value="공연장소 선택" selected="selected">공연장소 선택</option>
							<option value="${playInfo.playPlace }">${playInfo.playPlace }</option>
						</select>
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 5px">
					<div class="col-3 px-5 text-end"  style=" font-size: 75px">
					</div>
				</div>
						
				<div class="row w-100 py-2 mx-3 pt-2 container" style=" height: 80px">
					<div class="col-3 bg-black text-white  pt-4 text-start" style="border-radius: 7px; height: 80px" >
						<h4># 공연 기간</h4>
					</div>
					<div class="col pt-3 ps-4 text-start fs-4 fw-bold"  >
						${startDate } ~ ${endDate }
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 25px">
				</div>
				
<!-- select date -->							
				<div class="row w-100 py-2 mx-3 pt-2 container" style=" height: 80px">
					<div class="col-3 bg-black text-white  pt-4 text-start" style="border-radius: 7px; height: 80px" >
						<h4># 공연 예매 가능일</h4>
					</div>
					<div class="col pt-2 ps-4 text-start"  >
						<select id="dateTag" class="form-control form-control-lg w-50 d-inline"
								name="viewDate" 
							 	style="border: 3px solid black; height:67px; font-size: 20px"
								>
							<option selected="selected" value="공연날짜 선택">== 공연 날짜 선택 ==</option>
							<c:forEach var="vDate" items="${playDay }">
							<option value="${vDate }"> ${vDate }</option>
							</c:forEach>
						</select>		
						
						<input id="startDate" type="hidden" value="${startDate }"> 
						<input id="endDate" type="hidden" value="${endDate }"> 
					</div>
				</div>
				
				<div class="row w-100 mx-0" style=" height: 28px">
					<div class="col-3 px-5 text-end"  style=" font-size: 75px">
					</div>
				</div>
				
<!-- select time -->							
				<div class="row w-100 mx-3 container" style=" height: 80px">
					<div class="col-3 bg-black text-white pt-4 text-start"  style=" border-radius:7px; font-size: 75px">
						<h4># 예매 시간</h4>
					</div>
					<div class="col px-4 pt-2 text-start">
						<select class="form-control form-control-lg w-25 d-inline" 
								id="viewTime"
								name="viewTime"	
								style="border: 3px solid black;  font-size: 20px; height: 67px ">
								<option value="공연시간 선택" selected="selected">공연시간 선택</option>
							<c:forEach var="playTime" items="${playTime }">
								<option value="${playTime }">${playTime }</option>
							</c:forEach>
						</select>
						<span class="fs-4 d-inline">&nbsp;시</span>
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


</form>



</body>
</html>