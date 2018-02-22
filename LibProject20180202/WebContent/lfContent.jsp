<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div#content6{
position: absolute;
left: 580px;
top:60px;
width: 950px;
height: 700px;
}
#tm01{
	background-color: #c0c0c0;
	text-align: center;
}
tr{
height: 40px;
}
textarea{
font-size: 17px;
}
#del02{
position: absolute;
top: 742px;
left: 140px;

}
</style>
<script>
function previewFile() {
	var preview = document.querySelector('img#img_change_up');
	var file = document.querySelector('input[type=file]').files[0];
	var reader = new FileReader();

	reader.onloadend = function() {
		preview.src = reader.result;
	}
	if (file) {
		reader.readAsDataURL(file);
	} else {
		preview.src = "";
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id=content6>
<h1>분실물</h1>
<form action="lfUpdate.lf" method="post">
<table border="1">
<tr>
 	<td><input type="hidden" name="no" value="${lfDTO.no }"></td></tr>
 	<tr>
 	<td id="tm01"><label for="장소">장소</label></td>
 	<td><input type="text" name="place" size="50" value="${lfDTO.place }"></td>
 	</tr>
 	<tr>
 	<td id="tm01"><label for="작성자">작성자</label></td>
 	<td><input type="text" name="author" size="50" value="${lfDTO.author }"></td>
 	</tr>
 	<tr>
 	<td id="tm01"><label for="내용">내용</label></td>
 	<td><textarea rows="20" cols="80" name="content">${lfDTO.content }</textarea></td>
 	</tr>
 	<tr>
 	<td id="tm01"><label for="분실물">분실물</label></td>
 	<td><input type="file" name="icon" accept=".jpg, .jpeg, .png"
						onchange="previewFile()"> <br>새로운 이미지를 추가하지 않으시면,<br>
						이전의 이미지로 유지됩니다.</td>
 	</tr>
 	<tr>
 	<td id="tm01"><label for="날짜">날짜</label></td>
 		<td><input type="text" name="nal" value="${lfDTO.nal }"></td>
 	</tr>
 	<tr>
 	<c:choose>
 	<c:when test="${sessionScope.id==lfDTO.author }">
 	<td><input type="submit" value="수정하기"></td>
 	</c:when>
 	</c:choose>
 	<td><a href="lfList.lf">목록으로</a></td>
 	</tr>
</table>
</form>
<form id="del02" action="lfDelete.lf" method="post">
<table>
<tr>
<c:choose>
<c:when test="${sessionScope.id==lfDTO.author }">
<td><input type="hidden" name="no" value="${lfDTO.no }"></td>
<td><input type="submit" value="삭제하기"></td>
</c:when>
</c:choose>
</tr>
</table>
</form>
</div>
</body>
</html>