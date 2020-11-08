<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>공지사항, 찜, 알림</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	function noticelist(){
		location.href="noticelist";
	}
	
	function ggymlist(){
		location.href="ggymlist";
	}
	
	function echogo(){
		location.href="echogo";
	}

	function cookiecheck(){
		alert(document.cookie);
	}
	
</script>
</head>
<body>
	<div id="cookieid"></div>
	<button onclick="noticelist()">공지사항 리스트</button>
	<button onclick="ggymlist()">찜 리스트</button>
	<button onclick="echogo()">실시간 채팅가기</button>
	<button onclick="location.href='memberinsertpick'">회원가입</button>
	<button onclick="location.href='loginpick'">로그인</button>
	<button onclick="location.href='commemberlistpaging'">지점리스트</button>
	<button onclick="cookiecheck()">쿠키 확인</button>
	
	<script>
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
		 	 //
		 	 if(end == -1) // 탐색하려는 문자열이 없다면 
			 	end = cookieData.length; //36
		 
			 cValue = cookieData.substring(start, end);  
			 	//							9		36  : 9~35
			 /*
			 	string.substring(from,to)
			  	문자열에서 특정 부분만 골라낼 때 사용
				 var str = '123456789';
				document.write( str.substring( 1, 4 ) );
				값 : 234 -> 1~3까지 
				
				from과 to 모두 index 0부터 시작하는 위치 값을 가진다.
				from이 to 보다 작으면 from부터 to사이의 문자열을 리턴한다. from 부터 to-1 까지
				from이 to 보다 크면 to부터 from 사이의 문자열을 리턴한다.
				from과 to가 같으면 빈문자열을 리턴한다.		 
				
				
				
			 */
		 	}
		 return unescape(cValue);
	 }
	 /* 
	  indexOf : 문자열에서 특정한 문자열의  인덱스 값을 반환한다
	     탐색하려는 문자열이 존재하지 않으면 -1 반환
	     
	  stringValue.indexOf(searchValue[,fromIndex])
	  
	  searchValue - String, 필수, 탐색하고 싶은 문자열
	  fromIndex - Integer(0<fromIndex<stringValue.length-1), 옵션
	  
	  var stringValue = '생활코딩 - 자바스크립트 레퍼런스';
	  alert(stringValue.indexOf('생활')); // 0
	     처음 발견된 위치에 있는 index값 리턴
	  
	  alert(stringValue.indexOf('코딩')); // 2
	  */
	</script>
</body>
</html>