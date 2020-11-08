<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress").focus();
					}
				}).open();
	}
	function memberjoin(){
		var inputId = document.getElementById("mid").value;
		var pwd = document.getElementById("mpassword").value;
		var name = document.getElementById("mname").value;
		var pwdch = document.getElementById("mpasswordch").value;
		var address = document.getElementById("sample6_address").value;
		var phone = document.getElementById("mphone").value;
		var email = document.getElementById("memail").value;
		var gender = document.getElementById("mgender").value;
		var birth = document.getElementById("mbirth").value;
		if(inputId.length < 5){
	    	 alert("아이디를 5글자 이상 입력해주세요.");
	    	 document.getElementById("mid").focus();
	        return false;
	     }else if(pwd.length < 8){
	    	 alert("비밀번호를 입력해주세요. ex) ASas!@12");
	    	 document.getElementById("mpassword").focus();
	        return false;
	     }else if(pwdch.length < 8){
	    	 alert("비밀번호체크를  입력해주세요.");
	    	 document.getElementById("mpasswordch").focus();
	        return false;
	     }else if(name.length == 0){
	    	 alert("이름을 입력해주세요.");
	    	 document.getElementById("mname").focus();
	        return false;
	     }else if(address.length == 0){
	    	 alert("주소를 입력해주세요.");
	    	 document.getElementById("maddress").focus();
	        return false;
	     }else if(phone.length < 12){
	    	 alert("전화번호를 입력해주세요.");
	    	 document.getElementById("mphone").focus();
	        return false;
	     }else if(email.length == 0){
	    	 alert("이메일을 입력해주세요.");
	    	 document.getElementById("memail").focus();
	        return false;  
	     }  var chk_radio = document.getElementsByName('mgender');

			var sel_type = null;

			for(var i=0;i<chk_radio.length;i++){

				if(chk_radio[i].checked == true){ 

					sel_type = chk_radio[i].value;

				}

			}



			if(sel_type == null){
			
				alert("성별을 선택해주세요.");	
				return false;

			

			}else if(birth.length < 9){
	    	 alert("생년월일을 선택해주세요.");
	    	 document.getElementById("mbirth").focus();
      		return false;
    	 }  else {
    		 memberinsertform.submit();
    	 }
	}
	function idOverlap() {
		var inputId = document.getElementById("mid").value;
		// ajax(Asynchronous javascript and XML)
		// JSON(JavaScript Object Notation)
		if (inputId.length > 4) {
			$.ajax({
				type : "post",
				url : "idoverlap",
				data : {
					"mid" : inputId
				},
				dataType : "text",
				success : function(result) {
					if (result == "OK") {
						eqMsg.style.color = "green";
						eqMsg.innerHTML = "멋진 아이디군요.";
						return true;
					} else {
						eqMsg.style.color = "red";
						eqMsg.innerHTML = "이미 사용된 ID 입니다.";
						return false;
					}
				},
				error : function() {
					alert("ajax 실패");
				}
			});
		}else{
			eqMsg.style.color = "red";
			eqMsg.innerHTML = "아이디는 5글자 이상 입력해주세요.";
		}
	}
	function disappear() {
		document.getElementById("eqMsg").innerHTML = "";
	}
	function pwdCh(){
        var exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
        var pwd = document.getElementById("mpassword").value;
        if(pwd.match(exp)){
        	eqMsg2.style.color = "green";
        	eqMsg2.innerHTML = "멋있는 비밀번호네요.";
            return true;
        }else{
        	eqMsg2.style.color = "red";
        	eqMsg2.innerHTML = "비밀번호형식이 맞지않습니다.";
            return false;
        }
    }
	function disappear2() {
		document.getElementById("eqMsg2").innerHTML = "";
	}
	function pwdMatch() {
		var pwd = document.getElementById("mpassword").value;
		var pwdch = document.getElementById("mpasswordch").value;
		if(pwd == pwdch){
			eqMsg3.style.color = "green";
        	eqMsg3.innerHTML = "비밀번호가 일치합니다.";
        	return true;
		}else{
			eqMsg3.style.color = "red";
        	eqMsg3.innerHTML = "비밀번호가 다릅니다.";
        	return false;
		}
	}
	function disappear3() {
		document.getElementById("eqMsg3").innerHTML = "";
	}
	function phoneCh(){
		var exp = /^\d{3}-\d{4}-\d{4}$/;
        var phone = document.getElementById("mphone").value;
        if(phone.match(exp)){
        	eqMsg4.style.color = "green";
        	eqMsg4.innerHTML = "전화번호 형식이 일치합니다.";
           return true;
        }else{
        	eqMsg4.style.color = "red";
        	eqMsg4.innerHTML = "전화번호 형식이 맞지 않습니다.";
            return false;
        }
	}
	function disappear4() {
		document.getElementById("eqMsg4").innerHTML = "";
	}
	function birthCh(){
		var birth = document.getElementBy("mbirth").value;
		if(birth.length == 0){
			return false;
		}else{
			return true;
		}
	}
</script>
</head>
<body>
	<fieldset>
		<form action="memberinsert" method="post" name="memberinsertform">
			<label for="mid">아이디</label><br> 
			<input type="text" id="mid" name="mid" onkeyup="idOverlap()" onblur="disappear()"><span id="eqMsg"></span><br> 
			<label for="mpassword">비밀번호</label><br>
			<input type="password" id="mpassword" name="mpassword" onkeyup="pwdCh()" onblur="disappear2()"><span id="eqMsg2"></span><br>
			<label for="mpasswordch">비밀번호체크</label><br> 
			<input type="password" id="mpasswordch" name="mpasswordch" onkeyup="pwdMatch()" onblur="disappear3()"><span id="eqMsg3"></span><br>
			<label for="mname">이름</label><br> 
			<input type="text" id="mname" name="mname" onkeyup="nameCh()"><br> 
			<input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" name="sample6_address" placeholder="주소" ><br> 
			<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소"><br> 
			<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목"><br> 
			<label for="mphone">전화번호</label><br>
			<input type="text" id="mphone" name="mphone" onkeyup="phoneCh()" onblur="disappear4()"><span id="eqMsg4"></span><br> 
			<label for="memail">이메일</label><br> 
			<input type="email" id="memail" name="memail"><br>
			<label id="mgender1">성별</label><br> 
			<input type="radio" id="mgender" name="mgender" id="male" value="male">남자 
			<input type="radio" id="mgender" name="mgender" id="femele" value="femele">여자<br> 
			<label for="mbirth">생년월일</label><br> 
			<input type="date" id="mbirth" name="mbirth" onkeyup="birthCh()"><br>
		</form>
		<br>
		<button onclick="memberjoin()">회원가입</button>
	</fieldset>
</body>
</html>