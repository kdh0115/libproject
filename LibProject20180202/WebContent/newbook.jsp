<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/blueberry.css">
<style type="text/css">
ul{list-style-type: none;}
ul li{list-style-type: none;}
.blueberry{
	position: absolute;
	left: 1150px;
	top: 160px;
}
</style>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.blueberry.js"></script>
</head>
<body>
<form action="index.jsp">
<div class="blueberry">

  <ul class="slides">
    <li><img src="images/bkbk.gif"  /></li>
    <li><img src="images/bkbk1.gif" /></li>
    <li><img src="images/bkbk.gif" /></li>
  </ul>
</div>
<script type="text/javascript">
$(function () {
$(window).load(function() {
	$('.blueberry').blueberry();
});
	
});


</script>
</form>
</body>
</html>