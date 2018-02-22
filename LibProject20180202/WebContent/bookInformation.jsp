<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
<style>
#tb1{
font-size: 30px;
}
#tb2{
position: relative;
top: -50px;
}
#a{
position: absolute;
top: 100px;
}
#tabs{
top: 350px;
}
#du{
color: blue;
}
#a{ 
font-size: 20px;
font-weight: lighter;

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <a href="index.jsp"><img src="images/header_logo.gif" height="50px"></a> -->
<hr>
<table id="tb1">
<tr>
<td><b>${bookDTO.title }</b></td>
<td> | ${bookDTO.sutitle }</td></tr>
</table>
<div id="a">

<table id="tb2" cellspacing="40px">
<tr><td><img src="images/book/${bookDTO.icon }" width="200" height="300"></td>
	<td><a>저자 : ${bookDTO.author }
	<br>출판사 : ${bookDTO.publisher }
	<br>출판일 : ${bookDTO.publishing }
	<br>페이지 : ${bookDTO.bookPage }p</a></td></tr>
</table>
</div>

<hr>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">책정보</a></li>
    <li><a href="#tabs-2">출판사 서평</a></li>
  </ul>
  <div id="tabs-1">
  


<p><b>책정보</b></p>
${bookDTO.bookInf }
<hr>
<p><b>저자소개</b></p>
${bookDTO.authorInf }
</p>

<hr>
<p><b>목차</b></p>
<p>
${bookDTO.tableOfCon }
 <div>
    <form name="SimpleForm">
        <a id="du" href="javascript:Detail(true);">더보기</a><br/>
    </form>
    <form name="DetailForm">
        <a id="du" href="javascript:Detail(false);">숨기기</a><br />
        <br />    
${bookDTO.tableOfConTwo }
</p><br />
    </form>
</div>
 
<script>
    Detail(false);
 
    function Detail(isShow) {
        if (isShow)
        {
            SimpleForm.hidden = true;
            DetailForm.hidden = false;
        }
        else
        {
            SimpleForm.hidden = false;
            DetailForm.hidden = true;
        }
    }
</script>
<hr>
<p><b>책 속으로</b></p>
${bookDTO.inBook }
</p>
<tr>
</td>
</tr>

 </div>
 <div id="tabs-2">
 <table>
 <p><b>출판사 서평</b></p>
${bookDTO.publishReview }
</p>
</table>
</div>
 </div>
</body>
</html>