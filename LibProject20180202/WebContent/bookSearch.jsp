<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Search.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 중앙도서관 도서검색</title>
</head>
<body>
<form action="bookSearch.book" method="post">
<h1>도서검색</h1>

	<div class="container">
		<img src="images/am.png">
		
		<select class="setop" name="setop" style="position: absolute; height: 35px;">
		<option value="all">전체</option>
		<option value="title">도서명</option>
		<option value="author">저자</option>
		<option value="titleNauthor">도서명+저자</option>
	</select>
	
	
			<div class="form-input">
				<input type="text" name="content" placeholder="검색어를 입력해주세요" required="required">
			</div>
			<input type="submit" name="searchbutton" value="검색" class="btn-do"><br>
			<a href="bookManage.jsp">이전으로</a>
	</div>
	</form>
</body>
</html>