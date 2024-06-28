<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write_Reply -> ###</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
<script type="text/javascript" src="./js/AfterViewReplyWrite.js" defer="defer"></script>
</head>
<body>
	
<form id="replyForm" class="container" method="POST" enctype="multipart/form-data">
	
	<div class="w-100">
		<div class="w-100" style=" height: 14px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 25px">
	</div>
	

	<div class="w-100">
		<div class="w-100 pt-3 text-white fixed-top" style=" height: 64px; border: 3px solid black; background-color: black; " >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;# Write Reply</h3>
		</div>
	</div>
	
<!-- left -->	
	<div class="container px-0">
		<div class="w-100" style="height: 25px"></div>
		<div class="w-100" style="height: 20px"></div>
		<div class="bg-black w-100" style="height: 15px; border-top-left-radius: 10px; border-top-right-radius: 10px"></div>
		<div class="row w-100 mx-0" style="height: 690px;">
			<div class="col-6 px-5 h-100 ">
				<div class="w-100" style="height: 30px"></div>
				<div id="imageTag" class="w-100" style="height: 630px; ">
					<img class="w-100 h-100" src="default/default.jpg" style="object-fit:contain">
				</div>
				<div class="w-100" style="height: 30px"></div>
			</div>
			
<!-- right -->			
			<div class=" col-6 h-100 pe-2" style="border-left: 1px solid lightgray" >
				<table class="h-100 w-100">
					<tr style="height: 10px">
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td colspan="7"></td>
					</tr>
					<tr style="height: 40px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td class="fw-bold fs-6 text-truncate" colspan="7">
							* 공연 제목 : <span id="playTitle"></span>
					</td>
					</tr>
					<tr>
						<td  style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td class=" fs-4 fw-bold" style="width: 120px">
							* Viewer
						</td>
						<td  colspan="6">
							<input id="loginId" class="form-control w-50 fs-4" type="text" readonly="readonly"
								 style="border:2px solid white" value="${loginId }">
							<input id="currentPage" type="text" style="display: none" value="${currentPage }">
						</td>
					</tr>
					<tr style="height: 5px">
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td colspan="7"></td>
					</tr>
				
					<tr style="height: 40px">
						<td style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td class=" fw-bold fs-4" style="width: 95px "> * 별점 </td>
						<td class=" fs-4 px-3 pb-2" colspan="6">
						<input id="starTemp" type="hidden" value="1">
							<span id="star" onclick="upStar()" style="cursor: pointer;">
								<span><img src="./image/star.png" width="35px"></span>
							</span>
						</td>
					</tr>
					
					<tr style="height: 7px">
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td colspan="7">
							<select id="viewedPlaySel" class="form-control text-center" style="border: 2px solid black">
								<option value="공연 선택" >===공연 선택===</option>
								<c:forEach var="viewedList" items="${viewedList }">
									<option value="${viewedList.idxT }" > ${viewedList.playTitle }(${viewedList.viewDate })</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr style="height: 70px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td  colspan="7">
							<input class="form-control form-contorl-lg fs-3 text-start fw-bold" type="text" 
							id="subjectReply"
							style="border: 2px solid black"
							placeholder="제목을 적어주세요.">
						</td>
					</tr>
					
					<tr style="height: 300px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td colspan="7">
							<textarea class="form-control form-control-lg"
								id="contentReply"
								rows="9" maxlength="250"
								placeholder="250자까지 가능합니다."
								style="border: 2px solid black; resize: none;" ></textarea>
						</td>
					</tr>
					<tr style="height: 15px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td class=" text-end px-2">
							<span id="typingCount"></span>/250
						</td>
					</tr>
					<tr style="height: 30px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td  colspan="7">
							<label for="imageUpload"  
								class="bg-black w-100 text-white text-center rounded-pill fs-5" 
								style="height: 35px; cursor: pointer;">
								사진 업로드
							</label>
							<input id="imageUpload" type="file" style="display: none"
								accept="image/jpg, image/jpeg, image/png, image/webp">
						</td>
					</tr>
					<tr style="height: 7px">
						<td style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td  colspan="7">
							<div class="row mx-0">
								<div class="col-1"></div>
								<div class="col-1"></div>
								<label for="submitBtn" class="col-4 bg-black rounded-pill text-white fs-4 pt-2 text-center w-25" 
									style="height: 50px; cursor: pointer;">
									작성 완료
									<input id="submitBtn" type="submit" style="display: none" >
								</label>
								<div class="col-1"></div>
								<div class="col-4 rounded-pill fw-bold fs-4 pt-2 text-center w-25"
									 style="height: 50px; cursor: pointer;"
									 onclick="history.go(-1)">
									돌아가기
								</div>
								<div class="col-1"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="w-100" style="height: 15px"></div>
		<div class="bg-black w-100" style="height: 15px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px "></div>
		
		
	</div>

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px;">
	 7 <a class="navbar-brand text-white"  href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  	<a class="text-white"  href="javascript:bookingButton(${loginCheck })" style="text-decoration: none;" >예약하기 </a>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck})" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="playList" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="AfterViewReplyList" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>
</form>



</body>
</html>