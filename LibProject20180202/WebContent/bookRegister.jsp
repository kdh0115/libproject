<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Register.css">

<script>
 function bookPreviewFile() {
  var preview = document.querySelector('img#img_change_regi');
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
<style type="text/css">
div#singUpform{
	position: absolute;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 중앙도서관 도서등록</title>
</head>
<body>
<h1>도서등록</h1>
<form action="bookRegister.book" method="post" enctype="multipart/form-data">
	<div class="container">
		<table class="abtable">
	<tr>
		<td rowspan="7"><img src="" id="img_change_regi" height="200" alt="이미지를 추가하세요"></td>
		<td align="center" valign="middle" width="150px" height="30px">
		<label for="도서명">도서명</label>
		<td>
		<input type="text" name="title" size="20" required="required" placeholder="도서명 입력">
		</td>
		</td>
		<td align="center" valign="middle" height="30px">
		<label for="">책 정보</label>
		</td>
		<td>
		<textarea name="bookInf" cols="35" rows="5"></textarea>
		</td>
	</tr>
	
	<tr>
		<td align="center" valign="middle" height="30px">
		<label for="부제">부제</label>
		</td>
		<td>
		<input type="text" name="sutitle" size="20" required="required" placeholder="부제 입력">
		</td>
		<td align="center" valign="middle" height="30px">
		<label for="">저자소개</label>
		</td>
		<td>
		<textarea name="authorInf" cols="35" rows="5"></textarea>
		</td>
	</tr>
	
	<tr>
		<td align="center" valign="middle" height="30px">
		<label for="저자">저자</label>
		</td>
		<td>
		<input type="text" name="author" size="20" required="required" placeholder="저자 입력">
		</td>
		<td align="center" valign="middle" height="30px">
		<label for="">목차</label>
		</td>
		<td>
		<textarea name="tableOfCon" cols="35" rows="5"></textarea>
		</td>
	</tr>
	
	<tr>
		<td align="center" valign="middle" height="30px">
		<label for="도서이미지">도서이미지</label>
		</td>
		<td>
		<input type="file" name="icon" accept=".jpg, .jpeg, .png, .gif" onchange="bookPreviewFile()">
		<td align="center" valign="middle" height="30px">
		<label for="">목차 더보기</label>
		</td>
		<td>
		<textarea name="tableOfConTwo" cols="35" rows="5"></textarea>
		</td>
		 </td>

	</tr>
	
	<tr>
		<td align="center" valign="middle" height="30px">
		<label for="출판사">출판사</label>
		</td>
		<td>
		<input type="text" name="publisher" size="20" required="required" placeholder="출판사 입력">
		</td>
		<td align="center" valign="middle" height="30px">
		<label for="">책 속으로</label>
		</td>
		<td>
		<textarea name="inBook" cols="35" rows="5"></textarea>
		</td>
	</tr>
	
	<tr>
		<td align="center" valign="middle" height="30px">
		<label for="출판연도">출판연도</label>
		</td>
		<td>
		<input type="text" name="publishing" size="20" required="required" placeholder="ex) 2018.01.01">
		</td>
		<td align="center" valign="middle" height="30px">
		<label for="">출판사의 서평</label>
		</td>
		<td>
		<textarea name="publishReview" cols="35" rows="5"></textarea>
		</td>
	</tr>
	
		<tr>
	
		
		<td align="center" valign="middle" height="30px">
		<label for="">페이지</label>
		</td>
		<td>
		<input type="text" name="bookPage" size="20" required="required" placeholder="ex) 200">
		</td>
	</tr>
	
		</table>
			<input type="submit" name="success" value="완료" class="btn-do" onclick=""><br>
	
			<a href="bookManage.jsp">이전으로</a>
	</div>
		</form>
</body>
</html>