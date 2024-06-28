<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterViewReply -> ###</title>
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
<script type="text/javascript" src="./js/AfterViewReplyList.js" defer="defer"></script>
</head>
<body>
	
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
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; "><i class="bi bi-arrow-left" ></i></a> &nbsp;# AfterViewReply</h3>
		</div>
	</div>
	
	<div class=" w-100" style="height: 46px"></div>
	
	<div class="container w-100 px-0" style="height: 790px">
		<div class="row w-100 bg-black rounded-pill mx-0" style="height: 60px">
			<label for="modalButton" class="col-1 text-center text-white pt-2 fs-3 " style="cursor: pointer;">
				<i class="bi bi-search fs-3"></i>
			</label>
			<div class="col-7 text-white text-center pt-2 fs-3 fw-bold">
				<!-- Button trigger modal -->
				<button id="modalButton" type="button" 
					class="btn btn-primary" 
					data-bs-toggle="modal" 
					data-bs-target="#staticBackdrop"
					style="display: none"></button>
				* 
			</div>
			<div class="col-2 text-white text-start pt-2 fs-3 fw-bold"> * Booker</div>
			<div class="col-2 text-white text-start pt-2 fs-3 fw-bold"> * ViewDate</div>
		</div>
		<div class="w-100" style="height: 10px"></div>
		<div class="w-100" style="height: 680px">
			<div class="w-100" style="height: 570px">
<c:if test="${fn:length(playReplyList.list) == 0 }">
	<div class="fs-2 fw-bold text-center border border-black"> 작성된 예매 후기가 없습니다.</div>
</c:if>

<!-- Content 7 Start-->
<c:if test="${fn:length(playReplyList.list) != 0 }">
<c:forEach var="replyList" items="${playReplyList.list }" >
				<div class="row w-100 mx-0" style="height: 70px">
				
					<a class="col-8  text-black text-center fs-4 ps-5 pe-2 pt-3 text-truncate" 
						href="upReplyViewCount?idxC=${replyList.idxC}&currentPage=${currentPage}" style="text-decoration: none">
						${replyList.subjectReply }
					</a>
					
					<div class="col-2 text-center fs-4 pt-3">
						${replyList.viewer }
					</div>
					<div class="col-2  text-center fs-4 pt-3">
					<fmt:formatDate var="writeDate" value="${replyList.writeDate }" pattern="YYYY-MM-dd" />
						${writeDate }
					</div>
				</div>
				<div class="w-100 mx-0" style="height: 12px; border-bottom: 1px solid lightgray"></div>
				
</c:forEach>
</c:if>
<!-- Content 7 End -->
			</div>
			<div class="w-100 mx-0" style="height: 10px"></div>
			<div class="w-100 mx-0" style="height: 5px"></div>
			<div class="w-100 mx-0 text-center" style="height: 60px">
<!--Page button 시작-->
<!-- -10 -->
<c:if test="${playReplyList.currentPage > 1 }">
				<div class="bg-black text-white text-center pt-2 fs-4" 
					style="width: 60px; height: 60px; border-radius:20px; cursor:pointer; display: inline-block; " 
					onclick="location.href='?currentPage=${playReplyList.startPage - 1 }&category=${category }&keyword=${keyword }'">
					-10
				</div>
</c:if>
<c:if test="${playReplyList.currentPage <= 1 }">
				<div class=" text-center pt-2 fs-4 border" 
					style="width: 60px; height: 60px; border-radius:20px; display: inline-block; " >
					-10
				</div>
</c:if>

<!-- pagebutton -->		
<c:forEach var="pNum" begin="${playReplyList.startPage }" end="${playReplyList.endPage }">
	<c:if test="${playReplyList.currentPage == pNum }">
			
				<div class=" pt-2 fs-4 border" 
				style="width: 60px; height: 60px; border-radius:20px; display: inline-block; ">
					${pNum }
				</div>
	</c:if>
	<c:if test="${playReplyList.currentPage != pNum }">
				<div class="bg-black text-white text-center pt-2 fs-4" 
					style="width: 60px; height: 60px; border-radius:20px; cursor:pointer; display: inline-block; " 
					onclick="location.href='?currentPage=${pNum }&category=${category }&keyword=${keyword }'">
					${pNum }
				</div>
	</c:if>
</c:forEach>

<!-- +10 -->
<c:if test="${playReplyList.endPage < playReplyList.totalPage }">
				<div class="bg-black text-white text-center pt-2 fs-4" 
					style="width: 60px; height: 60px; border-radius:20px; cursor:pointer; display: inline-block; " 
					onclick="location.href='?currentPage=${playReplyList.endPage + 1 }&category=${category }&keyword=${keyword }'">
					+10
				</div>
</c:if>
<c:if test="${playReplyList.endPage >= playReplyList.totalPage }">
				<div class=" text-center pt-2 fs-4 border" 
					style="width: 60px; height: 60px; border-radius:20px; display: inline-block; ">
					+10
				</div>
</c:if>
<!--Page button 끝-->

				<div class="bg-black text-white text-center rounded-pill pt-2 fs-4 me-3" 
					style="width: 150px; height: 50px; display: inline-block ; float: right; cursor: pointer;"
					onclick="javascript:replyWrite(${loginCheck}, 'w', ${currentPage })">글쓰기</div>
			</div>
		</div>
	
	</div>
	

<!-- Modal -->
<form action="AfterViewCommentSearch" method="GET">
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <div class="modal-title" id="staticBackdropLabel"><i class="bi bi-search fw-bold fs-2"></i><span class="fs-2 fw-bold">&nbsp;Search</span> </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<p>
		      	<select id="category" name="category" class="form-control form-control-lg" style="border: 2px solid black">
		      		<option>#</option>
		      		<option># Viewer</option>
		      	</select>
	      	</p>
	        <input id="keyword" name="keyword" class="form-control form-control-lg fs-2" type="search" style="border: 2px solid black">
	      </div>
	      <div class="modal-footer">
	      	<label for="search" class="bg-black text-white rounded-pill text-center fs-5 pt-2 fw-bold" style="width: 100px; height: 50px; cursor: pointer;" >Search</label>
	      	<label for="close" class="border border-black rounded-pill text-center fs-5 pt-2 fw-bold" style="width: 100px; height: 50px; cursor: pointer;" >Close</label>
	        <button id="search" type="submit" class="btn btn-primary" style="display: none">search</button>
	        <button id="close" type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="display: none">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>

<input id="loginCheck" type="text" value="${loginCheck }" style="display: none">	
	
	
	
	

<!-- navbar -->
	<nav class="navbar fixed-bottom navbar-expand-lg bg-black bg-body-tertiary mt-1 pt-0 pb-0">
	  <div class="container-fluid bg-black" style="height: 70px;">
	    <a class="navbar-brand text-white"  href="gate">* Bookers</a>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  	<a class="text-white"  href="javascript:bookingButton(${loginCheck })" style="text-decoration: none;" >예약하기 </a>
	    <a class="text-white"  href="javascript:bookingCheckButton(${loginCheck})" style="text-decoration: none;">예약확인 </a>
	    <a class="text-white"  href="playList" style="text-decoration: none;">공연리스트 </a>
	    <div class="text-secondary" >공연후기  </div>
	    <a class="text-white" style="text-decoration: none;"> </a>
	  </div>
	</nav>
</div>



</body>
</html>