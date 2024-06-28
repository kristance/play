<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뒤로가기 방지페이</title>
<script type="text/javascript">
	window.onload = () => {
		setTimeout ( () => {
			alert("뒤로가기 / 새로고침 방지 페이지 입니다. 메인페이지로 이동합니다.")
			location.href = 'gate'
		}, 10)
	}

</script>


</head>
<body>


</body>
</html>