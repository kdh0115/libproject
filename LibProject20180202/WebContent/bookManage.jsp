<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<link rel="stylesheet" type="text/css" href="css/Manage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 중앙도서관 도서관리</title>
</head>
<body>

	<h1>관리자 전용</h1>
	
<div class="container">
		<table>
	<tr>
	<td class="registertd">
		<form action="bookRegister.jsp" method="post">
			<input type="submit" value="도서등록" class="btn-do">
		</form>
	</td>
	
	<td class="updatetd">
		<form action="bookUpdate.jsp" method="post">
			<input type="submit" value="도서수정" class="btn-do">
		</form>
	</td>
	
	<td class="deletetd">		
		<form action="bookDelete.jsp" method="post">
			<input type="submit" value="도서삭제"  class="btn-do">
		</form>
	</td>
	<td class="listtd">
		<form action="bookList.book" method="post">
			<input type="submit" value="도서출력" class="btn-do">
		</form>
	</td>
	
	<td class="searchtd">
		<form action="bookSearch.jsp" method="post">
			<input type="submit" value="도서검색" class="btn-do">
		</form>
	</td>
	
	<td class="backtd">
	 <form action="index.jsp" method="post"> 
			<input type="submit" value="이전으로" class="btn-do">
		</form>
	</td>
	</tr>
	</table>
	</div>

</body>
</html>