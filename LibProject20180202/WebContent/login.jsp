<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 도서관 로그인</title>
</head>
<body>
<form id="login_tul" action="login.member" method="post">

<h1>Login</h1>
	<div class="container">
		<img src="images/am.png">
			<div class="form-input">
				<input type="text" name="id" placeholder="ID를 입력하세요">
			</div>
			<div class="form-input">
				<input type="Password" name="pw" placeholder="패스워드를 입력하세요">
			</div>
			<input type="submit" name="success" value="로그인" class="btn-do" onclick=""><br>
	
			<a href="memberRegister.jsp">회원가입</a>&nbsp;&nbsp;
			<a href="index.jsp?page=membersearch">비밀번호 찾기</a>&nbsp;&nbsp;
			<a href="index.jsp">홈으로</a>
			
	</div>

	<c:choose>
	<c:when test="${loginIdCheck eq 'false'}">
		<script type="text/javascript">
		       alert("존재하지 않는 아이디입니다.");
		</script>
    </c:when>
    <c:when test="${login eq 'false'}">
        <script type="text/javascript">
		       alert("비밀번호를 다시 확인해주세요");
		</script>
    </c:when>
    <c:when test="${loginDeleteCheck eq 'true'}">
        <script type="text/javascript">
		       alert("탈퇴한 아이디입니다.");
		</script>
    </c:when>
	</c:choose>
	
	</form>
</body>
</html>