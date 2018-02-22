<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/UpdateForm.css">
<script>
	function previewFile() {
		var preview = document.querySelector('img#img_change_up');
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

	function updateCheck() {
		var updatecheck = confirm("수정하시겠습니까?");
		if (updatecheck == 1) {
			document.frmUpdate.submit();
		}
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대구대학교 중앙도서관 도서수정</title>
</head>
<body>
	<form name="frmUpdate" action="bookUpdate.book" method="post"
		enctype="multipart/form-data">
		<div class="container">

			<table id="img">
				<tr>
					<td rowspan="5"><img src="images/book/${bookDTO.icon }"
						id="img_change_up" height="300" alt="이미지를 추가하세요"></td>
				</tr>
			</table>
			
			<h1>도서수정</h1>

			<table id="tb1">
				<tr height="30px">
					<td width="110px" align="center"><label for="도서명">도서명</label></td>
					<td><input type="text" name="title" size="20" required="required" value="${bookDTO.title }"></td>
					<td align="center" valign="middle" height="30px"><label for="">책정보</label></td>
					<td><textarea name="bookInf" cols="35" rows="5">${bookDTO.bookInf }</textarea>
					</td>

				</tr>

				<tr height="30px">
					<td align="center"><label for="부제">부제</label></td>
					<td><input type="text" name="sutitle" size="20"
						required="required" value="${bookDTO.sutitle }"></td>
					<td align="center" valign="middle" height="30px"><label for="">저자소개</label>
					</td>
					<td><textarea name="authorInf" cols="35" rows="5">${bookDTO.authorInf }</textarea>
					</td>
				</tr>

				<tr height="30px">
					<td align="center"><label for="저자">저자</label></td>
					<td><input type="text" name="author" size="20"
						required="required" value="${bookDTO.author }"></td>
					<td align="center" valign="middle" height="30px"><label for="">목차</label>
					</td>
					<td><textarea name="tableOfCon" cols="35" rows="5">${bookDTO.tableOfCon }</textarea>
					</td>
				</tr>

				<tr height="30px">
					<td align="center"><label for="도서이미지">도서이미지</label></td>
					<td><input type="file" name="icon" accept=".jpg, .jpeg, .png, .gif"
						onchange="previewFile()"> <br>새로운 이미지를 추가하지 않으시면,<br>
						이전의 이미지로 유지됩니다.</td>
					<td align="center" valign="middle" height="30px"><label for="">목차
							더보기</label></td>
					<td><textarea name="tableOfConTwo" cols="35" rows="5">${bookDTO.tableOfConTwo }</textarea>
					</td>
				</tr>

				<tr>
					<td align="center" valign="middle" height="30px"><label
						for="출판사">출판사</label></td>
					<td><input type="text" name="publisher" size="20"
						required="required" value="${bookDTO.publisher }"></td>
					<td align="center" valign="middle" height="30px"><label for="">책
							속으로</label></td>
					<td><textarea name="inBook" cols="35" rows="5">${bookDTO.inBook }</textarea>
					</td>
				</tr>

				<tr>
					<td align="center" valign="middle" height="30px"><label
						for="출판연도">출판연도</label></td>
					<td><input type="text" name="publishing" size="20"
						required="required" value="${bookDTO.publishing }"></td>
					<td align="center" valign="middle" height="30px"><label for="">출판사의
							서평</label></td>
					<td><textarea name="publishReview" cols="35" rows="5">${bookDTO.publishReview }</textarea>
					</td>
				</tr>

				<tr>
					<td align="center" valign="middle" height="30px"><label for="">페이지</label>
					</td>
					<td><input type="text" name="bookPage" size="20"
						required="required" value="${bookDTO.bookPage }"></td>
				</tr>

			</table>

		</div>
		<input type="hidden" name="registNum" value="${bookDTO.registNum }">
		
		<input type="button" name="success" value="완료" class="btn-do"
			onclick="updateCheck()"><br> <a href="bookManage.jsp">이전으로</a>
	</form>
</body>
</html>