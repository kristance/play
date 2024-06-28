<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>anonymous -> ###</title>
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
<script type="text/javascript" src="./js/signUp.js" defer="defer"></script>

</head>
<body >

<div class="container">
	
	
	<div class="w-100">
		<div class="w-100" style=" height: 15px;">
		</div>
	</div>

	<div class="w-100 row mx-0" style="background-color:black; height: 5px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 5px">
	</div>
	
	<div class="w-100">
		<div class="w-100 pt-3 text-white fixed-top" style=" height: 64px; border: 3px solid black; background-color: black" >
			<h3>&nbsp;&nbsp;<a class="text-white" onclick="history.go(-1)" style="text-decoration: none; cursor: pointer; border-radius: 13px "><i class="bi bi-arrow-left" ></i></a> &nbsp;Detail</h3>
		</div>
	</div>	
	
	<div class="w-100 container px-0" style=" height: 83vh;">			

		<div class="w-100 row mx-0" style=" height: 30px">
		
		</div>
		
		<div class="w-100 row mx-0" style=" height: 7px">
		</div>
		<div class="w-100 row mx-0" style=" height: 7px">
		</div>
		<c:set var="len" value="${fn:length(playInfoVO) }"></c:set>
		<c:if test="${len != 0 }">
		<c:forEach var="detail" items="${playInfoVO }">
			<span class="w-100 row px-0 mx-0 pt-1 text-center d-inline-block">
				<img src="${detail }" style="object-fit : cover;">
			</span>
		</c:forEach>
		</c:if>
		<c:if test="${len == 0 }">
			<span class="w-100 row px-0 mx-0 pt-1 text-center d-inline-block">
				<img src="default/defaultPoster.jpeg" style="object-fit : cover;">
			</span>
		</c:if>


		<div class="col-3 text-end px-5 pt-2">
		</div>	
	</div>
		
	<div class="w-100 row mx-0" style=" height: 20px">
	</div>
	
	<div class="w-100 row mx-0" style=" height: 60px">
		<div class="col-3 text-end pt-1 fw-bold fs-3 " >
		</div>	
		<div class="col-6">
		</div>
		<div class="col-3 text-center" >
		</div>	
	</div>
	
	
	<div class="w-100 row mx-0" style=" height: 30px">
	</div>
	
		
		
	</div>	


</div>



</body>
</html>