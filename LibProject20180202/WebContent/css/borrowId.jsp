<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/borrow.css">
<meta charset="UTF-8">
</head>
<body>
<form action="borrowid.member" method="post">
<h1>대 출</h1>

	<div class="container">
		<img src="images/am.png">
		
			<div class="form-input">
				<input type="text" name="id" required="required" placeholder="ID를 입력하세요">
			</div>
			<input type="submit" name="searchbutton" value="확인" class="btn-do" onclick=""><br>
	</div>
	
	<c:choose>
	<c:when test="${idcheck eq 'false'}">
		<script type="text/javascript">
		       alert("아이디를 다시 확인해주세요.");
		</script>
    </c:when>

 
	</c:choose>

	
	
	</form>
</body>
</html>