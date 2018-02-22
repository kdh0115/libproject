<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div#content4{
position: absolute;
left: 540px;
top:60px;
width: 950px;
height: 700px;
}
#to01{
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
<div id=content4>
<h1>분실물</h1>
<form action="lfWrite.lf" method="post" enctype="multipart/form-data">

 <table>
 	<tr><td id="to01"><label for="장소">장소</label></td>
 	<td><input type="text" name="place" size="50" placeholder="장소를 입력하세요" required="required"></td>
 	</tr>
 	<tr>
 	<td id="to01"><label for="작성자">작성자</label></td>
 	<td><input type="text" name="author" size="50" value="${sessionScope.id}" readonly="readonly"></td>
 	</tr>
 	<tr>
 	<td id="to01"><label for="내용">내용</label></td>
 	<td><textarea rows="20" cols="70" name="content" placeholder="내용을 입력하세요" required="required"></textarea></td>
 	</tr>
 	<tr>
	<td id="to01"><label for="날짜">날짜</label></td>
 		<td><input type="date" name="nal"></td>
 	</tr>
 	<tr>
 	<td id="to01"><label for="파일">파일</label></td>
	<td><input type="file" name="theFile">
 	</td></tr>
 	<tr>
 	<td><input type="submit" value="작성하기">
 	<a href="lfList.lf">목록으로</a></td>
 	</tr>
</table>
</form>
</div>
</body>
</html>