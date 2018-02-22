<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/List.css">
<style type="text/css">
#ulTable {
	position: absolute;
	top: 300px;
	left: 400px;
	color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>대출현황</h1>
	<div class="container">
		<table id="ulTable" width="1000px" border='0' cellspacing='0' cellpadding='0'>
			<tr style="font-size: 20px; height: 50px">
				<th>도서명</th>
				<th>저자</th>
				<th>등록번호</th>
				<th>대출일</th>
				<th>반납예정일</th>
				<th>연장횟수</th>
			</tr>
			<c:forEach var="borrow" items="${borrowList }">
				<tr>
					<td>${borrow.title }</td>
					<td>${borrow.author }</td>
					<td>${borrow.registNum }</td>
					<td>${borrow.givedate }</td>
					<td>${borrow.takedate }</td>
					<td>${borrow.extension }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<a href='index.jsp'>이전으로</a>
</body>
</html>