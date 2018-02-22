<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#sr1{
	position: absolute;
	height: 100px;
	width: 400px;
	top: 300px;
	left: 820px;
	
	}
h1{
	position: relative;
	left: 20px;
	color: black;
}
</style>
<script type="text/javascript">
function openPw(myform) {
	url = "pw_select.member?id="+myform.id.value+"&birth1="+myform.birth1.value+"&birth2="+myform.birth2.value+"&birth3="+myform.birth3.value;
	window.open(url,"win01","width=300 height=300");
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="sr1" action= >

<h1>비밀번호 찾기</h1>
<table>

<tr>
<td><lable for="아이디">아이디</lable></td>
<td>
<input type="text" name="id" placeholder="아이디를 입력하세요" required="required">
</td>
</tr>
<tr>
<td><lable for="생년월일" >생년월일</lable></td>
      <td>
      <input type="text" name="birth1" size="8" required="required" placeholder="년 ex)2018">

<select name=birth2>
<option value="" selected>월</option>
<option value=01>1</option>
<option value=02>2</option>
<option value=03>3</option>
<option value=04>4</option>
<option value=05>5</option>
<option value=06>6</option>
<option value=07>7</option>
<option value=08>8</option>
<option value=09>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select>
<select name=birth3>
<option value="" selected>일</option>
<option value=01>1</option>
<option value=02>2</option>
<option value=03>3</option>
<option value=04>4</option>
<option value=05>5</option>
<option value=06>6</option>
<option value=07>7</option>
<option value=08>8</option>
<option value=09>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
<option value=13>13</option>
<option value=14>14</option>
<option value=15>15</option>
<option value=16>16</option>
<option value=17>17</option>
<option value=18>18</option>
<option value=19>19</option>
<option value=20>20</option>
<option value=21>21</option>
<option value=22>22</option>
<option value=23>23</option>
<option value=24>24</option>
<option value=25>25</option>
<option value=26>26</option>
<option value=27>27</option>
<option value=28>28</option>
<option value=29>29</option>
<option value=30>30</option>
<option value=31>31</option>
</select>
</td>
</tr>
<tr>
<td>
<input type="button" value="찾기" onClick="openPw(this.form)" style="position: relative; left: 100px;top: 40px;">
</td>
</tr>
</table>

</form>
</body>
</html>