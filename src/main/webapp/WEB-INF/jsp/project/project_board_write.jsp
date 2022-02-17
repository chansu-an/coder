<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">Start
				Bootstrap</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Dashboard</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Shortcuts</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Overview</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Events</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Profile</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Status</a>
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
			<!-- Page content-->
			<h2>프로젝트 작성</h2>
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<table class="project_view">
					<colgroup>
						<col width="15%" />
						<col width="*%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" id="TITLE" name=PROJECT_NAME class="wdp_90"></input></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td><input type="date" name="PROJECT_START"></td>
							<th>종료일</th>
							<td><input type="date" name="PROJECT_END"></td>
						</tr>
						<tr>
							<th>필요인원</th>
							<td><input type="text" name="PROJECT_MEMBER" ></td>
						</tr>

						<tr>
							<td colspan="2" class="view_text">
							<textarea rows="20" cols="100" title="내용" id="PROJECT_CONTEXT" name="PROJECT_CONTEXT"></textarea></td>
						</tr>
					</tbody>
				</table>
			 	<div id="fileDiv">
					<p>
						<input type="file" id="file" name="file_0"> <a
							href="#this" class="btn" id="delete" name="delete">삭제</a>
					</p>
				</div> 
				<br />
				<br /> 
				<a href="/net//project/ProjectFile.do" class="btn" id="addFile">파일 추가</a> 
				<input type="submit" value = "작성하기"> 
				<a href="/net//Project.do" class="btn" id="list">목록으로</a>
			</form>
		</div>

		<br />

		<%@ include file="/WEB-INF/include/include-body.jspf"%>
		 <script type="text/javascript">
		var gfv_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openProjectList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertProject();
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
			comSubmit.submit();
		}
		
		function fn_boardWrite(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
			comSubmit.submit();
		}
		
		function fn_addFile(){
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		}
	</script> 
</body>
</html>