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

        <form id="frm" name="frm" enctype="multipart/form-data">
        <input type="hidden" name="IDENTI_TYPE" value="${map.IDENTI_TYPE }"/>
        <input type="hidden" name="BOARD_NO" value="${map.BOARD_NO }"/>
        <h2>게시글 수정</h2>
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
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>

	<br/>
	<br/>
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
		var str = "<p>" +
				"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
				"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
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