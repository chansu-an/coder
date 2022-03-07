<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<!-- Page content-->
<h2>프로젝트 작성</h2>
<form id="frm" name="frm" method="post" enctype="multipart/form-data">
<input type = "hidden" name = "PROJECT_NO" value = "${param.PROJECT_NO}">
<input type = "hidden" name = "USER_NO" value = "${sessionScope.session.USER_NO}">
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="30%" />
			<col width="30%" />
			<col width="25%" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">작업일지 제목</th>
				<td colspan="4"><input type="text" id="TITLE" name=PD_TITLE class="wdp_90"></input></td>
			</tr>

			<tr>
				
				<th scope="row">진행도</th>
				<td colspan="4">
				<select id="PD_ING" name="PD_ING">
						<option value="start">진행예정</option>
						<option value="ing">진행중</option>
						<option value="final">완료</option>
				</select>
				</td>
			</tr>
			<tr>				
				<th scope="row">중요도</th>
				<td colspan="4">
				<select id="PD_IMPORT" name="PD_IMPORT">
					<option value="waring">긴급</option>
					<option value="middle">중간</option>
					<option value="row">낮음</option>
				</select>
				</td>
			</tr>
				
			<tr>
				<th>시작일</th>
				<td colspan="4"><input type="date" name="PD_START"></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td colspan="4"><input type="date" name="PD_END"></td>
			</tr>
			<tr>
				<td colspan="4" class="view_text"><textarea rows="20"
						cols="100" title="내용" id="PD_CONTEXT" name="PD_CONTEXT"></textarea></td>
			</tr>
		</tbody>
	</table>
	<div id="fileDiv">
		<p>
			<input type="file" id="file" name="file_0"> <a href="#this"
				class="btn" id="delete" name="delete">삭제</a>

		</p>
	</div>
	<br /> <a onclick="fn_addFile()" class="btn" id="addFile">파일추가</a> 
		<input type="submit" class = "btn" value="작성하기"> 
		<a href="../Team/List.do?PROJECT_NO=${param.PROJECT_NO }"class="btn" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 목록으로</a>
	<br /> <br /> 

</form>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
<script type="text/javascript">
	var gfv_count = 1;

	function fn_addFile() {
		if (gfv_count >= 6) { //파일 수 제한 
			alert("파일수를 초과했습니다")
			return;

		}

		var str = "<p><input type='file' name='file_" + (gfv_count)
				+ "'><a href='#this' class='btn' name='delete'>삭제</a></p>";

		$("#fileDiv").append(str);

		$("a[name='delete']").on("click", function(e) { //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));

		});
		++gfv_count
	}

	function fn_deleteFile(obj) {
		--gfv_count
		//alert(gfv_count)
		obj.parent().remove();
	}
</script>
</body>
</html>