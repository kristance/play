<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket_Info -> ###</title>
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
<script type="text/javascript" src="./js/modifyPlayTicketInfo.js" defer="defer"></script>
<style>
	#m_button:hover {
		background-color: black;
		color: white;
		transition:0.5s;
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
	
	<div class="w-100 row mx-0" style=" height: 30px">
	</div>
	
	<div class="w-100">
		<div class="w-100 pt-3 text-white fixed-top" style=" height: 64px; border: 3px solid black; background-color: black" >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;Ticket Information</h3>
		</div>
	</div>	
	
	<div class="w-100 container px-0" style=" height: 85vh;">			

		<div class="row mx-0 w-100" style="height: 30px" >
		</div>
				
		<div class="row mx-0 pt-3 px-3 bg-black text-white w-100 rounded  fs-2 fw-bold" style="height: 75px" >
			# ${playTicketVO.playTitle }
		</div>		
		
		<div class="row mx-0 w-100" style="height: 10px" >
		</div>
		
		<div class="row mx-0 w-100" style="height: 680px" >
			<div class="col-1">
				<div class="bg-black" style="width:1270px; height: 10px"></div>
			</div>
			<div class="col-3" style="width: 280px">
				<table >
					<tr style=" height: 25px">
						<td style="width: 700px">
							<div style="display: none">
							<!-- 히든 value -->
								<input id="idxT" type="text" value="${idxT }">
								<input id="currentPage" type="text" value="${currentPage }">
							</div>
						</td>
					
					</tr>
					<tr  style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
							# 예약 번호 </td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr  style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
							# 관람인 이름 </td>
					</tr>

					<tr style=" height: 10px"></tr>
					
					<tr  style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
							# 공연 장소</td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr  style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
							# 공연 일자 </td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
						# 관람인 수  </td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
							# 전화번호   </td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
							# 이메일   </td>
					</tr>

					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 70px">
						<td class="px-3 bg-black text-white text-start fw-bold fs-3"
							style="width: 700px; border-top-left-radius: 25px; border-top-right-radius: 25px; border-bottom-left-radius: 25px ">
							# 예약 변경 / 취소
						</td>
					</tr>
					
				</table>
				<div class="w-100" style="height: 50px"></div>
				<div class="bg-black mt-5" style="width:1270px; height: 10px"></div>
			</div>
			<div class="col-6">
				<table>
					<tr  style=" height: 28px">
						<td style="width: 700px"></td>
					</tr>
					
					<tr style=" height: 70px">
						<td class="fs-3 fw-bold px-4" style="width: 700px">
							${playTicketVO.bookNumber } 
						</td>
					</tr>
					
					<tr style=" height: 7px"></tr>
					
					<tr style=" height: 70px">
						<td class="fs-3 fw-bold px-4" style="width: 700px">
							<input class="form-control form-control-lg fw-bold fs-4"
									id="viewer" 
									type="text"
									style="border: 3px solid black; width: 300px "
									value="${playTicketVO.viewer }">
							 
						</td>
					</tr>

					<tr style=" height: 7px"></tr>
					
					<tr style=" height: 70px">
						<td class="fs-3 pt-1 fw-bold px-4" style="width: 700px">
							${playTicketVO.viewPlace } 
						</td>
					</tr>

					<tr style=" height: 7px"></tr>
					
					<tr  style=" height: 70px">
						<td class="fs-3 fw-bold pt-3 px-4" style="width: 700px">
							<select class="form-control form-control-lg fw-bold fs-5"
									id="viewDate"
									style="border: 3px solid black; width: 300px; display: inline-block;">
								<option value="${playTicketVO.viewDate }" selected="selected">${playTicketVO.viewDate }</option>
								<option value="empty">==========</option>
								<c:forEach var="playInfoViewDate" items="${playDay }">
								<option value="${playInfoViewDate }">${playInfoViewDate }</option>
								</c:forEach>	
							</select>
							 <select id="viewTime" class="form-control form-control-lg fw-bold fs-5"
							 		style="border:3px solid black; display: inline-block; width: 80px">
							 	<option selected="selected" value="${playTicketVO.viewTime }">${playTicketVO.viewTime }</option>
							 	<option value="empty">==========</option>
							 	<c:forEach var="vTime" items="${viewTime }">
								 	<option value="${vTime }" >${vTime}</option>
							 	</c:forEach>
							 </select>
							 시
						</td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 70px">
						<td class="fs-3 pt-3 fw-bold px-4" style="width: 700px">
							<span >${playTicketVO.viewerCount }</span><span>명</span>
						</td>
					</tr>
					
					<tr style=" height: 10px"></tr>

					<tr style=" height: 70px">
						<td class="px-4" style="width: 700px">
							<div class=" fw-bold fs-3 pt-2 " style="height: 60px; width: 500px;">
								<input class="form-control form-control-lg fw-bold"
										id="phone"
										type="text"
										style="border: 3px solid black"
										value="${playTicketVO.phone }">
								 
							</div>
						</td>
					</tr>
					<tr style=" height: 10px"></tr>

					<tr style=" height: 70px">
						<td class="px-4" style="width: 700px">
							<div class=" border fw-bold fs-3 pt-2 " style="height: 60px; width: 500px;">
								<input class="form-control form-control-lg fw-bold" 
										id="email"
										type="text"
										style="border: 3px solid black"
										value="${playTicketVO.email }">
							</div>
						</td>
					</tr>
					<tr style=" height: 10px"></tr>

					<tr style=" height: 70px">
						<td class="px-4 pt-2" style="width: 700px">
							<div id="m_button" class="border border-black rounded-pill fw-bold text-center fs-5 py-2 d-inline"
								style="height: 60px; width: 220px; border: 3px solid black; cursor: pointer;">
								&emsp;* 변경 완료&emsp;
							</div>
							&emsp;
							<div id="c_button" class="bg-danger text-white rounded-pill fw-bold text-center fs-5 py-2 d-inline"
								style="height: 60px; width: 220px; cursor: pointer;"
								>&emsp;* 변경 취소&emsp;</div>
						</td>
					</tr>
					<tr style=" height: 10px"></tr>

				</table>
			</div>
			
			<div class=" col-2 px-0 pt-5">
				<div class=" mt-2 h-50 w-75">
				</div>
			</div>
			
		</div>
	
	</div>	

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px">
	    <a class="navbar-brand text-white">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	    <a class="text-white"  href="javascript:bookingButton(${loginCheck })" style="text-decoration: none;">예약하기 </a>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck })" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white" href="playList"style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>


</div>



</body>
</html>