<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
			<!-- Page content-->
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
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
			<input type = "hidden" name = "USER_NO" value = "${sessionScope.session.USER_NO }">
				<table class="board_view">
					<colgroup>
						<col width="15%" />
						<col width="*%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" id="TITLE" name=PROJECT_NAME
								class="wdp_90"></input></td>
						</tr>

						<tr>
							<th>시작일</th>
							<td><input type="date" name="PROJECT_START"></td>
							</tr>
							<tr>
							<th>종료일</th>
							<td><input type="date" name="PROJECT_END"></td>
						</tr>
						<tr>
							<th>필요인원</th>
							<td><input type="text" name="PROJECT_MEMBER"></td>
						</tr>

						<tr>
							<td colspan="2" class="view_text"><textarea rows="20"
									cols="100" title="내용" id="PROJECT_CONTEXT"
									name="PROJECT_CONTEXT"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div id="fileDiv">
				
					<p> 
					
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-upload" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z"/>
  <path fill-rule="evenodd" d="M7.646 4.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V14.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3z"/>
</svg> <input type="file" id="file" name="file_0"> 
<!-- 파일삭제 -->
						  <a href="#this" class="btn" id="delete" name="delete"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg>파일삭제</a>

					</p>
				</div>
				<a onclick="fn_addFile()" class="btn"
					id="addFile">파일추가 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg> </a> 
					<input type="submit" class = "btn" value="작성하기"> 
					<a href="../Project/Project.do" class="btn" id="list"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 목록으로</a>
			</form>
	<br/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
		<script type="text/javascript">
		
		var gfv_count = 1;
		
		function fn_addFile(){if(gfv_count>=6){  //파일 수 제한 
			alert("파일수를 초과했습니다")
			return;

		}

			var str = "<p><input type='file' name='file_"+(gfv_count)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";


			
			$("#fileDiv").append(str);
			
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
				
			});
			++gfv_count
		}
		
		function fn_deleteFile(obj){
			--gfv_count
			//alert(gfv_count)
			obj.parent().remove();
		}
	</script>
</body>
</html>