<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style> 
#topMenu { height: 100px; /* 메인 메뉴의 높이 */ width: 3000px; /* 메인 메뉴의 넓이 */ 
position: absolute; top: 150px;left: 1px;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */ 
list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */ 
margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */ 
padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */ } 

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */ 
color: black; /* 글씨 색을 흰색으로 설정 */ 
background-color: white; /* 배경 색을 RGB(2D2D2D)로 설정 */ 
float: left; /* 왼쪽으로 나열되도록 설정 */ 
line-height: 50px; /* 텍스트 한 줄의 높이를 30px로 설정 */ 
vertical-align: middle; /* 세로 정렬을 가운데로 설정 */ 
text-align: center; /* 텍스트를 가운데로 정렬 */ 
position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */ 
}
 

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */ 
text-decoration:none; /* a 태그의 꾸밈 효과 제거 */ 
display: block; /* a 태그의 클릭 범위를 넓힘 */ 
width: 310px; /* 기본 넓이를 150px로 설정 */ 
font-size: 13px; /* 폰트 사이즈를 12px로 설정 */ 
font-weight: bold; /* 폰트를 굵게 설정 */ 
font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */ } 

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */ color: #575757; } 

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */ 
color: #575757; /* 글씨 색 빨간색 */ 
background-color: white; /* 배경색을 밝은 회색으로 설정 */ } 

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */ 
color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */ 
background-color: white; /* 배경색을 흰색으로 설정 */ 
margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설정 */ } 

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */ 
width: 100px; /* 넓이는 190px로 설정 */ } 

.submenu { /* 하위 메뉴 스타일 설정 */ 
position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */ 
height: 0px; /* 초기 높이는 0px로 설정 */ 
overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */ 
transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */ 
-webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */ 
-moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */ 
-o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
opacity: 0.7; 
} 

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */ 
height: 200px; /* 높이를 93px로 설정 */ } 

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */ 
color: navy; /* 글씨색을 빨간색으로 설정 */ 
background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */ } 

h1{
position: absolute;
top: 30px;
left: 145px;
font-size: 40px;
color: #575757;
}

</style>
<link rel="stylesheet" media="all" type="text/css" href="css/Tmenu.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> Library </h1>

<nav id="topMenu" >
<hr style="color: #adb7bc"> 
		<ul>
			<li class="topMenuLi">
                <a class="menuLink" href="http://unikys.tistory.com/category/Programming%20Lecture"></a>
            </li>
            <li class="topMenuLi">
                <a class="menuLink" href="">Home</a>
            </li>
            <li class="topMenuLi">
                <a class="menuLink" href="searchOfMaterials.jsp?tab=0">자료검색</a>
                <ul class="submenu">
                    <li><a href="" class="submenuLink">전체</a></li>
                    <li><a href="searchOfMaterials.jsp?tab=0" class="submenuLink">인기도서</a></li>
                    <li><a href="searchOfMaterials.jsp?tab=1" class="submenuLink">베스트셀러</a></li>
                </ul>
            </li>
            <li class="topMenuLi">
                <a class="menuLink" href="">도서관서비스</a>
                    <ul class="submenu">
                    <li><a href="#nogo3" class="submenuLink">열람실이용</a></li>
                    <li><a href="#nogo7" class="submenuLink">사물함이용</a></li>
                    <li><a href="#nogo7" class="submenuLink">무인예약시스템</a></li>
                </ul>
            </li>
            <li class="topMenuLi">
                <a class="menuLink" href="#nogo27">문화생활</a>
                      <ul class="submenu">
                    <li><a href="#nogo3" class="submenuLink">프로그램신청</a></li>
                    <li><a href="#nogo7" class="submenuLink">갤러리</a></li>
                    <li><a href="#nogo7" class="submenuLink">캘린더</a></li>
                </ul>
            </li>
             <li class="topMenuLi">
                <a class="menuLink" href="#nogo31">게시판</a>
                      <ul class="submenu">
                    <li><a href="boardList.boa" class="submenuLink">공지사항</a></li>
                    <li><a href="noticeList.notice" class="submenuLink">서평</a></li>
                    <li><a href="qaList.qa" class="submenuLink">Q&A</a></li>
                    <li><a href="lfList.lf" class="submenuLink">분실물</a></li>
                    <li><a href="#nogo7" class="submenuLink">설문조사</a></li>
                </ul>
            </li>
             <li class="topMenuLi">
                <a class="menuLink" href="introduction.jsp">도서관안내</a>
                      <ul class="submenu">
                    <li><a href="introduction.jsp?&tab=0" class="submenuLink">연혁</a></li>
                    <li><a href="introduction.jsp?&tab=1" class="submenuLink">찾아오시는길</a></li>
                </ul>
            </li>
		</ul>
	</nav>

<input type="text" id="search" placeholder="도서를 입력하세요" style="position: fixed; text-align: center; border: 0px; top: 130px; left: 1650px;">
<button type="submit" style="opacity: 0.7; border: 0px; position: fixed; text-align: center; border: 0px; top: 130px; left: 1825px; color: black;">Search</button>

		
		<c:choose>
		<c:when test="${sessionScope.id==null }">
			<a href="memberRegister.jsp" style="text-decoration: none; color: black;">
			<input type="submit" style="opacity: 0.7; border: 0px; position: fixed; text-align: center; border: 0px; top: 20px; left: 1740px; color: black; height: 30px; width: 50px; cursor: pointer;" value="join"></a>
			<a href="login.jsp" style="text-decoration: none; color: black;">
			<input type="submit" style="opacity: 0.7; border: 0px; position: fixed; text-align: center; border: 0px; top: 20px; left: 1800px; color: black; height: 30px; width: 50px; cursor: pointer;" value="login"></a>
		</c:when>
		<c:otherwise>
		
			<div style="opacity: 0.7; border: 0px; position: fixed; text-align: center; border: 0px; top: 20px; left: 1500px; color: black;">${sessionScope.id }님 환영합니다</div>
		
			<a href="logout.member" style="text-decoration: none; color: black;">
			<input type="submit" style="opacity: 0.7; border: 0px; position: fixed; text-align: center; border: 0px; top: 20px; left: 1800px; color: black; height: 30px; width: 50px; cursor: pointer;" value="logout"></a>
		
		</c:otherwise>
		</c:choose>


</body>
</html>