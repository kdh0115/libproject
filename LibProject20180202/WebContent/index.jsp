<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<c:set var="pagefile" value="${param.page }"/>
	<c:choose>
	
		<c:when test="${pagefile==null }">
		
			<c:set var="pagefile" value="info"/>
			
		</c:when>
	</c:choose>
<script src="js/jquery-1.10.2.js"></script>
<style type="text/css">


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 중앙도서관</title>
</head>
<body>
	<div style="z-index: 3"><jsp:include page="left.jsp"/></div>

	<div style="z-index: 1" id="pagefile1"><jsp:include page='${pagefile }.jsp'/></div>

	<div style="z-index: 2"><jsp:include page="top.jsp"/></div>

	<div style="z-index: 4"><jsp:include page="bottom.jsp"/></div>

</body>
</html>