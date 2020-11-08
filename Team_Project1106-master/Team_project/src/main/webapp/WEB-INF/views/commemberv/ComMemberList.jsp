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

	var ggymcheckNum = null;
	
	function ggymcheck(comnumber){
		$.ajax({
			type : "post",
			url : "ggymcheck",
			data : {"mid" : mid,"comnumber" : comnumber},
			dataType : "text",
			success : function(result){
				if(result =="on")
					{ggymcheckNum = 1;
					}
				else
					{ggymcheckNum = 0;
					}
			},
			error : function(){
			}
		});
	};
	

</script>
</head>
<body>
	<div id="cookieid"></div>
	<table border="1">
		<tr>
			<th>지점번호</th>
			<th>자점명</th>
			<th>지점 회사</th>
			
		</tr>
		<c:forEach var="clist" items="${comlist}" >
			<tr>
				<td>${clist.comnumber}</td>
				<td>${clist.comoffice}</td>
				<td>${clist.company}</td>
				
				<c:choose>
				
					<c:when test= "${sessionScope.loginid ne null}">
						<c:when test = ${ggymcheckNum == 1}>
							<td>
							<a onclick="ggymcheck('${clist.comnumber}')" id="ggymcheck"><i class="far fa-star"></i></a>
							</td>
						</c:when>
						<c:otherwise>
							<td>
							<a onclick="ggymcheck('${clist.comnumber}')" id="ggymcheck"><i class="fas fa-star"></i></a>
							</td>
						</c:otherwise>
					</c:when>
					
					<c:otherwise>
					</c:otherwise>
				</c:choose>
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
	<script>
// 	회원 ID와 지점 번호로 찜 여부 판단
	var cookieidvalue = getCookie("userinfo"); 
	document.getElementById("cookieid").innerHTML = cookieidvalue;

	//쿠키 가져오기 함수
	function getCookie(cName) {
		 cName = cName + '=';
		 // userinfo= /9   0~8
		 var cookieData = document.cookie;
		 // 모든 쿠키 호출
		 var start = cookieData.indexOf(cName);
		 // userinfo의 인덱스 위치 찾음 /0
		 var cValue = ''; // 값 선언
		 if(start != -1) // 탐색하려는 문자열이 존재한다면 
		 	{start += cName.length; //0+9 =9
		 	 var end = cookieData.indexOf(';', start);
		 							//	 ;를          0부터	 9미만 까지 찾겠다
		 	 if(end == -1) // 탐색하려는 문자열이 없다면 
			 	end = cookieData.length; //36
			 cValue = cookieData.substring(start, end);  
		 	}
		 return unescape(cValue);
	}
		
	
	</script>
</body>
</html>