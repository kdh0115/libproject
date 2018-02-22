<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--      <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script> -->
<script>
	$(function() {
		var tech = getUrlParameter('tab');
		if (tech== undefined){
			tech=0;
		}
		$("#tabs").tabs({ active: tech });
	});
	
	var getUrlParameter = function getUrlParameter(sParam) {
	    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;

	    for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');

	        if (sParameterName[0] === sParam) {
	            return sParameterName[1] === undefined ? true : sParameterName[1];
	        }
	    }
	};

</script>


  <style>
	 div.img
	{
	margin:2px;
	height:auto;
	width:auto;
	float:left;
	text-align:center;
	top: 30px;
	left: 180px;
	position: relative;
	}
	#img2
	{
	margin:2px;
	height:auto;
	width:auto;
	float:left;
	text-align:center;
	left: 705px;
	top : -60px;
	position: relative;
	}
	#tabs{
	top: 200px;
	width: 900px;
	height: 600px;
	left: 500px;
	}
	a{
	text-decoration: none;
	}
	div ul li{
	left: 670px;
	}
	td{
	text-align: center;
	}
	#sea{
	position:absolute;
	top:170px;
	left: 1090px;
	}
	 

</style>



</head>
<body>
<div id="sea">

<form action="bookSearch.book" method="post">
	<select name="setop">
		<option value="all">전체</option>
		<option value="title">도서명</option>
		<option value="author">저자</option>
		<option value="titleNauthor">도서명+저자</option>
	</select>
<input type="text" name="content" required="required" placeholder="검색어 입력">
<input type="submit" value="검색">

</form>
</div>

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">인기 도서</a></li>
    <li><a href="#tabs-2">베스트셀러</a></li>
  </ul>

<form action="bookBest.book" method="post">

<div id="tabs-1"> <!-- 인기도서 -->
	<table>
	<tr>
		<td width="170px">
			<input type="image" src="images/book/LanguageTemperature.jpg" title="언어의 온도" width="150" height="200" name="title" value="언어의 온도">
			<b>언어의 온도</b>
		</td>
		
		<td width="170px">
			<input type="image" src="images/book/WithGod.gif" title="신과 함께" width="150" height="200" name="title" value="신과 함께">
			<b>신과 함께</b>
		</td>
		
		<td width="170px">
			<input type="image" src="images/book/VesselToBeHated.JPG" title="미움 받을 용기" width="150" height="200" name="title" value="미움 받을 용기">
			<b>미움 받을 용기</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/LateNightDining.JPG" title="심야식당" width="150" height="200" name="title" value="심야식당">
			<b>심야식당</b>
		</td>
		
		<td>
			<input type="image" src="images/book/NotForsaken.JPG" title="너는 내가 버리지 못한 유일한 문장이다" width="150" height="200" name="title" value="너는 내가 버리지 못한 유일한 문장이다">
			<b>너는 내가 버리지 못한 <br>유일한 문장이다</b>
		</td>	
	</tr>
	
	<tr>
		<td>
			<input type="image" src="images/book/hin.JPG" title="흰" width="150" height="200" name="title" value="흰">
			<b>흰</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/thatGonnaChange.JPG" title="운다고 달라지는 일은 아무것도 없겠지" width="150" height="200" name="title" value="운다고 달라지는 일은 아무것도 없겠지">
			<b>운다고 달라지는 일은<br>아무것도 없겠지만</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/Nemiya.JPG" title="나미야 잡화점의 기적" width="150" height="200" name="title" value="나미야 잡화점의 기적">
			<b>나미야 잡화점의 기적</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/Airship.JPG" title="비행운" width="150" height="200" name="title" value="비행운">
			<b>비행운</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/MailOfMailbox110.JPG" title="사서함 110호의 우편물" width="150" height="200" name="title" value="사서함 110호의 우편물">
			<b>사서함 110호의 우편물</b>
		</td>
	</tr>
	</table>
</div>
	
<div id="tabs-2"> <!-- 베스트셀러 -->
	<table>
	<tr>
		<td width="170px">
			<input type="image" src="images/book/MyEnglishPuberty.JPG" title="나의 영어 사춘기" width="150" height="200" name="title" value="나의 영어 사춘기">
			<b>나의 영어 사춘기</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/TechnologyOfNervousOff.JPG" title="신경 끄기의 기술" width="150" height="200" name="title" value="신경 끄기의 기술">
			<b>신경 끄기의 기술</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/LanguageTemperature.jpg" title="언어의 온도" width="150" height="200" name="title" value="언어의 온도">
			<b>언어의 온도</b>
		</td>
		
		<td width="170px">
			<input type="image" src="images/book/82YearsOldKimJiYoung.JPG" title="82년생 김지영" width="150" height="200" name="title" value="82년생 김지영">
			<b>82년생 김지영</b>
		</td>
		
		<td>
			<input type="image" src="images/book/Wrap.JPG" title="랩걸" width="150" height="200" name="title" value="랩걸">
			<b>랩걸 Lab Girl</b>
		</td>
	</tr>
	
	<tr>
		<td width="170px">
			<input type="image" src="images/book/thatGonnaChange.JPG" title="운다고 달라지는 일은 아무것도 없겠지만" width="150" height="200" name="title" value="운다고 달라지는 일은 아무것도">
			<b>운다고 달라지는 일은 아무것도 없겠지만</b>
		</td>
		
		<td width="170px">
			<input type="image" src="images/book/HorseBowl.JPG" title="말그릇" width="150" height="200" name="title" value="말그릇">
			<b>말그릇</b>
		</td>
		
		<td width="170px">
			<input type="image" src="images/book/Nemiya.JPG" title="나미야 잡화점의 기적" width="150" height="200" name="title" value="나미야 잡화점의 기적">
			<b>나미야 잡화점의 기적</b>
		</td>
		
		<td width="170px">
			<input type="image" src="images/book/TylerRealAmericanEnglish.JPG" title="김영철 타일러의 진짜 미국식 영어" width="150" height="200" name="title" value="김영철, 타일러의 진짜 미국식 영어">
			<b>김영철 타일러의 진짜 미국식 영어</b>
		</td>
	
		<td width="170px">
			<input type="image" src="images/book/WeMeetSometime.JPG" title="우리는 언젠가 만난다" width="150" height="200" name="title" value="우리는 언젠가 만난다">
			<b>우리는 언젠가 만난다</b>
		</td>
	</tr>
	</table>
</div>
</form>

</div>
</body>
</html>