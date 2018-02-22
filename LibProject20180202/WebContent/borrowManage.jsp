<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/two.css">
<style>
	h1{
		position : absolute;
		top: 200px;
		left: 790px;
		font-size: 45px;
		color: white;
	}
	.daeone{
		position: absolute;
		top: 3px;
		left: 3px;
	}
	.daetwo{
		position: absolute;
		top: 3px;
		left: 226px;
	}
	.daethree{
		position: absolute;
		top: 137px;
		left: 3px;
	}

	
	.btn-do{
		padding: 56px 95px;
		color: black;
		border: none;
		opacity: 0.7;
		border-bottom: 4px solid black;
		margin-bottom: 20px;
		font-weight: bold;
		border-radius: 10%;
	}
		.btn-do1{
		padding: 20px 20px;
		color: black;
		border: none;
		opacity: 0.7;
		border-bottom: 4px solid black;
		margin-bottom: 20px; 
		font-weight: bold;
		border-radius: 10%;
		width: 440px;
	}
	.container{
 		position: absolute;
		width: 447px;
		height: 200px;
 		text-align: center;
		background-color: black;
		opacity: 0.7;
		border-radius: 5%;
		margin: 0 auto;
		margin-top: 250px;
		top: 100px;
		left: 715px;
	}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<h1>대출/반납 관리</h1>

<div class="container">
	<table>
	<tr>
	<td class="daeone">
		<form action="borrowId.jsp" method="post">
			<input type="submit" value="대출" class="btn-do">
		</form>
	</td>
	<td class="daetwo">
		<form action="borrowRetrun.jsp" method="post">
			<input type="submit" value="반납" class="btn-do">
		</form>
	</td>
	</tr>
	<tr>
	<td class="daethree">
		<form action="index.jsp" method="post">
			<input type="submit" value="메인으로" class="btn-do1">
		</form>
	</td>
	</tr>
	</table>
	</div>
</body>
</html>