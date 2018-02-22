<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
html, body { height: 100%; }
body {
  margin: 0;
  overflow-x: hidden;
  display: flex;
}

#hamburger { display: none; }
#hamburger ~ * {
  position: absolute;
  transition: transform 0.4s;
}
#hamburger:checked ~ * { transform: translate3d(200px, 0, 0);}
#hamburger ~ label {
  font-size: 54px;
  top: -16px; left: 8px;
  
}
#hamburger ~ nav {
  background: white;
  width: 200px;
  left: -200px;
  height: 100%;
}
#hamburger ~ nav * {
  margin: 0; padding: 0;
  color: black;
}
#hamburger ~ nav header {
  background: teal;
  padding: 1em;
}
#hamburger ~ nav a {
  display: block;
  text-decoration: none;
  padding: 1em;
}
#hamburger ~ nav a:hover { background: #efefef; }

#imgg_aaa{
position: relative;
left: 60px;
top: 35px;
}
#ulullogin{
list-style: none; 
}
h3{
top: 130px;
left: -10px;
text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
  <input id="hamburger" type="checkbox" /><label for="hamburger">&equiv;</label>
  <nav>
  <div id="mySidenav" class="sidenav">
	<ul id="ulullogin">
		<c:choose>
			<c:when test="${sessionScope.id!=null }">
	    	<li id="imgg_aaa">
	    	
	    		<c:choose>
					<c:when test="${memberDTO.memImage!=null }">
				    	<input type="image" src="images/profile/${memberDTO.memImage }" width="100px" height="100px"><br>
					</c:when>
				    <c:otherwise>
			 	    	<input type="image" src="images/profile/profile.png" width="80px">
				    </c:otherwise>
				</c:choose>
		<br><br>
	    	<div id="idFontColor" >${sessionScope.id }</div>
	    	</li>
			</c:when>
		</c:choose>
	</ul>
	<br><br>
    <ul id="ulullogin">
    <c:choose>
      <c:when test="${sessionScope.id=='admin' }">
      <li><a href="list.member">회원목록</a></li>
      <li><a href="bookManage.jsp">도서관리</a></li>
      <li><a href="borrowManage.jsp">대출반납관리</a></li>
	  </c:when>
	  <c:when test="${sessionScope.id!=null }">
	  <li><a href="list.borrow">대출현황</a></li>
	  <li><a href="#">대출연장</a></li>
	  <li><a href="allList.borrow">전체대출기록</a></li>
	  <li><a href="updateconfirm.member">정보수정</a></li>	    
      </c:when>		
	  <c:otherwise>
	  <a class="goto_left_login" href="login.jsp"><h3>로그인하세요</h3></a>
	  </c:otherwise>
	  </c:choose>
	</ul>
</div>
  </nav>
</body>
</html> 