<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Update.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 중앙도서관 도서수정</title>
</head>
<body>
 <form action="bookUpdateConfirm.book" method="post">
<h1>도서수정</h1>
	<div class="container">
	
		<img src="images/am.png">

			<div class="form-input">
				<input type="text" name="title" placeholder="도서명 입력">
			</div>
			<div class="form-input">
				<input type="text" name="author" placeholder="저자 입력">
			</div>
			<input type="submit" name="success" value="수정" class="btn-do" onclick=""><br>
	
			<a href="bookManage.jsp">이전으로</a>
	</div>
	
	<c:choose>
	<c:when test="${bookcheck eq 'false'}">
		<script type="text/javascript">
		       alert("도서를 다시 확인해주세요");
		</script>
    </c:when>

 
	</c:choose>
	
	
	
		</form>
</body>
</html>