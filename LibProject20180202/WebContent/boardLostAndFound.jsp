<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<script>
  $( function() {
    $( "#accordion" ).accordion();
  } );
  </script>
<style>
<
style>#accordion {
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
	top: 360px;
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
	width: 25%;
}

#ulTable>li>ul>li:first-child+li+li {
	width: 30%;
}

#ulTable>li>ul>li:first-child+li+li+li {
	width: 10%;
}

#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 20%;
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
	right: 770px;
	position: absolute;
}

.left {
	text-align: left;
}

#txtKeyWord {
	position: absolute;
	top: 702px;
}
.write01{position: relative;
		left: 190px;
		top: -32px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="index.jsp"><img src="images/header_logo.gif"></a>
	<h1>분실물</h1>
	<div id="mainWrapper">

		<ul>

			<li>

				<ul id="ulTable">
					<li>
						<ul>
							<li>No</li>
							<li>분실물</li>
							<li>습득장소</li>
							<li>작성일</li>
							<li>작성자</li>
						</ul>
					</li>
					<c:forEach var="lf" items="${list }">
					<li>
						<ul>
							<li>${lf.no }</li>
							<li class="left"><a href='lfContent.lf?no=${lf.no}'><img src='images/boardLost/${lf.icon }'height="20px" width="50px"></a></li>
							<li>${lf.place }</li>
							<li>${lf.nal }</li>
							<li>${lf.author }</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</li>

			<li>
				<div id="divPaging">					
					<div>
						<jsp:include page="lf_page.jsp" flush="true"></jsp:include>
					</div>
				</div>
			</li>

			<div id='liSearchOption'>
			<form action="lfSearch.lf">
				<select id='selSearchOption'name="choice">
					<option value='T'>장소</option>
					<option value='C'>작성자</option>
				</select> <input type="text" name="search" required="required"
					placeholder="게시글제목입력"> <input type="submit" value='검색'>
			</form>
			<c:choose>
				<c:when test="${sessionScope.id==null }">
				<form action="login.jsp" method="post">
				<input class="write01" type='submit' value='글쓰기'>
				</form>
				</c:when>
				<c:otherwise>
				<form  action="lfwrite.jsp" method="post">
				<input class="write01" type='submit' value='글쓰기'>
				</form>
				</c:otherwise>
			</c:choose>
			</div>

		</ul>
	</div>
</body>
</html>