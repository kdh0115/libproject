<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/borrowwwww.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

.container{
	width: 500px;
	height: 400px;
	text-align: center;
	background-color: black;
	opacity: 0.7;
	border-radius: 5%;
	margin: 0 auto;
	margin-top: 280px;
}
.form-input [type="text"], input[type="password"]{
	position:relative;
	top: 50px;
    left:0px;
	height: 25px;
	width: 200px;
	font-size: 18px;
	margin-bottom: 20px;
	background-color: #fff;
	padding-left: 20px;
	
}
.btn-do{
	position:relative;
	top: 75px;
    left: 0px;
	padding: 25px 25px;
	color: black;
	border: none;
	opacity: 0.7;
	border-bottom: 4px solid black;
	margin-bottom: 20px;
	font-weight: bold;
	border-radius: 10%;
}
a{
	position:relative;
	top: -35px;
    left: -10px;
	color: #fff;
}
h1{
	position : fixed;
	top: 145px;
	left: 900px;
	font-size: 45px;
	color: white;
}
#tb001{
		position: fixed;
		top: 630px;
		left: 1050px;
	
	}

</style>
<title>Insert title here</title>
</head>

<body>
<form action="retrun.borrow" method="post">
<h1>반 납</h1>
	<div class="container">
		<img src="images/am.png">
			<div class="form-input">
				<input type="text" name="registernum" required="required" placeholder="등록번호를 입력하세요.">
			</div>
			<input type="submit" name="success" value="확인" class="btn-do" onclick=""><br>
	</div>
	<table id="tb001">
		<tr>
			<td><a href="#">홈으로</a></td>
			<td><a href="#">이전으로</a></td>
		</tr>
	
	</table>
	
	<c:choose>
	<c:when test="${check eq 'false'}">
		<script type="text/javascript">
		       alert("도서 등록 번호를 확인해 주세요.");
		</script>
    </c:when>
    <c:when test="${bookstate eq 'true'}">
        <script type="text/javascript">
		       alert("대출가능 도서입니다. 도서반납이 불가능합니다.");
		</script>
    </c:when>
    
	</c:choose>
	
	
	
	
	
</form>
</body>
</html>