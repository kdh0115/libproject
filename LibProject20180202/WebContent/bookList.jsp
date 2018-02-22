<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/List.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 도서관 도서 전체출력</title>
</head>
<style>
	#ulTable{
	position: absolute;
	top: 300px;
	left : 260px;
	color: white;
	}
	#ululTable{
	position: absolute;
	top: 350px;
	left : 250px;
	color: white;
	}
</style>

<body>
<h1>도서목록</h1>
	<div class="container">
	<table  id="ulTable" width="1400px" border='0' cellspacing='0' cellpadding='0'>
	
	
	<tr>
		<td>등록번호</td>
		<td>도서명</td>
		<td>저자</td>
		<td>도서이미지</td>
		<td>출판일</td>
		<td>출판사</td>
		<td>페이지</td>
		<td>도서상태</td>
	</tr>
			
	<c:forEach var="book" items="${bookList }"> 
		<tr>
			<td>${book.registNum }</td>
			<td>${book.title }</td>
			<td>${book.author }</td>
			<td>${book.icon }</td>
			<td>${book.publishing }</td>
			<td>${book.publisher }</td>
			<td>${book.bookPage }</td>
			<td>${book.state }</td>
		</tr>
	</c:forEach>

	</table>
</div>
	<a href='bookManage.jsp'>이전으로</a>

</body>
</html>