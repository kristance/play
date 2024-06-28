<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlayList -> ###</title>
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
<script type="text/javascript" src="./js/playList.js" defer="defer"></script>
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
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;Play List</h3>
		</div>
	</div>
	
	<div class="container px-0">
		<div class="row w-100 mx-3 mt-3" style="height: 25px; " >
		</div>
		
	
<!-- left -->	
		<div class="row w-100 mx-3" style="height: 830px;">
			<div class="col-3 mt-2 pt-3 px-4 border  border-black">
			
				
				<div class="w-100 mt-2 fs-4 fw-bold text-center" style="height: 20px;">
					예매율 1위 !!!!!
				</div>
				<div class="w-100 mt-2 fs-4" style="height: 5px;">
				</div>
				
	<!-- 1위 이미지  -->
				<div class=" w-100 mx-0 px-2 mt-3 rounded text-center" style="height: 260px; ">
					<img src="${playInfoVO.playPoster }" style="object-fit:contain; height: 250px; border: 10px ridge black ;"> 
				</div>
	<!-- 1위 정보   -->			
				<div class="w-100 mt-2 pt-3 text-break text-center fs-4 fw-bold text-wrap" style=" height: 100px;">
					<span class="fs-3 fw-bold text-black" onclick="location.href='playInfo?idxP=${playInfoVO.idxP}&currentPage=${currentPage }'" style="text-decoration: none; cursor: pointer;">
						# ${playInfoVO.playTitle }
					</span>
				</div>
				
				
				
				<div class="w-100 text-start" style="height: 70px;">
					<span class="fw-bold fs-5 text-center bg-black text-white rounded-pill" style="display: inline-block;" >
						&emsp;* 공연장소&emsp;:&emsp;<br>
						&emsp;${playInfoVO.playPlace } &emsp;
					</span>
				</div>
				
				<div class="w-100 text-start mt-5" style="height: 25px;">
					<span class="fw-bold fs-5 bg-black text-white rounded-pill"  style="display: inline-block;" >
						&emsp;* 평점&emsp;:&emsp;${playInfoVO.playStar } &emsp;/&emsp;5.0 &emsp;
					</span>
				</div>
				
				<fmt:formatDate var="startDate" value="${playInfoVO.playStartDate }" pattern="YYYY-MM-dd"/>
				<fmt:formatDate var="endDate" value="${playInfoVO.playEndDate }" pattern="YYYY-MM-dd"/>
				<div class="w-100 text-start mt-3" style="height: 50px;">
					<div class="fw-bold fs-5 py-1 px-2 text-start bg-black text-white rounded d-inline-block text-wrap text-truncate" >
						&emsp;* 공연일자&emsp;:&emsp;<br/> ${startDate } ~ ${endDate }
					</div>
				</div>
				
	<!-- 1위 정보 끝  -->
				<div class="w-100 mt-2" style="height: 100px;">
				</div>
			
			
			</div>
			
			
			
<!-- right -->
			<div class="col-9 mt-2 px-3" style="border: 1px solid black">
			
				<div class="row w-100 mx-0 px-3 pt-1 bg-black text-white fw-bold" style="height: 50px">
					<div class="col-5 fs-3"># 공연 리스트</div>
					<div class="col-3"></div>
					<div class="col-4 text-end px-2 pt-1 fs-4">
					<c:if test="${currentPage - 1 >= 1 }">
						<span onclick="location.href='?currentPage=${currentPage - 1}'" style="cursor: pointer;"> <- 이전</span>
					</c:if>
					<c:if test="${currentPage - 1 < 1 }">
						<span onclick="limitPrev()" style="cursor: pointer;"> <- 이전</span>
					</c:if>
						&nbsp;&nbsp;
					<c:if test="${currentPage + 1 < playInfoList.totalPage }">
						<span onclick="location.href='?currentPage=${currentPage + 1}'" style="cursor: pointer;">다음 -></span>
					</c:if>
					<c:if test="${currentPage + 1 >= playInfoList.totalPage }">
						<span onclick="limitNext()" style="cursor: pointer;">다음 -></span>
					</c:if>
					</div>
				</div>
				<div class="w-100 mx-0 fs-3 fw-bold" style="height: 10px">
				</div>
				
				<div class="w-100  mx-0" style="height: 650px">
									
					<div class="row w-100 mx-0" style="border: 1px solid black;">

					
					
				</div>

<!-- pageSize 5 -->			
<c:forEach var="playInfoList" items="${playInfoList.list }">

	<!-- 1-content start-->
				<div class="row w-100 mx-0 px-1"">
		<!-- image -->					
					<div class="col-2 py-1 d-flex justify-content-center" style="border: 1px solid black">
						<a class="text-white" href="playInfo?idxP=${playInfoList.idxP }&currentPage=${currentPage}" style="text-decoration: none;">
							<img src="${playInfoList.playPoster }" style="object-fit:contain; height: 110px" > 
						</a>
					</div>
					
		<!-- title and detail -->			
					<div class="col-10 mx-0 px-0" >
						
						<table>
							<tr style="height: 5px;"></tr>
							<tr class=" mb-3" style=" height: 50px; border: 1px solid black">
								<td class="bg-black px-3 h-100" style=" width: 760px; font-size: 27px; font-weight: bold;">
									<a class="text-white" href="playInfo?idxP=${playInfoList.idxP }&currentPage=${currentPage}" style="text-decoration: none;">
										# ${playInfoList.playTitle }
									</a>
								</td>
							</tr>
							<tr style="height: 5px;"></tr>
							<tr>
								<td class="px-3 fs-5" style="border: 1px solid black; height: 35px">
								<fmt:formatDate var="startDate" value="${playInfoList.playStartDate }" pattern="YYYY-MM-dd"/>
								<fmt:formatDate var="endDate" value="${playInfoList.playEndDate }" pattern="YYYY-MM-dd"/>
									<span class="fw-bold">공연 일자</span> <span>&emsp;:&emsp;${startDate } ~ ${endDate }</span>
								</td>
							</tr>
							<tr>
								<td class="px-3 d-flex justify-content-between" style="border: 1px solid black; height: 30px">
									<span ><b>상연일&emsp;:&emsp;</b>${playInfoList.playDay } ${playInfoList.playTime }</span>
									<span> <b>공연 장소</b> : ${playInfoList.playPlace }</span>
								</td>
							</tr>
						</table>
					</div>

				</div>
	<!-- 1 content end -->
				<div class="w-100" style="height: 12px" ></div>
</c:forEach>
				
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
	    <a class="text-white"  href="javascript:bookingButton(${loginCheck })" style="text-decoration: none;">예약하기 </a>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck })" style="text-decoration: none;">예약확인 </a>
	    <div class="text-secondary" >공연리스트 </div>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>





</body>
</html>