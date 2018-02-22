
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Change.css" />
<style type="text/css">

#memberChange_table_image{
position: absolute;
top: 350px;
left: 1100px;
color : white;
}

#memberChange_table {
position : absolute;
	width: 600px; left: 620px; top: 280px; color: white;
}


</style>
<script type="text/javascript">
function memberUpdatePreviewFile() {
 var preview = document.querySelector('img#img_change_member_Update');
 var file = document.querySelector('input[type=file]').files[0];
 var reader = new FileReader();
 
 reader.onloadend = function() {
  preview.src = reader.result;
 }
 if (file) {
  reader.readAsDataURL(file);
 } else {
  preview.src = "";
 }

}
function memberLeaveCheck() {
	var leavecheck = confirm("탈퇴하시겠습니까?");
	if(leavecheck == 1){
		location.href="leave.member";
	}
}
function memberUpdateCheck() {
	var updatecheck = confirm("수정하시겠습니까?");
	if(updatecheck == 1){
		document.frmUpdate.submit();
	}
}

</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container11">
	</div>
<form action="view.member" name="frmUpdate" method="post" enctype="multipart/form-data">

		<table id="memberChange_table_image">
		<tr>
		<td>
		<img src="images/profile/${memberDTO.memImage }" id="img_change_member_Update" height="150px" width="150px" alt="이미지를 추가하세요.">
		</td>
		</tr>
		</table>
		
		<table id="memberChange_table">
		
		    <tr>
		    <td align="center"><label for="아이디">아 이 디</label></td>
		    <td><input type="text" name="id" value="${memberDTO.id }" readonly="readonly"></td>
		    </tr>
		     <tr>
		     <td align="center"><label for="패스워드">패스워드</label></td>
		     <td><input type="password" name="pw" required="required" placeholder="패스워드 입력" value="${memberDTO.pw }"></td>
		     </tr>
		      <tr>
		      <td align="center"><label for="패스워드확인">패스워드 확인</label></td>
		       <td><input type="password" name="pwch" required="required" placeholder="패스워드 입력" value="${memberDTO.pwch }"></td>
		      </tr>
		     <tr>
		     <td align="center"><label for="이름">이        름</label></td>
		     <td><input type="text" name="irum" required="required" placeholder="이름 입력" value="${memberDTO.irum }"></td>
		     </tr>
		     <tr>

		      <tr>
		      <td align="center"><label for="전화번호">전화번호</label></td>
		     <td><input type="tel" name="tel" required="required" placeholder="전화번호 입력" value="${memberDTO.tel }"></td>
		      </tr>

		      <tr>
		      <td align="center"><label for="이메일">이 메 일</label></td>
		     <td><input type="email" name="email" required="required" placeholder="이메일 입력" value="${memberDTO.email }"></td>
		      </tr>
		      
			<tr>
			<td align="center" valign="middle" height="30px">
			<label for="프로필 사진">프로필 사진</label>
			</td>
			<td>
			<input type="file" name="icon" accept=".jpg, .jpeg, .png, .gif" onchange="memberUpdatePreviewFile()">
			 </td>
	
		</tr>
		     
		     
		       <tr><td align="center"><label for="정보수신허용">정보 및 이메일 수신허용</label></td>
         
           <c:set var="name" value="${memberDTO.emailcheck }" />
			<c:choose>
			    <c:when test="${name eq 'yes'}">
         <td><select name="emailcheck">
			        <option value="yes">예</option>
			        <option value="no">아니오</option>
           </select></td>
			    </c:when>
			    <c:otherwise>
			             <td><select name="emailcheck">
			        <option value="no">아니오</option>
			        <option value="yes">예</option>
			                   </select></td>
			    </c:otherwise>
			</c:choose>
           </tr>
           
         <tr><td align="center"><label for="sms수신허용">sms수신허용</label></td>
           <td>
           <c:set var="name" value="${memberDTO.smscheck }" />
			<c:choose>

			    <c:when test="${name == 'yes'}">
			               <select name="smscheck">
			        <option value="yes">예</option>
			        <option value="no">아니오</option>
			        			</select>
			    </c:when>
			    <c:otherwise>
			        <select name="smscheck">
			        <option value="no">아니오</option>
			        <option value="yes">예</option>
			        </select>
			    </c:otherwise>
			</c:choose>
			<td>
      	</tr>
		     
		     <tr>
		     <td colspan="2" align="center" height="60px"> <input type="button" value="정보수정" onclick="memberUpdateCheck()">
           <input type="button" value="회원탈퇴" onclick="memberLeaveCheck()">
		  
	 <a href="index.jsp" style="color: white;">메인으로</a></td>
		     </tr>
		   
</table>
</form>
</body>
</html>