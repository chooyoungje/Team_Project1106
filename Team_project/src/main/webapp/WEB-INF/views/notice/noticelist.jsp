<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>Insert title here</title>
<script>

//상세조회
function noticeviewgo(nnumber){
	location.href="noticeview?nnumber="+nnumber;
};

//수정
function noticeupdate(nnumber){
	location.href="noticeupdate?nnumber="+nnumber+"&page="+${paging.page};
};

//삭제
function noticedelete(nnumber){
	location.href="noticedelete?nnumber="+nnumber;
};

</script>
</head>
<body>

		<table border="1">
		<tr>
			<td>공지사항 번호</td>
			<td>공지사항 제목</td>
			<td>작성일자</td>
			<td>조회수</td>
			<td>파일</td>
		</tr>
		<c:forEach var="notice" items="${noticelist}" >
			<tr>
				<td>${notice.nnumber}</td>
				<td>
				<a href="#" onclick="noticeviewgo('${notice.nnumber}')">${notice.ntitle}</a></td>
				<td>${notice.ndate}</td>
				<td>${notice.nhits}</td>
				<td>${notice.nfilename}</td>
				<td><button onclick="filedown('${notice.nfilename}')">파일 다운로드</button></td>
			<c:if test="${sessionScope.loginid eq 'admin'}">	
				<td><button onclick="noticeupdate('${notice.nnumber}')">수정</button></td>
				<td><button onclick="noticedelete('${notice.nnumber}')">삭제</button></td>
			</c:if>	
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><button onclick="location.href='noticewritego'">글쓰기</button> </td>
		</tr>
	</table>
	
	

	<!-- 페이징 처리 -->
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="noticelistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="noticelistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxpage}">
		<a href="noticelistpaging?page=${paging.page+1}">[다음]</a>
	</c:if>

</body>
</html>