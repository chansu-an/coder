<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
								<!-- 게시판 -->
								<h2>작업일지 수정</h2>
								<div class="card-body">
									<div class="table2-responsive">
	<form id="frm" name="frm" enctype="multipart/form-data">
	<input type="hidden" id="PROJECT_NO" name="PROJECT_NO" value="${param.PROJECT_NO }">
				
				<table class="board_view">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">작성자</th>
							<td>${map.USER_NO }</td>
						</tr>
						<tr>
							<th scope="row">업무 제목</th>
							<td colspan="3"><input type="text" id="PD_TITLE"
								name="PD_TITLE" class="wdp_90" value="${map.PD_TITLE}" /></td>
						</tr>
						<tr>
							<th scope="row">진행도 : </th>
							<td><select id="PD_ING" name="PD_ING">
							<option value="start">진행예정</option>
							<option value="ing">진행중</option>
							<option value="final">완료</option>
							</select></td>
							<th scope="row">중요도 : </th>
							<td><select id="PD_IMPORT" name="PD_IMPORT">
								<option value="waring">긴급</option>
								<option value="middle">중간</option>
								<option value="row">낮음</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">시작일</th>
							<td colspan="3"><input type="date" id="PD_START"
								name="PD_START" pattern="yyyy/mm/dd" class="wdp_90"
								value="${map.PD_START }" /></td>
						</tr>
						<tr>
							<th scope="row">종료일</th>
							<td colspan="3"><input type="date" id="PD_END"
								name="PD_END" pattern="yyyy/mm/dd" class="wdp_90"
								value="${map.PD_END }" /></td>
						</tr>
						<tr>
							<td colspan="4">
							<textarea rows="20" cols="100" title="내용" id="PD_CONTEXT" name="PD_CONTEXT">${map.PD_CONTEXT }</textarea>
							<script type="text/javascript">
								 CKEDITOR.replace('PD_CONTEXT'
								                , {height: 500                                                  
								                 });
							</script>
							</td>
						</tr>
						<!-- <tr>
							<td scope="row">첨부파일</td>
						</tr>
						<c:forEach var="row" items="${list }">
							<tr>
								<td colspan="3">${row.PBO_NAME }<input type="file"
									id="PBO_NAME" name="PBO_NAME" class="wdq_90"
									value="${map.PBO_NAME }" />
								</td>
							</tr>
						</c:forEach> -->
						<tr>
							<th scope="row">첨부파일</th>
							<td colspan="3">
								<div id="fileDiv">
									<c:forEach var="row" items="${list }" varStatus="var">
										<p>
											<input type="hidden" id="PF_NO" name="PF_NO_${var.index }"
												value="${row.PF_NO }"> <a href="#this"
												id="name_${var.index }" name="name_${var.index }">${row.POF_NAME }</a>
											<input type="file" id="file_${var.index }"
												name="file_${var.index }"> (${row.PF_SIZE }kb) <a
												href="#this" class="btn" id="delete_${var.index }"
												name="delete_${var.index }">삭제</a>
										</p>
									</c:forEach>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<a href="#this" class="btn"	id="addFile"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-arrow-up" viewBox="0 0 16 16">
  <path d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707V11.5z"/>
  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
</svg> 파일추가</a>
				<a href="../Team/Detail.do?PROJECT_NO=${param.PROJECT_NO}&PD_BOARD_NO=${map.PD_BOARD_NO}" class="btn" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 목록으로</a> 
				<a href="#this" class="btn" id="update"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
</svg> 수정하기</a> 
			</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
	
		$(document).ready(function() {
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});

			$("#addFile").on("click", function(e) { //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});

			$("a[name^='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});

		});
		

		function fn_addFile() {
			if (gfv_count >= 6) { //파일 수 제한 
				alert("파일수를 초과했습니다")
				return;
			}
			
		
		
			var str = "<p>" + "<input type='file' id='file_" + (gfv_count)
					+ "' name='file_" + (gfv_count) + "'>"
					+ "<a href='#this' class='btn' id='delete_" + (gfv_count)
					+ "' name='delete_" + (gfv_count) + "'>삭제</a>" + "</p>";
			$("#fileDiv").append(str);
			$("#delete_" + (gfv_count)).on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});++gfv_count

		}

		function fn_deleteFile(obj) {
			--gfv_count
			obj.parent().remove();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/Team/Modify.do?PD_BOARD_NO=${map.PD_BOARD_NO}' />");
			comSubmit.submit();
		}
	</script>

</body>
</html>