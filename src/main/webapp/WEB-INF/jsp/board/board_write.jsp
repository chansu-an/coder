<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<script type="text/javascript">
	function test(value){
		 document.getElementById('IDENTI_TYPE').value = value;
	}	
	
</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<body>
<!-- Page content-->
			<h2>게시판 작성</h2>
			<form action="/net/board/insertBoard.do" id="frm" name="frm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="USER_NO" name="USER_NO" value="${sessionScope.session.USER_NO }"/>
				<table class="board_view">
					<colgroup>
						<col width="15%" />
						<col width="60%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" id="TITLE" name="TITLE"></input></td>
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
							<td colspan="2" class="view_text">
							<textarea rows="20" cols="100" title="내용" id="CONTEXT" name="CONTEXT"></textarea></td>
						</tr>
					</tbody>
				</table>
				<br />
				<div id="fileDiv" class="fileDiv">
				
				</div>
				<br /> 
				<div class="addInput">
					<button type="button" class="btnAdd">파일추가</button>
					<input type="submit" value="작성하기"/>				
					<a href="javascript:window.history.back();" class="btn" id="list">목록으로</a>
				</div>
			</form>

		<br />

		<%@ include file="/WEB-INF/include/include-body.jspf"%>
		<script type="text/javascript">
		var file_count = 0;
		$(document).ready (function(){
			$('.btnAdd').click(function(){
				$('.fileDiv').append(					
					'<input type="file" id="file" name="file_'+(file_count++)+'" >\<button type="button" class="btnRemove">삭제</button><br>'
				);
				$('.btnRemove').on('click', function(){
					$(this).prev().remove();
					$(this).next().remove();
					$(this).remove();
				})
			});
		});
		
	</script>
</body>
</html>