<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">Coders</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">공지사항</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">QnA 게시판</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">자유게시판</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">프로젝트</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">건의사항</a>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<button class="btn btn-primary" id="sidebarToggle">Toggle
						Menu</button>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
								role="button" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Dropdown</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#!">Action</a> <a
										class="dropdown-item" href="#!">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#!">Something else here</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<form method="post" enctype="multipart/form-data">
				<h2>게시글 수정</h2>
				<table class="board_view">
					<colgroup>
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
							<th scope="row">진행도</th>
							<td colspan="3"><input type="text" id="PD_ING"
								name="PD_ING" class="wdp_90"
								value="${map..PD_ING }" /></td>
						</tr>
						<tr>
							<th scope="row">중요도</th>
							<td colspan="3"><input type="date" id="PD_IMPORT"
								name="PD_IMPORT" class="wdp_90"
								value="${map.PD_IMPORT }" /></td>
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
				<div id="fileDiv">
					<p>
						<a href="../Project/Team.do" class="btn" id="list">목록으로</a> <input
							type="submit" value="수정하기"> <a href="#this" class="btn"
							id="addFile">파일추가</a>

					</p>
				</div>



			</form>
		</div>
	</div>
	<br />
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
	
		$(document).ready(function() {

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
	</script>

</body>
</html>