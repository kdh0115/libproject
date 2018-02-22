<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Member_List.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
	#ulTable{
	position: absolute;
	top: 300px;
	left : 600px;
	color: white;
	}
</style>

<body>
<h1>회원목록</h1>
	<div class="container">
	<table  id="ulTable" width="800px" border='0' cellspacing='0' cellpadding='0'>
	
	
	<tr>
		<td>ID</td>
		<td>이름</td>
		<td>생년월일</td>
	</tr>
			
<c:forEach var="memberlist" items="${memberList }">
		<tr>
			<td>${memberlist.id }</td>
			<td>${memberlist.irum }</td>
			<td>${memberlist.birth }</td>
		</tr>
	</c:forEach>

	</table>
</div>
	<a href='index.jsp'>이전으로</a>

</body>
</html>