<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<script type="text/javascript" src="./js/modifyWritedReplyForm.js" defer="defer"></script>
</head>
<body>
	
<form id="modifyWritedReplyForm" action="modifyWritedReplyForm"  class="container" method="POST">
	
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
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="javascript:movePageLostContent(6)"
									 style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;# Write Reply</h3>
		</div>
	</div>
	
<!-- left -->	
	<div class="container px-0">
		<div class="w-100" style="height: 25px"></div>
		<div class="w-100" style="height: 20px"></div>
		<div class="bg-black w-100" style="height: 15px; border-top-left-radius: 10px; border-top-right-radius: 10px"></div>
		<div class="row w-100 mx-0" style="height: 690px">
			<div class="col-6 px-5 h-100 " style="border-right: 1px solid lightgray;">
				<div class="w-100" style="height: 30px"></div>
				
				<div class="w-100" style="height: 480px">
					<img id="imageTag" class="w-100 h-100" src="saveImage/${playReplyVO.imageReply }"   style= "object-fit:contain">
				</div>
				<div class="w-100" style="height: 10px"></div>
				
				<div class="w-100 row  mx-0 my-1 px-0" style="height: 53px">
					<div class="col-3 mx-0 px-3 text-end">
						<img class=" rounded-circle" 
							src="${memberVO.image }" 
							width="50px" height="50px"
							style="object-fit : fill; border: 1px solid lightgray">
					</div>
					<div class="col-9 pt-0 px-3 fs-2 fw-bold">${playReplyVO.viewer } </div>
				</div>
				
				<div class="w-100 row mx-0 my-1 px-0" style="height: 53px">
					<div class="col-3 mx-0 fs-4 mt-2 bg-black text-center text-white fw-bold rounded-pill"># Star</div>
					<div class="col-9 mt-2 fs-4">
						<input id="starTemp" type="hidden" value="1">
						<span id="star" onclick="upStar()" style="cursor: pointer;">
							<span><img src="./image/star.png" width="35px"></span>
						</span>
					</div>
				</div>
		<!-- 히든 value -->
		<div style="display: none">
			<input id="idxC" type="text" name="idxC" value="${playReplyVO.idxC }">
			<input id="currentPage" type="text" name= "currentPage" value="${currentPage }">
			<input id="idxM" type="text" name="idxM" value="${memberVO.idxM }">
			<input id="loginCheck" name="loginCheck" type="text" value="${loginCheck }">
			<input id="imageReply" name="imageCheck" type="text" value="${playReplyVO.imageReply }">
		</div>
				
				<div class="w-100 row mx-0 my-1 px-0" style="height: 53px">
					<label for="imageFile" class="col-12 fs-4 pt-1 mt-2 bg-black text-center text-white rounded-pill fw-bold mx-0"
							style="cursor: pointer" >
						사진 업로드
					</label>
					<input id="imageFile" type="file" value="saveImage/${playReplyVO.imageReply }" style="display: none">
				</div>
				<div class="w-100" style="height: 30px"></div>
			</div>
			
<!-- right -->			
			<div class="col-6 h-100 pe-2">
				<table class="h-100 w-100">
					<tr style="height: 10px">
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td colspan="7"></td>
					</tr>
					<tr style="height: 80px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td class="bg-black text-white rounded-pill fw-bold fs-2 px-3 text-truncate" colspan="7">
								<span class="fw-bold fs-2">* ${playInfoVO.playTitle }</span>
						</td>
					</tr>
					<tr>
						<td  style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td class=" fs-4 fw-bold" style="width: 120px"></td>
						<td  colspan="6"></td>
					</tr>
					<tr style="height: 5px">
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td colspan="7"></td>
					</tr>
				
					
					<tr style="height: 7px">
						<td style="width: 10px"></td>
						<td style="width: 10px"></td>
						<td colspan="7"></td>
					</tr>
					
					<tr style="height: 70px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td  colspan="7">
							<span class="fw-bold"># 제목 : </span><input class="form-control form-contorl-lg fs-3 text-start fw-bold" type="text" 
							id="subjectReply"
							style="border: 3px solid black; height: 80px; display: inline-block;"
							value="${playReplyVO.subjectReply }">
						</td>
					</tr>
					
					<tr style="height: 30px">
						<td style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td class=" fw-bold fs-4" style="width: 95px "></td>
						<td class=" fs-4 px-3 pb-2" colspan="6"></td>
					</tr>
					
					<tr style="height: 300px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td colspan="7">
							<span class="fw-bold"># 내용 : </span><textarea class="form-control form-control-lg"
								id="contentReply"
								rows="9" maxlength="250"
								style="border: 3px solid black; height:350px; resize: none; font-size: 30px" 
								>${playReplyVO.contentReply }</textarea>
						</td>
					</tr>
					<tr style="height: 10px">
						<td  style="width: 10px"></td>
						<td  style="width: 10px"></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td ></td>
						<td class=" text-end px-2"></td>
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
								<div id="modifyButton" class="col-4 bg-black rounded-pill text-white fs-4 pt-2 text-center w-25" 
									style="height: 50px; cursor: pointer;">
									수정 완료
								</div>
								<div class="col-1"></div>
								<div class="col-4 rounded-pill fw-bold fs-4 pt-2 text-center w-25"
									 style="height: 50px; cursor: pointer;"
									 onclick="location.href='AfterViewReplyList?currentPage=${currentPage}'">
									수정취소
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
	    <a class="navbar-brand text-white"  href="javascript:movePageLostContent(1)">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  	<a class="text-white"  href="javascript:movePageLostContent(2)" style="text-decoration: none;" >예약하기 </a>
	    <a class="text-white"  href="javascript:movePageLostContent(3)" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="javascript:movePageLostContent(4)" style="text-decoration: none;">공연리스트 </a>
	    <a class="text-white" href="javascript:movePageLostContent(5)" style="text-decoration: none;">공연후기  </a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>
</form>



</body>
</html>