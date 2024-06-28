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
<script src="./js/booking.js" defer="defer" ></script>

</head>
<body class="bg-white">
	
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
		<div class=" row w-100 mx-3" style="height: 764px">
			<div class="col-2 px-0 " >
				<div class="w-100" style="height: 30px"></div>
				<hr/>
				<div class="w-100 pt-3 text-white text-center" style=" background-color: black; height: 70px"> <h3><strong>A</strong></h3></div>
				<div class="w-100" style="height: 10px"></div>

<!-- the Play name displayed here when select play -->
<!-- display : none before select play -->
				<div class="w-100 pt-0 text-center text-wrap" style=" height: 150px;">
					 <hr><h4><b>* Select Play</b></h4><hr/>
					 <div class="container px-2 text-break">
					 </div>
					 <div class="w-100 h-25"></div>
					 <span id="selectPlayName" class="bg-black text-white fw-bold fs-5"></span>
				</div>
				
				<form id="selectPlayform" method="POST" action="booking2" style="display: none;">
					<input id="selectPlayIdx" name="idxP" type="text">
				</form>
				
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"></div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"></div>
				<div class="w-100" style="height: 10px"></div>
				<div class="w-100 text-center pt-3" style=" height: 70px"> </div>
				<div class="w-100" style="height: 10px"></div>
				<hr>
				
				<div class="row w-100 mx-0 px-0" style=" height: 200px;">
					<div class="col-5 pt-3 w-50 bg-black text-white text-center " 
						onclick="history.go(-1)"
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>이전</strong></div>
					<div class="col-5 pt-3 w-50 bg-black text-white text-center" 
						onclick="clickNextButton()" 
						style="height: 50px; cursor: pointer; border-radius: 7px"><strong>다음</strong></div>
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
				
				<div class="row text-white w-100 mx-0 mb-1 mt-0" style=" height: 43px; background-color: black">
					<c:if test="${currentPage - 1 >= 1  }">
						<div class="col-2 pt-2 text-end" style="cursor: pointer;" onclick="location.href='?currentPage=${currentPage - 1}'">
							<h4> < 이전 페이지</h4>
						</div>
					</c:if>
					<c:if test="${currentPage - 1 < 1  }">
						<div class="col-2 pt-2 text-end" style="cursor: pointer;" onclick="firstOverPage()">
							<h4> < 이전 페이지</h4>
						</div>
					</c:if>
					
					<div class="col-8 pt-2">
					</div>
					<c:if test="${currentPage + 1 <= playInfoList.totalPage }">
						<div class="col-2 pt-2 text-start" style="cursor: pointer;" onclick="location.href='?currentPage=${currentPage + 1}'">
							<h4> 다음 페이지> </h4>
						</div>
					</c:if>
					<c:if test="${currentPage + 1 > playInfoList.totalPage }">
						<div class="col-2 pt-2 text-start" style="cursor: pointer;" onclick="lastOverPage()">
							<h4> 다음 페이지> </h4>
						</div>
					</c:if>
					
				</div>
<c:forEach var="list" items="${playInfoList.list }">
<!-- 1-content -->
				<div class="row w-100 mx-0" style="border: 1px solid black;">
		<!-- image -->					
					<div class="col-2" style="border: 1px solid black">
						<div class=" text-center h-100" style="border: 1px solid black">
							<img class="w-75 h-100" src="${list.playPoster }" style="object-fit: contain">
						</div>
					</div>
		<!-- title and detail -->			
					<div class="col-8 mx-0 px-0" >
						
						<table>

							<tr style="height: 5px;"></tr>
							<tr class=" mb-3"  style=" height: 50px; border: 1px solid black">
								<td class="bg-black text-white px-3 h-100" colspan="2" style=" width: 715px; font-size: 27px; font-weight: bold;">
									# ${list.playTitle }
								</td>
							</tr>
							
							<tr style="height: 5px;"></tr>
							
							<tr>
								<fmt:formatDate var="startDate" value="${list.playStartDate }" pattern="YYYY-mm-dd"/>
								<fmt:formatDate var="endDate" value="${list.playEndDate }" pattern="YYYY-mm-dd"/>
								<td class="px-3" colspan="2" style="border: 1px solid black; height: 35px">
									<h5><strong>* 공연 일자</strong></h5>&emsp;:&emsp;${startDate } ~ ${endDate }
								</td>
							
							</tr>
							<tr>
								<td class="w-50 px-3 border border-black" style=" height: 30px"><strong>* 상연일</strong>&emsp;:&emsp;${list.playDay } ${list.playTime }</td>
								<td class="text-end border border-black"><strong>* 공연장소</strong>&emsp;:&emsp;${list.playPlace }&emsp;</td>
							</tr>
							
						</table>
						
					</div>
		<!-- select play -->
					<div class="col-2 mx-0 px-3 pt-0" >
						<table>
							<tr>
								<td  style=" width: 143px; height: 50px; ">
								</td>
							</tr>
							<tr style="position: relative;">
								<td class=" w-100 px-0 mx-1 bg-black text-white text-center pt-1 overflow-hidden rounded-pill"  style=" position:absolute; height: 40px; border: 1px solid black; cursor: pointer; "
								 onclick="clickButton(${list.idxP})">
									<strong>* select button</strong>
								</td>
							</tr>
							<tr>
								<td style=" height: 50px; ">
								</td>
							</tr>
						</table>
					</div>

				</div>

<!-- 1-content -end -->				
				<div class="w-100" style="height: 3px">
				</div>
</c:forEach>
							
			</div>
			
		</div>
	</div>

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px;">
	    <a class="navbar-brand text-white"  href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  	<div class="text-secondary" >예약하기 </div>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck})" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>
</div>
</div>



</body>
</html>