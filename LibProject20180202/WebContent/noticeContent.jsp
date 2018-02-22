<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div#content5{
position: absolute;
left: 580px;
top:60px;
width: 950px;
height: 700px;
}
#tl01{
	background-color: #c0c0c0;
	text-align: center;
}
tr{
height: 40px;
}
textarea{
font-size: 17px;
}
#del01{
position: absolute;
left: 145px;
top: 668px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id=content5>
<h1>서평</h1>
<form action="noticeUpdate.notice" method="post">
<table>
 	<tr><td><input type="hidden" name="no" value="${noticeDTO.no }"></td></tr>
 <tr>
 	<td id="tl01"><label for="제목">제목</label></td>
 	<td><input type="text" name="title" size="50" value="${noticeDTO.title }"></td>
 	</tr>
 	<tr>
 	<td id="tl01"><label for="작성자">작성자</label></td>
 	<td><input type="text" name="author" size="50" value="${noticeDTO.author }"></td>
 	</tr>
 	<tr>
 	<td id="tl01"><label for="내용">내용</label></td>
 	<td><textarea rows="20" cols="80" name="content">${noticeDTO.content }</textarea></td>
 	</tr>
 	<tr>
 		<td id="tl01"><label for="날짜">날짜</label></td>
 		<td><input type="text" name="nal" value="${noticeDTO.nal }"></td>
 	</tr>
 	<tr>
 	<c:choose>
 	<c:when test="${sessionScope.id==noticeDTO.author }">
 	<td><input type="submit" value="수정하기"></td>
 	</c:when>
 	</c:choose>
	<td><a href="noticeList.notice">목록으로</a></td> 	
	</tr>
	</table>
	</form>
<form id="del01" action="noticeDelete.notice" method="post">
<table>
<tr>
<c:choose>
<c:when test="${sessionScope.id==noticeDTO.author }">
<td><input type="hidden" name="no" value="${noticeDTO.no }"></td>
<td><input type="submit" value="삭제하기"></td>
</c:when>
</c:choose>
</tr>
</table>
</form>
</div>
</body>
</html>