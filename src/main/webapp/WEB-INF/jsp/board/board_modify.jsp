<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/net/js/ckeditor/ckeditor.js"></script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
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
								<h2>게시글 수정</h2>
								<div class="card-body">
									<div class="table2-responsive">
        <form id="frm" name="frm" enctype="multipart/form-data">
        <input type="hidden" name="IDENTI_TYPE" value="${map.IDENTI_TYPE }"/>
        <input type="hidden" name="BOARD_NO" value="${map.BOARD_NO }"/>
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${map.BOARD_NO }</td>
					<th scope="row">조회수</th>
					<td>${map.READ_COUNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.NICK_NAME }</td>
					<th scope="row">작성시간</th>
					<td>${map.BOARD_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map.TITLE }"/></td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea rows="20" cols="100" title="내용" id="CONTEXT" name="CONTEXT">${map.CONTEXT }</textarea>
						<script type="text/javascript">
						 CKEDITOR.replace('CONTEXT'
						                , {height: 500                                                  
						                 });
						</script>
					</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3">
						<div id="fileDiv">				
							<input type="hidden" name="filelsitlength" value="${fn:length(filelist) }"/>
							<c:forEach var="row" items="${filelist }" varStatus="var">
								<p>
									<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index }" value="${row.FILE_NO }">
									<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.ORIGINAL_FILE_NAME }</a>
									<input type="file" id="file_${var.index }" name="file_${var.index }"> 
									(${row.FILE_SIZE }kb)
									<a href="#this" onclick="fn_test(${row.FILE_NO},${var.index });"class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a>
								</p>
							</c:forEach>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<a href="#this" class="btn" id="addFile"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-arrow-up" viewBox="0 0 16 16">
  <path d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707V11.5z"/>
  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
</svg> 파일추가</a>
	<a href="javascript:window.history.back();" class="btn" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 이전으로</a>
	<a href="#this" class="btn" id="update"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
</svg> 저장하기</a>
	<a href="#this" class="btn" id="delete"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
</svg> 삭제하기</a>

	</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	let gfv_count = '${fn:length(filelist)+1}';
	let file_count = '${fn:length(filelist)}';
	$(document).ready(function(){
		$("#update").on("click", function(e){ //저장하기 버튼
			e.preventDefault();
			fn_updateBoard();
		});
		
		$("#delete").on("click", function(e){ //삭제하기 버튼
			e.preventDefault();
			fn_deleteBoard();
		});
		
		$("#addFile").on("click", function(e){ //파일 추가 버튼
			e.preventDefault();
			if(file_count < 5){
				fn_addFile();				
			}else{
				alert("첨부파일은 최대 5개까지 입니다.");
			}
		});
		
		$("#delete").on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});
	
	
	function fn_updateBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/board/modify.do' />");
		comSubmit.submit();
	}
	
	function fn_deleteBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/board/delete.do' />");
		comSubmit.submit();
		
	}
	
	function fn_addFile(){
		file_count++;
		var str = "<p><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-cloud-upload' viewBox='0 0 16 16'>"
				+ "<path fill-rule='evenodd' d='M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z'/>"
				+ "<path fill-rule='evenodd' d='M7.646 4.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V14.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3z'/></svg> "
				+ "<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"
				+ "<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash-fill' viewBox='0 0 16 16'>"
				+ "<path d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z'/></svg> "
				+ "삭제</a>" 
			"</p>";
		$("#fileDiv").append(str);
		$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
			file_count--;
		});
	}
	
	function fn_deleteFile(obj){
		obj.parent().remove();
	}
	
	function fn_test(test, index){
		var str1 = "<input type='hidden' id='delete_" + index +"' name='delete_" + index +"' value='" + test + "'/>";
		$("#fileDiv").append(str1);
		$("#delete_" + index).parent().remove();
		file_count--;
	}
	

		
	</script>
</body>
</html>