<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Delete.css">

<script type="text/javascript">
function deleteCheck() {
	var deletecheck = confirm("삭제하시겠습니까?");
	if(deletecheck == 1){
		document.frmDelete.submit();
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 중앙도서관 도서삭제</title>
</head>
<body>
<h1>도서삭제</h1>
	<div class="container">
<form name="frmDelete" action="bookDelete.book" method="post">
		<img src="images/am.png">

			<div class="form-input">
				<input type="text" name="title" placeholder="도서명 입력">
			</div>
			<div class="form-input">
				<input type="text" name="author" placeholder="저자 입력">
			</div>
			<input type="submit" name="success" value="삭제" class="btn-do" onclick="deleteCheck()"><br>
	
			<a href="bookManage.jsp">이전으로</a>
		</form>
	</div>
</body>
</html>