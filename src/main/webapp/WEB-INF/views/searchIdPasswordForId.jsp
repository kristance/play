<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기 </title>
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
<script type="text/javascript" src="./js/searchIdPasswordForId.js" defer="defer"></script>
</head>
<body class="mx-0 my-0 px-0 py-0">

<div class=" my-5 d-flex justify-content-center align-self-center">
	<div class="container text-center py-4" style=" width: 500px; height: 500px" >
			<div class="fs-2 fw-bold">
				# 아이디 / 비밀번호 찾기
			</div>
			<div class="w-100" style="height: 25px"></div>
			<div class="w-100 row mx-0 px-0" style="height: 50px">
				<div class="w-50 h-100 col-6 pt-2 rounded-pill fw-bold fs-4 text-white bg-black">
					 아이디 찾기 
				</div>
				<br/>
				<br/>
				<div class="w-50 h-100 col-6 pt-2 rounded-pill fw-bold fs-4 border border-black"
				onclick="location.href='searchIdPasswordForPass'" style="cursor: pointer;">
					비밀번호 찾기 
				</div>
			</div>
			<div class="w-100" style="height: 20px"></div>
			<table class="w-100" style="height: 200px">
				<tr>
					<td class="w-25 fs-3 fw-bold" style=" height: 80px">
						* 이름
					</td>
					<td class="w-75" style=" height: 80px">
						<input id="name" class="form-control fs-4" type="text" style="border: 2px solid black; height: 50px">
					</td>
				</tr>
				<tr>
					<td class="w-25 fs-3 fw-bold" style=" height: 80px">
						* 이메일 
					</td>
					<td class="w-75" style=" height: 80px">
						<input id="email" class="form-control fs-4" type="email" style="border: 2px solid black; height: 50px">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 20px"></td>
				</tr>
				<tr>
					<td style=" height: 45px;" colspan="2"> 
						<div id="searchButton" class="h-100 fs-4 pt-1 fw-bold rounded-pill text-white bg-black"
							style=" width: 200px; display: inline-block; cursor: pointer;" >
							찾기 
						</div>
						<div class="h-100  fs-4 fw-bold rounded-pill pt-1"
							style=" width: 200px; display: inline-block; cursor: pointer; "
							onclick="self.close()">
							취소
						</div>
					</td>
				</tr>
			</table>
	</div>
</div>


</body>
</html>