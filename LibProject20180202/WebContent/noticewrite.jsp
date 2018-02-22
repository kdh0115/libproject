<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div#gul{
position: absolute;
left: 580px;
top:60px;
width: 950px;
height: 700px;
}
#tq01{
	background-color: #c0c0c0;
	text-align: center;
}
tr{
height: 40px;
}
textarea{
font-size: 17px;
}
h1{text-align: center;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id=gul>
<form action="noticeWrite.notice" method="post">
 <h1>서평</h1>
<table>
 <tr>
 	<td id="tq01"><label for="제목">제목</label></td>
 	<td><input type="text" name="title" size="50" placeholder="제목을입력하세요" required="required" style="height: 30px; font-size: 15px;"></td>
 	</tr>
 	<tr>
 	<td id="tq01"><label for="작성자">작성자</label></td>
 	<td><input type="text" name="author" size="50" value="${sessionScope.id }" readonly="readonly" style="height: 30px; font-size: 15px;"></td>
 	</tr>
 	<tr>
 	<td id="tq01"><label for="내용">내용</label></td>
 	<td><textarea rows="20" cols="80" name="content" placeholder="내용을 입력하세요" required="required"></textarea></td>
 	</tr>
 	<tr>
 		<td id="tq01"><label for="날짜" >날짜</label></td>
 		<td><input type="date" name="nal" style="height: 30px; font-size: 15px;"></td>
 		
 	</tr>
	<tr>
 	<td><input type="submit" value="글쓰기">
 	<a href="boardNotice.jsp">목록으로</a></td>
 </tr>
</table>
</form>
</div>
</body>
</html>