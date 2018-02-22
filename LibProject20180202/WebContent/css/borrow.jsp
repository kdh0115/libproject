<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#tb001{
		position: fixed;
		top: 550px;
		left: 1000px;
	
	}

</style>
<link rel="stylesheet" type="text/css" href="css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>대 출</h1>
<form action="register.borrow" method="post">
	<div class="container">
		<img src="images/am.png">
			<div class="form-input">
				<input type="text" name="id" readonly="readonly" value=${memberDTO.id }>
			</div>
			<div class="form-input">
				<input type="text" name="registernum" required="required" placeholder="등록번호를 입력하세요.">
			</div>
			<input type="submit" name="success" value="확인" class="btn-do" onclick=""><br>
	</div>
	<table id="tb001">
		<tr><td><a href="template.jsp">홈으로</a></td>
			<td><a href="borrowId.jsp">이전으로</a></td>
			<td><a href="borrowManage.jsp">대출/반납</a></td>
		</tr>
	</table>


	<c:choose>
	<c:when test="${check eq 'false'}">
		<script type="text/javascript">
		       alert("도서 등록 번호를 확인해 주세요.");
		</script>
    </c:when>
    <c:when test="${bookstate eq 'false'}">
        <script type="text/javascript">
		       alert("도서가 대출 중입니다.");
		</script>
    </c:when>
    
	</c:choose>

		</form>
</body>
</html>