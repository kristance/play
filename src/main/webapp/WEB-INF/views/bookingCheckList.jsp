<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookingCheckList -> ###</title>
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
<script type="text/javascript" src="./js/bookingCheckList.js" defer="defer"></script>
<style>
	#modifyInfoBtn:hover {
		background-color: white;
		color: black;
		transition:0.5s;
	} 
</style>
</head>
<body >
	
<div class="container">
	
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
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;BookingCheck</h3>
		</div>
	</div>
	
	<div class="container px-0">
		<div class="row w-100 mx-3 mt-3" style="height: 10px; " >
		</div>
		
	
<!-- left -->	
		<div class="row w-100 mx-3" style="height: 830px;">
			<div class="col-9 mt-2 pt-3 px-4 border  border-black">
				<div class="row w-100 mx-0 px-3 pt-1 bg-black text-white fw-bold" style="height: 50px">
					<div class="col-5 fs-3"># 티켓 리스트</div>
					<div class="col-3"></div>
					<div class="col-4 text-end px-2 pt-1 fs-4">
						<c:if test="${currentPage - 1 >= 1 }">
							<span onclick="location.href='?currentPage=${currentPage - 1}'" style="cursor: pointer;"> <- 이전</span>
						</c:if>
						<c:if test="${currentPage - 1 < 1 }">
							<span onclick="clickFirstPage()" style="cursor: pointer;"> <- 이전</span>
						</c:if>
						&nbsp;&nbsp;
						<c:if test="${currentPage + 1 <= playTicket.totalPage }">
							<span onclick="location.href='?currentPage=${currentPage + 1}'" style="cursor: pointer;">다음 -></span>
						</c:if>
						<c:if test="${currentPage + 1 > playTicket.totalPage }">
							<span onclick="clickLastPage()" style="cursor: pointer;">다음 -></span>
						</c:if>
					</div>
				</div>
				<div class="w-100 mx-0 fs-3 fw-bold" style="height: 10px">
				</div>
				
				<div class="w-100  mx-0" style="height: 650px">
									
					<div class="row w-100 mx-0" style="border: 1px solid black;">
<!-- page size - 6  -->

<c:set var="size" value="${fn:length(playTicket.list) }"></c:set>
<c:if test="${size == 0 }">

	<div class="w-100 h-25 fs-2 fw-bold text-center" style="border: 3px solid white;"> 예매된  공연이 없습니다. </div>
</c:if>
<c:if test="${size != 0 }">
<c:forEach var="ticket" items="${playTicket.list }">
<!-- 1 - content start -->
			<!-- image -->					
						<div class="col-2" style="border: 1px solid black">
							<div class="pt-2 text-center h-100" style="border: 1px solid black; cursor: pointer;" onclick="location.href='ticketInfo?idxT=${ticket.idxT}&currentPage=${currentPage }'">
								<img class="w-75 h-100" src="${ticket.playPoster}" style="object-fit:contains">
							</div>
						</div>
			<!-- title and detail -->			
						<div class="col-10 mx-0 px-0" >
							<table>
								<tr style="height: 5px;"></tr>
								<tr class=" mb-3" style=" height: 50px; border: 1px solid black">
									<td class="bg-black text-white px-3 h-100" colspan="12"  style="width:770px; font-size: 27px; font-weight: bold;">
										<a class="text-white" href="ticketInfo?idxT=${ticket.idxT }&currentPage=${currentPage}" style="text-decoration: none"># ${ticket.playTitle }</a>
									</td>
								</tr>
								
								<tr style="height: 5px;"></tr>
								
								<tr>
									<td class="px-3 w-75" style="border: 1px solid black; height: 35px">
										<div class="fw-bold fs-5" style="display: inline">* 공연일자</div><span>&emsp;:&emsp;2024-01-01 ~ 2024-04-01</span>
									</td>
									<td class=" border border-black text-end">
									<fmt:formatDate var="orderDate" value="${ticket.orderDate }" pattern="YYYY-MM-dd"/>
										<div class="fw-bold" >* 예매일자</div><span>&emsp;&emsp;${orderDate }</span>
									</td>
								</tr>
							</table>
							
						</div>
<!-- 1 - content end -->
					<div class="w-100 mx-0 border border-black" style="height: 10px">
					</div>
</c:forEach>					
</c:if>
	
					</div>
				
				</div>
			</div>
			
			
			
<!-- right -->
			<div class="col-3 mt-2 px-3" style="border: 1px solid black">

				<div class=" w-100 mx-0 mt-5 rounded d-flex justify-content-center align-items-center" style="height: 280px; border: 1px solid black">
					<img class="rounded" src="${profileImage}" style="width: 250px; height: 250px; object-fit : contain">
				</div>
				<div class="w-100 mt-2" style="height: 20px;">
				</div>
				<c:if test="${loginCheck == 1 }">
					<div class="w-100 mt-2 pt-3 border border-black text-center fs-3 fw-bold rounded-pill" style="height: 70px;">
						  * ${name }의 예약
					</div>
				</c:if>
				<c:if test="${loginCheck != 1 }">
					<div class="w-100 mt-2 pt-3 border border-black text-center fs-3 fw-bold rounded-pill" style="height: 70px;">
						  * ${viewer }의 예약
					</div>
				</c:if>
				<div class="w-100 mt-2" style="height: 20px;">
				</div>
				<div class="w-100 mt-2 text-center" style="height: 100px;">
					<c:if test="${loginCheck == 1 }">
						<span id="modifyInfoBtn" class="fw-bold bg-black text-white fs-5 rounded-pill py-3" onclick="location.href='modifyInfo?idxM=${idxM}'" style="cursor: pointer;">
							&emsp;* 회원 정보 수정&emsp;
						</span>
					</c:if>
					<c:if test="${loginCheck != 1 }">
						<span id="modifyInfoBtn" class="fw-bold bg-black text-white fs-5 rounded-pill py-3" onclick="location.href='modifyInfo'" style="cursor: pointer; display: none; ">
							&emsp;* 회원 정보 수정&emsp;
						</span>
					</c:if>
				</div>
				<div class="w-100 mt-2" style="height: 100px;">
				</div>
							
			</div>
			
		</div>
		
		
		
	</div>
	

<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0 fixed-bottom">
	  <div class="container-fluid bg-black" style="height: 70px; ">
	    <a class="navbar-brand text-white" href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	    <a class="text-white"  href="javascript:bookingButton(${loginCheck })" style="text-decoration: none;">예약하기 </a>
	    <div class="text-secondary" >예약확인 </div>
	    <a class="text-white"  href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>


</div>


</body>
</html>