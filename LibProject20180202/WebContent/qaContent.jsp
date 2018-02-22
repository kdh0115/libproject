<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div#content{
position: absolute;
left: 580px;
top:60px;
width: 950px;
height: 700px;
}
#tt01{
	background-color: #c0c0c0;
	text-align: center;
}
tr{
height: 40px;
}
textarea{
font-size: 17px;
}
#del3{
position: absolute;
top:668px; 
left:140px;

}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div id=content>
<h1>Q&A</h1>
<form action="qaUpdate.qa" method="post">
<table >

<tr>
 	<td><input type="hidden" name="no" value="${qaDTO.no }"></td>
 	</tr>
 	<tr>
 	<td id="tt01"><label  for="제목">제목</label></td>
 	<td><input type="text" name="title" size="50" value="${qaDTO.title }" style="height: 30px; font-size: 15px;"></td>
 	</tr>
 	<tr>
 	<td id="tt01"><label for="작성자">작성자</label></td>
 	<td><input type="text" name="author" size="50" value="${qaDTO.author }" style="height: 30px; font-size: 15px;"></td> 	
 	</tr>
 	<tr>
 	<td id="tt01"><label for="내용">내용</label></td>
 	<td><textarea rows="20" cols="80" name="content">${qaDTO.content }</textarea></td>
 	</tr>
 		<tr><td id="tt01"><label for="날짜">날짜</label></td>
 		<td><input type="text" name="nal" value="${qaDTO.nal }" style="height: 30px; font-size: 15px;"></td>
 	</tr>
 	<tr>
 	<c:choose>
 	<c:when test="${sessionScope.id==qaDTO.author }">
 	<td><input type="submit" value="수정하기"></td>
 	</c:when>
 	</c:choose>
 	<td><a href="qaList.qa">목록으로</a></td>
 	</tr>
 	</table>
 	</form>

<form id="del3" action="qaDelete.qa" method="post">
<table>
<tr>
<c:choose>
<c:when test="${sessionScope.id==qaDTO.author }">
<td><input type="hidden" name="no" value="${qaDTO.no }"></td>
<td><input type="submit" value="삭제하기" ></td>
</c:when>
</c:choose>
</tr>
</table>
</form>
</div>
</body>
</html>