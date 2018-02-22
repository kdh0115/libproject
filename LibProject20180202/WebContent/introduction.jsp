<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<html lang="en">
<head>

<style>
h1 {
	position: absolute;
	top: 120px;
	left: 520px;
}

#doseoimages {
	position: absolute;
	top: 80px;
	left: 580px;
	height: 450px;
	width: 350px;
}

#tabs {
	height: 0px;
	border-style: none;
	width: 900px;
	left: 500px;
	top: 210px;
	font: 12px sans-serif;
}

#inttd {
	color: green;
	font: 15px sans-serif;
}

th#nanana {
	border: solid #ebebeb;
	border-radius: 2px;
	background-color: #ebebeb;
	color: black;
	font-weight: 600;
}

#boardtdtd {
	text-align: center;
}

#mapmap {
	position: relative;
	left: 100px;
}

#addr {
	color: green;
	font: 15px sans-serif;
} 
 


</style>
</head>
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

<body>
	<h1>소개</h1>

	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">인사</a></li>
			<li><a href="#tabs-2">찾아오시는 길</a></li>
		</ul>

		<div id="tabs-1">

			<img src="images/doseo.png" id="doseoimages">
			<table>
				<tr>
					<br>
					<td id="inttd"><b>“교육 및 학술연구를 위한 최선의 지원을 통해 사명을 감당하겠습니다”</b></td>
					<br>
					<br> 2조 중앙도서관은
					<br> 1956년에 개관한 이래로 대학의 모든 교육학습, 학술연구, 사회봉사 활동에
					<br> 필요한 정보자료를 적극적으로 지원하여 왔습니다.
					<br> 도서관은 현재 지구촌에서 유통되는 아날로그 자료를 엄선하여 수집·제공하고 보존·관리하는 한편
					<br> 최적의 디지털 정보자원을 적시에 수용하여
					<br>인터넷 정보유통 환경에도 선제적으로 대응하고 있습니다.
					<br>
					<br> 도서관은 미래에도 캠퍼스의 교육학술 및 연구정보를 총괄하는 심장인 동시에
					<br> 구성원과 지역사회를 위한 지식정보 공유지로서의 역량을 강화하여
					<br>모든 지식정보에 대한 접근·입수의 편의성과 신속성을 보장하겠습니다.
					<br>
					<br> 도서관은 여러분의 관심과 이용을 자양분으로 삼아 성장·발전합니다.
					<br> 도서관을 노크하십시오.
					<br> 도서관으로 오십시오.
					<br>
					<br>
				</tr>
			</table>
		</div>
		
		<div id="tabs-2">
			<h2>▶ 찾아오시는 길</h2>
			<table>
			<tr><img src="images/map.png" width="800px"></tr>
			<tr>
				<td id="addr"><b>(38453) 경상북도 경산시 진량읍 대구대로 201</td>
				</b>
				</tr>
				<tr>
				
				<td>지하철 1호선 이용 : 안심역에서 하차(4번 출구)하여 808, 814, 818, 급행5번 버스를
					이용합니다.<br> 지하철 2호선 이용 : 영남대역(4번 출구)에서 하차하여 840번 버스를 이용합니다.<br>
					고속버스 이용 : 고속버스 정류장에 내려서 하양방면으로 가는 708,814,818번 버스를 타고 종점까지 오거나, <br>지하철을
					타고 안심역까지 오셔서 대구대방면 버스를 타면 됩니다.<br> 시내버스 이용 : 708, 808, 814,
					818, 840, 급행5, 진량1 버스를 이용합니다.<br> <br> <br> <br>
				</td>
			</tr>
			</table>
		</div>
	</div>
</body>

</html>