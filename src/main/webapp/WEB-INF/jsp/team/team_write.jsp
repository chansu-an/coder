<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="/net/js/ckeditor/ckeditor.js"></script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
<body>
<div class="wrapper ">

		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
							<h2>프로젝트 작성</h2>
				<!-- Page content-->
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
								<td colspan="4">
								<textarea rows="20" cols="100" title="내용" id="PD_CONTEXT" name="PD_CONTEXT"></textarea>
								<script type="text/javascript">
								 CKEDITOR.replace('PD_CONTEXT'
								                , {height: 500                                                  
								                 });
								</script>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="fileDiv">
						<p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-upload" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z"/>
  <path fill-rule="evenodd" d="M7.646 4.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V14.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3z"/>
</svg>						<input type="file" id="file" name="file_0"> <a href="#this"
								class="btn" id="delete" name="delete"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg> 삭제</a>
				
						</p>
					</div>
					<a onclick="fn_addFile()" class="btn" id="addFile"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-arrow-up" viewBox="0 0 16 16">
  <path d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707V11.5z"/>
  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
</svg> 파일추가</a> 
					<a href="#this" class="btn" id="update"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
</svg> 작성하기</a>
						<a href="../Team/List.do?PROJECT_NO=${param.PROJECT_NO }"class="btn" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
				  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
				</svg> 목록으로</a>
				
				</form>
					<br /> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
<script type="text/javascript">
	var gfv_count = 1;
	$(document).ready(function(){
		$("#update").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			fn_updateBoard();
		});
	});
	function fn_addFile() {
		if (gfv_count >= 6) { //파일 수 제한 
			alert("파일수를 초과했습니다")
			return;

		}

		var str = "<p><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-cloud-upload' viewBox='0 0 16 16'>"
				+ "<path fill-rule='evenodd' d='M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z'/>"
				+ "<path fill-rule='evenodd' d='M7.646 4.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V14.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3z'/></svg> "
				+ "<input type='file' name='file_" + (gfv_count)
				+ "'><a href='#this' class='btn' name='delete'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash-fill' viewBox='0 0 16 16'>"
				+ "<path d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z'/></svg> 삭제</a></p>";

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
	
	function fn_updateBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/Team/Write.do' />");
		comSubmit.submit();
	}
</script>
</body>
</html>