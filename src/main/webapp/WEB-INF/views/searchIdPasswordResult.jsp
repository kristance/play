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

<script type="text/javascript" src="./js/searchIdPasswordResult.js" defer="defer"></script>

</head>
<body class="mx-0 my-0 px-0 py-0">

<div class=" my-5 d-flex justify-content-center align-self-center">
	<div class="container text-center py-3" style=" width: 500px; height: 400px" >
			<div class="fs-2 fw-bold">
				# 아이디 / 비밀번호 찾기
			</div>
			<div class="w-100" style="height: 15px"></div>
			<table class="w-100" style="height: 200px">
				<tr>
					<td class="w-25 fs-3 fw-bold" style=" height: 40px"></td>
					<td class="w-75" style=" height: 40px"></td>
				</tr>
				<tr>
					<td class="w-25 fs-3" style=" height: 80px" colspan="2">
						 <span id="status" class="fw-bold"> *  </span> 는 <span id="result" class="fs-2 fw-bold"> ${result }</span> 입니다.
						 <div style="display: none">
						 	<input id="resultV" type="text" value="${result }">
						 	<input id="statusV" type="text" value="${status }">
						 </div>
					</td>
				</tr>
				<tr>
					<td class="w-25 fs-3 fw-bold" style=" height: 40px"></td>
					<td class="w-75" style=" height: 40px"></td>
				</tr>
				<tr>
					<td colspan="2" style="height: 20px"></td>
				</tr>
				<tr>
					<td style=" height: 45px;" colspan="2"> 
						<div class="h-100 fs-4 pt-1 fw-bold rounded-pill text-white bg-black" 
							style=" width: 200px; display: inline-block; cursor: pointer;" 
							onclick="self.close()">
							닫기 
						</div>
					</td>
				</tr>
			</table>
	</div>
</div>


</body>
</html>