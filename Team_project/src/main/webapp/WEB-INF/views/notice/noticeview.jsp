<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function noticelist(){
	location.href="noticelist?page="+${page}
}
</script>
</head>
<body>

	<table border ="1">
		<tr>
			<th>공지사항 제목</th>
			<th>공지사항 내용</th>
			<th>공지사항 날짜</th>
			<th>공지사항 조회수</th>
			<th>공지사항 첨부파일</th>
		</tr>
		<tr>
			<td>${ndto.ntitle}</td>
			<td>${ndto.ncontents}</td>
			<td>${ndto.ndate}</td>
			<td>${ndto.nhits}</td>
			<td>${ndto.nfilename}</td>
		</tr>
	</table>
	<a href="#">파일 다운로드</a>
	<button onclick="noticelist()">목록</button>
</body>
</html>