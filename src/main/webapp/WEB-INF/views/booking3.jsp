<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking3 -> ###</title>
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
<script type="text/javascript" src="./js/booking3.js" defer="defer"></script>
<style>
	.seatButton:hover {
		background-color: black;
		color: white;
		transition: 0.5s; 
	}

</style>

</head>
<body >
	
<div class="container">
	
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
		<div class="row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0" >
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100  text-white text-center pt-3" style=" background-color: black; height: 70px"><h3><strong>C</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>
				
<!-- the Play name displayed here when select play -->
<!-- display : none before select play -->
				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
					 <hr><h4><b>* Select Play Seat</b></h4><hr/>
					 <div id="selectSeatResult" class="container px-2 text-break">
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
				<form id="selectSeatForm" method="POST" action="booking4" style="display: none;">
					 	<input type="text" name="idxP" value="${idxP }">
					 	<input type="text" name="viewTime" value="${viewTime }">
					 	<input type="text" name="viewDate" value="${viewDate }">
					 	<input type="text" name="viewPlace" value="${viewPlace }">
					 	<input id="seatNumber" name="seatNumber" type="text">
				</form>
				
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
					<div class="col-5 pt-3 w-50 bg-black text-white text-center " 
						onclick="history.go(-1)"
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>이전</strong></div>
					<div class="col-5 pt-3 w-50 bg-black text-white text-center" 
						onclick="booking3NextButton()" 
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>다음</strong></div>
				</div>
				
			</div>
			
<!-- right -->
			<div class="col-10 px-0">

				<div class="row w-100 mx-0" style="border: 1px solid white; height: 2px">
					<div class="col">
					</div>
				</div>		
					
				<div class="row text-white w-100 mx-0 mb-1 mt-0" style=" height: 43px; ">
					
					<div class="col pt-2"">
					</div>
					
				</div>
							
				<div class="container">
					<div class="row w-100 mx-0 px-0 pt-3" style="height: 230px;">
						<div class="col-3" style="height:300px;" ></div>
						<div class="col-6 text-center pt-3" style="height:230px; border: 3px solid black"><h2>공연 무대 </h2></div>
						<div class="col-3" style="height:300px; "></div>
					</div>
					
					<div class="row w-100 mx-0 px-0">
						<div class="col" style="height: 30px;">
						</div>
					</div>
					
					<div class="row w-100 mt-1 mx-0 px-0">
						<table>
							<tr>
								<th class="text-white text-center" style="width:100px; height: 50px; background-color: black; border-radius: 5px">
								A열 
								</th>
								<td style="width:20px; height: 50px;"></td>
								
								<th class="text-white text-center" style="width:100px; height: 50px; background-color: black; border-radius: 5px">
								B열  
								</th>
								
								<td style="width:20px; height: 50px;"></td>
								
								<th class="text-white text-center" style="width:100px; height: 50px; background-color: black; border-radius: 5px">
								C열 
								</th>
							</tr>
							<tr>
						<!-- A열  -->	
								<td class="px-0" style="width:125px; height: 380px;">
									<c:forEach var="a" begin="1" end="7">
										<div class="row w-100 mx-0 px-0 d-flex justify-content-center" style=" height:50px;">
											<c:forEach var="b" begin="1" end="3">
													<div class="seatButton col-3 mb-1 mx-1 px-0 pt-2 text-center "
														 style="border: 2px solid black; cursor: pointer;"
														 onclick="selectSeat(this)"
														 >A-${a}-${b}</div>
											</c:forEach>
										</div>
									</c:forEach>
								</td>
								
								<td style="width:15px; height: 380px;"></td>
								
						<!-- B열  -->	
								<td class="px-0" style="width:125px; height: 380px;">
									<c:forEach var="a" begin="1" end="7">
										<div class="row w-100 mx-0 px-0  d-flex justify-content-center" style=" height:50px;">
											<c:forEach var="b" begin="1" end="3">
												<div class="seatButton col-3 mb-1 mx-1 px-0 pt-2 text-center "
													 style="border: 2px solid black; cursor: pointer;"
													 onclick="selectSeat(this)"
													 >B-${a}-${b}</div>
											</c:forEach>
										</div>
									</c:forEach>
								</td>
								
								<td style="width:15px; height: 380px;"></td>
						<!-- C열  -->	
								<td class="px-0" style="width:125px; height: 380px;">
									<c:forEach var="a" begin="1" end="7">
										<div class="row w-100 mx-0 px-0  d-flex justify-content-center" style=" height:50px;">
											<c:forEach var="b" begin="1" end="3">
												<div class="seatButton col-3 mb-1 mx-1 px-0 pt-2 text-center "
													 style="border: 2px solid black; cursor: pointer;"
													 onclick="selectSeat(this)"
													 >C-${a}-${b}</div>
											</c:forEach>
										</div>
									</c:forEach>
								</td>
							
							</tr>
							
						</table>
						
						<div class="row w-100 text-white px-0 mx-0" style="height:22px; background-color: black; border-radius: 5px"></div>
						
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


</div>



</body>
</html>