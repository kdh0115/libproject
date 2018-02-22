<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/member.css" /> -->
<style type="text/css">
/* 초기화 */



#lib_background{
	margin: 0 auto;
	background-image: url("images/lib4-1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}

#lib_background #lib_h1 {
	position: relative;
	color: white;
    margin: auto;
    margin-top: 10%;
    margin-bottom: 2%;
    text-align: center;
}

#lib_background #lib_container{
	position: relative;
	width: 650px;
	background-color: black;
	opacity: 0.7;
	border-radius: 5%;
	margin: 0 auto;
	padding: 3% 7%;
}

#lib_background #lib_container #lib_table {
	position: relative;
	margin: auto;
	color: white;
	width: 650px;
}

</style>
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	//------------아이디
	function checkId() {
		
		//console.log("ok");
		var ckId = $("#id").val();
		var ckIdOk = ckId.replace(/ /gi, ""); //공백제거
		if ($("#id").val().length <= 1) {//아이디는 2자 이상
			document.getElementById('idch').innerHTML = '아이디는 2자 이상 입력하세요';
		} else if(ckId != ckIdOk){
			$("#id").val("");
			document.getElementById('idch').innerHTML = '공백은 입력하실 수 없습니다';
  		} else if(ckIdOk.length > 15){
			$("#id").val("");
			document.getElementById('idch').innerHTML = '아이디는 15자 이내로 입력하세요';
		} else { //아이디 중복확인
			$.ajax({
				type : 'POST',
				url : "idcheck.member",
				data : {
					id : ckIdOk
				},
				success : function(resultData) {
					if (resultData.trim() == "NO") {
						document.getElementById('idch').innerHTML = '이미 사용중인 아이디입니다';
						$("#idch").show();
						$("#id").val("");
					} else {
						$("#idch").show();
						document.getElementById('idch').innerHTML = '사용가능한 아이디입니다';
					}
				}
			});
		}
	}
	
	//------------비밀번호
	function isSame() {
		
		var pwCh = $("#pw").val();
		var pwChOk = pwCh.replace(/ /gi, ""); //공백제거
		
		document.getElementById('same').style.color = 'white';
  		if(pwCh != pwChOk){
			$("#pw").val("");
			document.getElementById('same').innerHTML = '공백은 입력하실 수 없습니다';
  		} else if((pwCh.length < 3 || pwCh.length > 20)&&document.getElementById('pw').value != ''){
			$("#pw").val("");
			document.getElementById('same').innerHTML = '비밀번호는 3~20자로 하십시오';
		} else if (document.getElementById('pw').value != ''
					&& document.getElementById('pwch').value != '') {
			if (document.getElementById('pw').value == document
					.getElementById('pwch').value) {
				document.getElementById('same').innerHTML = '비밀번호가 일치합니다';
			} else {
				document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다';
				document.getElementById('same').style.color = 'red';
			}
		}
	}

	//------------이름 수정 중, 유효성 검사 확인해야함 
	function checkIrum() {
		var irumCk = $("#irum").val();
		var irum = irumCk.replace(/ /gi, ""); //공백제거
			$("#irumCheck").show();
		if (irumCk.length <= 1 || irumCk.length > 10) {// 이름은 2 ~ 10자
			$("#irum").val("");
			document.getElementById('irumCheck').innerHTML = '이름은 2 ~ 10자 입력하세요';
		} else if(irum != irumCk){//공백확인
			$("#irum").val("");
			document.getElementById('irumCheck').innerHTML = '공백은 입력하실 수 없습니다';
		} else if(document.getElementById('irum').value != ''){//이름 유효성 검사, 한글, 영문 대소문자만
			var regNm = /^[가-힣]{2,10}|[a-zA-Z]{2,10}$/; // 이름 유효성 검사식
			if(!regNm.test($("#irum").val())) {
				$("#irum").val("");
				document.getElementById('irumCheck').innerHTML = '한글,영문 대소문자만 사용 가능합니다';
			}else{//모든 조건을 만족하면 경고문 숨김
				$("#irumCheck").hide();
			}
		}
	}
	//------------전화번호 키보드를 뗐을때,
	function telCheck() {
		//들어오는 형식, ###-###-####, ###-####-####
		/* var tel2Sub = $("#tel2").val().substring(0,4); //4자리 이상 들어오면 뒷자리 짜름
		var tel3Sub = $("#tel3").val().substring(0,4); */
		$("#telCheck").show();
		if (isNaN($("#tel2").val())) {//tel2 숫자만 받아옴
			$("#tel2").val("");
			document.getElementById('telCheck').innerHTML = '숫자만 입력하세요';
		} else if(isNaN($("#tel3").val())) {// tel3 숫자만 받아옴
			$("#tel3").val("");
			document.getElementById('telCheck').innerHTML = '숫자만 입력하세요';
		} else {
			/* $("#tel2").val(tel2Sub);
			$("#tel3").val(tel3Sub); */
			$("#telCheck").hide();
		}
	}
	
	//------------전화번호 tel2은 3~4 받아오게
	function telValue2() {
		var regTel=/([0-9]{3,4})$/;
		if(!(regTel.test($("#tel2").val()))) {
			$("#tel2").val("");
			$("#telCheck").show();
			document.getElementById('telCheck').innerHTML = '3 ~ 4자리를 입력하세요';
		} else{
			$("#telCheck").hide();
		}
	}
	
	//------------전화번호 tel3는 4자리 받아오도록
	function telValue3() {
		var regTel=/([0-9]{4,4})$/;
		if(!(regTel.test($("#tel3").val()))) {
			$("#tel3").val("");
			$("#telCheck").show();
			document.getElementById('telCheck').innerHTML = '4자리를 입력하세요';
		}
		else{
			$("#telCheck").hide();
		}
	}

	//------------이메일 직접입력과 선택 구분
	function checkemailaddy(){
		if (member_Register_Form.email_select.value == '1') {
			member_Register_Form.email2.readonly = false;
			member_Register_Form.email2.value = '';
			member_Register_Form.email2.focus();
		}
		else {
			member_Register_Form.email2.readonly = true;
			member_Register_Form.email2.value = member_Register_Form.email_select.value;
		}
	}
	
	//------------이메일 유효성 검사
	function checkemailvalue() {
		if (document.getElementById('email2').value != '') {
			var regex=/((\[[a-z]{1,3}\.[a-z]{1,3}\.[a-z]{1,3}\.[a-z]{1,3}\])|(([a-z]+\.)+[a-z]{2,3}))$/;
			// 이메일 유효성 검사식, *.com, *.co.kr 같은 형식만 받도록 함
			
			if(!(regex.test($("#email2").val()))) {
				$("#email2").val("");
				$("#emailCheck").show();
				document.getElementById('emailCheck').innerHTML = '이메일을 다시 확인해주세요';
			}else{
				$("#emailCheck").hide();
			}
		}
	}
	
	//------------생년월일
	
	/* function checkBirth() {

		//$("#tel3").val("");
		
		var birthCk = $("#birth1").val();
		if (isNaN(birthCk)) {
			$("#birth1").val("");
			document.getElementById('birthCheck').innerHTML = '숫자만 입력하세요';
		} else {
			if(!(birthCk>=1900 && birthCk<=2018)) { // 1900~2018년도 사이로 입력
				$("#birth1").val("");
				document.getElementById('birthCheck').innerHTML = '생년월일을 다시 확인해주세요';
			}
		}
	} */
	
	function checkYear() {//년을 선택할 때마다 초기화
		$("#birth2").val("");
		$("#birth3").val("");
	}

	function checkMonth() {//월에 따라 일 변경
		
		var birth1 = $("#birth1").val();
		var birth2 = $("#birth2").val();
		$("#birth3").val("");
		var lastDay = ( new Date( birth1, birth2, 0) ).getDate(); //년,월에 따라 일 계산
		if (lastDay == "" && lastDay == null) {return;}//계산이 되지 않으면 돌아가도록
		
		var bb ="";
		for(var i=1; i<=lastDay; i++) {
			bb += '<option value="'+i+'">'+i+'</option>';
		}
		var dd = '<select name="birth3" id="birth3" required="required">'
			+'<option value="" selected>일</option>'
			+bb+'</select>';
	    $('.change_greeting3').html(dd);
	}

	$(function(){
		var nowyear = new Date().getFullYear();//올해 연도 계산
		var bb ="";
		for(var i=nowyear; i>=nowyear-100; i--) {//역순으로 년도 출력
			bb += '<option value="'+i+'">'+i+'</option>';
		}
		var yy = '<select name="birth1" id="birth1" required="required" onchange="checkYear()">'
			+'<option value="" selected>년 </option>'
			+bb+'</select>';
			
		var bb ="";
		for(var i=1; i<=12; i++) {
			bb += '<option value="' +i + '">'+i+'</option>';
		}
		var mm = '<select name="birth2" id="birth2" required="required" onchange="checkMonth()">'
			+'<option value="" selected>월</option>'
			+bb+'</select>';
			
		var dd = '<select name="birth3" id="birth3" required="required">'
			+'<option value="" selected>일</option>'
			+'</select>';
		
	    $('.change_greeting1').html(yy);//해당 클래스를 ()안의 내용으로 변경
	    $('.change_greeting2').html(mm);
	    $('.change_greeting3').html(dd);
	});
	
	//------------버튼 연결
	function memberRegisterClick() {
		location.href = "index.jsp";
	}

	//------------프로필 사진을 선택하는 즉시 사진 나오도록 만듬
	function memberPreviewFile() {
		var preview = document.querySelector('img#img_change_member_Regi');
		var file = document.querySelector('input[type=file]').files[0];
		var reader = new FileReader();

		reader.onloadend = function() {
			preview.src = reader.result;
		}
		if (file) {
			reader.readAsDataURL(file);
		} else {
			preview.src = "";
		}
	}

	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 도서관 회원가입</title>
</head>
<body id="lib_background">
	<h1 id="lib_h1">회원 가입</h1>
	<form action="register.member" method="post" name="member_Register_Form" enctype="multipart/form-data">
	
		<div id="lib_container">

		<table id="lib_table">
			<tr>
				<td align="center"><label for="아이디">아 이 디</label></td>
				<td><input type="text" id="id" name="id" required="required"
					placeholder="아이디입력" onchange="checkId()">
				<br><span id="idch"></span></td>
				
				<td rowspan="7"><img src="" id="img_change_member_Regi" height="200px" width="200px" alt="이미지를 추가하세요"></td>

			</tr>

			<tr>
				<td align="center"><label for="패스워드">패스워드</label></td>
				<td><input type="password" id="pw" name="pw"
					required="required" placeholder="패스워드 입력" onchange="isSame()"></td>
			</tr>

			<tr>
				<td align="center"><label for="패스워드확인">패스워드 확인</label></td>
				<td><input type="password" id="pwch" name="pwch"
					required="required" placeholder="패스워드 다시 입력" onchange="isSame()">
				<br><span id="same"></span></td>
			</tr>
			<tr>
				<td align="center"><label for="이름">이름</label></td>
				<td><input type="text" id="irum" name="irum" required="required"
					placeholder="이름 입력" onchange="checkIrum()">
				<br><span id="irumCheck"></span></td>
			</tr>
			
			<tr>
				<td align="center" valign="middle"><label
					for="프로필 사진">프로필 사진</label></td>
				<td><input type="file" name="icon"
					accept=".jpg, .jpeg, .png, .gif" onchange="memberPreviewFile()">
				</td>

			</tr>
			
			<tr>
				<td align="center"><label for="생년월일">생년월일</label></td>
				<td>
					<div class="change_greeting1" style="display: inline;"></div>
					<div class="change_greeting2" style="display: inline;"></div>
					<div class="change_greeting3" style="display: inline;"></div>
				<br><span id="birthCheck"></span></td>
			</tr>
			
			<tr>
				<td align="center"><label for="전화번호">전화번호</label></td>
				<td>
				<select name="tel1" required="required">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				<input type="text" name="tel2" id="tel2" size="5" maxlength="4" required="required" placeholder="0000" onkeyup="telCheck()" onChange="telValue2()">
				<input type="text" name="tel3" id="tel3" size="5" maxlength="4" required="required" placeholder="0000" onkeyup="telCheck()" onChange="telValue3()">
				<br><span id="telCheck"></span>			
				</td>
			</tr>
			<tr>
				<td align="center"><label for="이메일">이 메 일</label></td>
				<td colspan="2">
					<input name="email1" type="text" class="box" id="email1" size="12" required="required"> @ 
					<input name="email2" type="text" class="box" id="email2" required="required" size="10" onChange="checkemailvalue()">
					<select name="email_select" class="box" id="email_select" required="required" onChange="checkemailaddy()">
						<option value="" selected>::선택하기::</option>
						<option value="naver.com">네이버</option>
						<option value="hanmail.net">한메일</option>
						<option value="daum.net">다음</option>
						<option value="gmail.com">G메일</option>
						<option value="nate.com">네이트</option>
						<option value="hotmail.com">핫메일</option>
						<option value="1">::직접입력::</option>
					</select>
					<br><span id="emailCheck"></span>
				</td>
			</tr>

			<tr>
				<td colspan="3"><label for="정보수신허용">이메일 수신허용</label>
				<select name="emailcheck">
						<option value="yes">예</option>
						<option value="no">아니오</option>
				</select>

				<label for="sms수신허용">sms수신허용</label>
				<select name="smscheck">
					<option value="yes">예</option>
					<option value="no">아니오</option>
				</select></td>
			</tr>

			<tr>
				<td colspan="3" align="center" height="30px">
					<input type="submit" value="회원가입" width="100px">
					<input type="reset" src="images/Reset.png" width="100px">
					<input type="button" value="홈으로" onclick="memberRegisterClick()">
				</td>
			</tr>
		</table>
</div>
	</form>
</body>
</html>