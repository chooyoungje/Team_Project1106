<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	function memberlogingo(){
		memberloginform.submit();
	}
</script>
</head>
<body>
	<form action="memberlogin" method="post" name="memberloginform">
	<label for="mid">ID</label><br>
	<input type="text" id="mid" name="mid"><br>
	<label for="mid">PW</label><br>
	<input type="password" id="mpassword" name="mpassword"><br>
	</form>
	<button onclick="memberlogingo()">로그인</button>
</body>
</html>