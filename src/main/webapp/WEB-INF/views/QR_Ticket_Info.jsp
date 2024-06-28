<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR_Ticket_Info -> ###</title>
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
<script type="text/javascript" src="./js/qrcode.js" defer="defer"></script>
<script type="text/javascript" src="./js/QR_Ticket_info.js" defer="defer"></script>
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
			<h3>&nbsp;&nbsp; &nbsp;Ticket Infomation</h3>
		</div>
	</div>	
	
	<div class="w-100 container px-0" style=" height: 85vh;">			

		<div class="row mx-0 w-100" style="height: 50px" >
		</div>
				
		<div class="row mx-0 pt-3 px-3 bg-black text-white w-100  fs-2 fw-bold" style="height: 90px" >
			# ${playTitle }
		</div>		
		
		<div class="row mx-0 w-100" style="height: 10px" >
		</div>
		
		<div class="row mx-0 w-100" style="height: 680px" >
			<div class="col-2">
				<div class="bg-black" style="width:1270px; height: 10px"></div>
				<table >
					<tr style=" height: 45px">
						<td style="width: 700px"></td>
					
					</tr>
					<tr  style=" height: 80px">
						<td class="px-2 rounded bg-black text-white text-end fw-bold fs-4" style="width: 700px"># 예약자 이름 </td>
					</tr>

					<tr style=" height: 10px"></tr>
					
					<tr  style=" height: 80px">
						<td class="px-2 rounded bg-black text-white text-end fw-bold fs-4" style="width: 700px"># 공연 장소</td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr  style=" height: 80px">
						<td class="px-2 rounded bg-black text-white text-end fw-bold fs-4" style="width: 700px"># 예약 일자 </td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 80px">
						<td class="px-2 rounded bg-black text-white text-end fw-bold fs-4" style="width: 700px"># 관람인 수  </td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 80px">
						<td class="px-2 rounded bg-black text-white text-end fw-bold fs-4" style="width: 700px"># 전화번호   </td>
					</tr>
				</table>
				
				<div style="display: none">
					<input id="playTitle" type="text" value="${playTitle }">
					<input id="bookNumber" type="text" value="${bookNumber }">
					<input id="viewer" type="text" value="${viewer }">
					<input id="viewerCount" type="text" value="${viewerCount }">
					<input id="viewPlace" type="text" value="${viewPlace }">
					<input id="viewDate" type="text" value="${viewDate }">
					<input id="viewTime" type="text" value="${viewTime }">
					<input id="phone" type="text" value="${phone }">
				</div>
			
				<div class="bg-black mt-5" style="width:1270px; height: 10px"></div>
			</div>
			<div class="col-6">
				<table>
					<tr  style=" height: 50px">
						<td style="width: 700px"></td>
					</tr>
					
					<tr style=" height: 7px"></tr>
					
					<tr style=" height: 80px">
						<td class="fs-4 fw-bold px-4" style="width: 700px">
							${viewer }
						</td>
					</tr>

					<tr style=" height: 7px"></tr>
					
					<tr style=" height: 80px">
						<td class="fs-4 fw-bold px-4" style="width: 700px">
							${viewPlace } 
						</td>
					</tr>

					<tr style=" height: 7px"></tr>
					
					<tr  style=" height: 80px">
						<td class="fs-4 fw-bold px-4" style="width: 700px">
							${viewDate } / ${viewTime }
						</td>
					</tr>
					
					<tr style=" height: 10px"></tr>
					
					<tr style=" height: 80px">
						<td class="fs-4 fw-bold px-4" style="width: 700px">
							<span >${viewerCount }</span><span>명</span>
						</td>
					</tr>
					
					<tr style=" height: 10px"></tr>

					<tr style=" height: 80px">
						<td class="px-4" style="width: 700px">
							<div class=" fw-bold fs-4 pt-2 " style="height: 50px; width: 200px;">
								${phone } 
							</div>
						</td>
					</tr>
					<tr style=" height: 10px"></tr>

					<tr style=" height: 80px">
						<td style="width: 700px"></td>
					</tr>
				</table>
			</div>
			
			<div class="col-4 px-2 pt-5">
				<div class=" mx-3 mt-3 h-50 w-75 ">
					<span class="fs-5 fw-bold d-inline-block">&emsp; # 예매확인 QR코드 </span>
					<div id="qrCodeLoc" class="ms-2 mt-3 h-75 w-75" style="height: 200px;"></div>
				</div>
			</div>
			
		</div>
	
	</div>	

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px">
	    <a class="navbar-brand text-white">* Bookers</a>
	  </div>
	</nav>


</div>



</body>
</html>