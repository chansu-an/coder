<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
							<td colspan="4"><textarea rows="20" cols="100" title="내용"
									id="PD_CONTEXT" name="PD_CONTEXT">${map.PD_CONTEXT }</textarea></td>
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
				<a href="#this" class="btn"	id="addFile">파일추가</a>
				<a href="../Team/Detail.do?PROJECT_NO=${param.PROJECT_NO}&PD_BOARD_NO=${map.PD_BOARD_NO}" class="btn" id="list">목록으로</a> 
				<a href="#this" class="btn" id="update">수정하기</a> 
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