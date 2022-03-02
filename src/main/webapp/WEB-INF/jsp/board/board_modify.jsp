<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
					<td colspan="4"><textarea rows="20" cols="100" title="내용" id="CONTEXT" name="CONTEXT">${map.CONTEXT }</textarea></td>
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

	<a href="#this" class="btn" id="addFile">파일 추가</a>
	<a href="javascript:window.history.back();" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>

	<br/>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	var gfv_count = '${fn:length(filelist)+1}';
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
			fn_addFile();
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
		var str = "<p>" +
				"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
				"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
			"</p>";
		$("#fileDiv").append(str);
		$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}
	
	function fn_deleteFile(obj){
		obj.parent().remove();
	}
	
	function fn_test(test, index){
		var str1 = "<input type='hidden' id='delete_" + index +"' name='delete_" + index +"' value='" + test + "'/>";
		$("#fileDiv").append(str1);
	}
	

		
	</script>
</body>
</html>