<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${sessionScope.id==null}">
		<script>
			alert("로그인하세요");
			location.href="login.jsp";
		</script>
	</c:when>
</c:choose>
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
<script type="text/javascript">

	function deleteCheck() {
		var deletecheck = confirm("삭제하시겠습니까?");
		if(deletecheck == 1){
			location.href="boardDelete.boa?no=${boardDTO.no }";
		}
	}
	function updateCheck() {
		var updatecheck = confirm("수정하시겠습니까?");
		if(updatecheck == 1){
			document.frmUpdate.submit();
		}
	}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id=gul>
<form name="frmUpdate" action="boardUpdate.boa" method="post">
 <h1>서평</h1>
<table>
 <tr>
 	<td id="tq01"><label for="제목">제목</label></td>
 	<td><input type="text" name="title" size="50" value="${boardDTO.title }" required="required" style="height: 30px; font-size: 15px;"></td>
 	</tr>
 	<tr>
 	<td id="tq01"><label for="작성자">작성자</label></td>
 	<td><input type="text" name="author" size="50" value="${sessionScope.id }" readonly="readonly" style="height: 30px; font-size: 15px;"></td>
 	</tr>
 	<tr>
 	<td id="tq01"><label for="내용">내용</label></td>
 	<td><textarea rows="20" cols="80" name="content" required="required">${boardDTO.content }</textarea></td>
 	</tr>
 	<tr>
 		<td id="tq01"><label for="날짜" >날짜</label></td>
 		<td><input type="date" name="nal" value="${boardDTO.writedate }" readonly="readonly" style="height: 30px; font-size: 15px;"></td>
 		
 	</tr>
	<tr>
 	<td>

		<input type="button" value="수정" onclick="updateCheck()">
		<input type="button" value="삭제" onclick="deleteCheck()">
 	
 	<a href="boardList.boa">이전으로</a></td>
 </tr>
</table>

</form>
</div>

</body>
</html>