<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Accordion - Default functionality</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>
<style>
#accordion {
	position: absolute;
	width: 800px;
	top: 300px;
	left: 600px;
}

h1 {
	position: absolute;
	top: 205px;
	left: 600px;
}

body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 800px;
	margin: 0 auto;
	position: absolute;
	top: 560px;
	left: 600px;
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 10%;
}

#ulTable>li>ul>li:first-child+li {
	width: 45%;
}

#ulTable>li>ul>li:first-child+li+li {
	width: 20%;
}

#ulTable>li>ul>li:first-child+li+li+li {
	width: 15%;
}

#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 10%;
}

#divPaging {
	clear: both;
	margin: 0 auto;
	width: 220px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
}

#liSearchOption {
	clear: both;
}

#liSearchOption>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
	right: 270px;
	position: absolute;
}

.left {
	text-align: left;
}

#txtKeyWord {
	position: absolute;
	top: 702px;
}

.write03{
	position: relative;
	left: 195px;
	top: -32px;
}
</style>
</head>
<body>
<a href="index.jsp"><img src="images/header_logo.gif"></a>
	<h1>Q&A</h1>
	<div id="accordion">
		<h3>도서관 이용시간은 어떻게 되나요?</h3>
		<div>
			<p>평일 AM 8:00 ~ PM 12:00 이며, 토요일은 AM 8:00 ~ PM 10:00, 일요일은 휴관일입니다.</p>
		</div>
		<h3>도서관 열람실 사용 신청은 어디서 하나요?</h3>
		<div>
			<p>인터넷에서 신청 후 사용하시면 됩니다.</p>
		</div>
		<h3>도서관 문의사항은 어디로 연락하면 되나요?</h3>
		<div>
			<p>010-5554-559 여기로 연락주시면 됩니다.</p>
		</div>
	</div>
	<div id="mainWrapper">

		<ul>
			<li>
				<ul id="ulTable">
					<li>
						<ul>
							<li>No</li>
							<li>제목</li>
							<li>작성일</li>
							<li>작성자</li>
							<li>조회수</li>
						</ul>
					</li>

						<c:forEach var="qa" items="${list }">
					<li>
						<ul>
							<li>${qa.no }</li>
							<li class="left"><a href='qaContent.qa?no=${qa.no}'>${qa.title }</a></li>
							<li>${qa.nal }</li>
							<li>${qa.author }</li>
							<li>${qa.readcount }</li>
						</ul>
					</li>
					</c:forEach>

					
				</ul>
			</li>

			<li>
				<div id="divPaging">
					<div>
						<jsp:include page="qa_page.jsp" flush="true"></jsp:include>
					</div>
				</div>
			</li>

				<div id='liSearchOption'>
			<form action="qaSearch.qa">
				<select id='selSearchOption'name="choice">
					<option value='A'>제목+작성자</option>
					<option value='T'>제목</option>
					<option value='C'>작성자</option>
				</select> <input type="text" name="search" required="required"
					placeholder="게시글제목입력"> <input type="submit" value='검색'>
			</form>
				<c:choose>
				<c:when test="${sessionScope.id==null }">
				<form action="login.jsp" method="post">
				<input class="write03" type='submit' value='글쓰기'>
				</form>
				</c:when>
				<c:otherwise>
				<form action="qaWrite.jsp" method="post">
				<input class="write03" type='submit' value='글쓰기'>
				</form>
				</c:otherwise>
				</c:choose>
			</div>
		</ul>
	</div>
</body>
</html>