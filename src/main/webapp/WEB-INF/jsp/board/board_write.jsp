<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<script type="text/javascript">
	function test(value){
		 document.getElementById('IDENTI_TYPE').value = value;
	}	
	
</script>
<script type="text/javascript" src="/net/js/ckeditor/ckeditor.js"></script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
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
							<h2>게시판 작성</h2>
<!-- Page content-->
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="USER_NO" name="USER_NO" value="${sessionScope.session.USER_NO }"/>
				<table class="board_view">
					<colgroup>
						<col width="15%" />
						<col width="30%" />
						<col width="15%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" id="TITLE" name="TITLE"></input></td>
							<th scope="row">게시글 종류</th>
							<td>
								<input type="hidden" id="IDENTI_TYPE" name="IDENTI_TYPE" value=""/>
								<select name="select_type" onChange="test(this.options[this.selectedIndex].value);">
							    <option value="">선택해주세요.</option>
							    <c:if test="${sessionScope.session.ADMIN == 'Y' }">
							    <option value="1" >공지사항</option>
							    </c:if>
							    <option value="2" >QnA</option>
							    <option value="3" >자유게시판</option>
							    <option value="4" >건의사항</option>
							</select>
							</td>
						</tr>

						<tr>
							<td colspan="4">
							<textarea rows="20" cols="100" title="내용" id="CONTEXT" name="CONTEXT"></textarea>
							<script type="text/javascript">
							 CKEDITOR.replace('CONTEXT'
							                , {height: 500                                                  
							                 });
							</script>
							</td>
						</tr>
					</tbody>
				</table>
				<br />
				<div id="fileDiv" class="fileDiv">
				
				</div>
				<br /> 
				<div class="addInput">
					<a href="#" class="btn btnAdd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-arrow-up" viewBox="0 0 16 16">
  <path d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707V11.5z"/>
  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
</svg> 파일추가</a>
					<a href="#this" class="btn" id="update"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
</svg> 작성하기</a>
					<a href="javascript:window.history.back();" class="btn" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 목록으로</a>
				</div>
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
		<script type="text/javascript">
		var file_count = 0;
		$(document).ready (function(){
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$('.btnAdd').click(function(){
				if(file_count < 5){
					$('.fileDiv').append(					
						'<input type="file" id="file" name="file_'+(file_count++)+'" >\<button type="button" class="btnRemove">삭제</button><br>'
					);
					$('.btnRemove').on('click', function(){
						$(this).prev().remove();
						$(this).next().remove();
						$(this).remove();
						file_count--;
					})					
				}else{
					alert("첨부파일은 최대 5개까지 입니다.");
				}
			});
		});
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
			comSubmit.submit();
		}
		
	</script>
</body>
</html>