<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>Insert title here</title>
<script>
	var mid ="admin";
	function ggymcheck(comnumber){
		$.ajax({
			type : "post",
			url : "ggymcheck",
			data : {"mid" : mid,"comnumber" : comnumber},
			dataType : "text",
			success : function(result){
				if(result =="on")
					{output = "<i class='fas fa-star'></i>"
					}
				else
					{output = "<i class='far fa-star'></i>"
					}
				$("#ggymcheck").html(output);
			},
			error : function(){
			}
		});
	};

</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>지점번호</th>
			<th>자점명</th>
			<th>지점 회사</th>
			
		</tr>
		<c:forEach var="clist" items="${commemberlist}" >
			<tr>
				<td>${clist.comnumber}</td>
				<td>${clist.comoffice}</td>
				<td>${clist.company}</td>
				<td>
				<a onclick="ggymcheck('${clist.comnumber}')" id="ggymcheck"><i class="far fa-star"></i></a></td>
			</tr>
			
		</c:forEach>
	</table>
	

	<!-- 페이징 처리 -->
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="commemberlistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="commemberlistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxpage}">
		<a href="commemberlistpaging?page=${paging.page+1}">[다음]</a>
	</c:if>
</body>
</html>