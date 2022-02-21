<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
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
							<th scope="row">제목</th>
							<td colspan="3"><input type="text" id="PROJECT_NAME"
								name="PROJECT_NAME" class="wdp_90" value="${map.PROJECT_NAME }" /></td>
						</tr>
						<tr>
							<th scope="row">참여 인원</th>
							<td colspan="3"><input type="text" id="PROJECT_MEMBER"
								name="PROJECT_MEMBER" class="wdp_90"
								value="${map.PROJECT_MEMBER }" /></td>
						</tr>
						<tr>
							<th scope="row">시작일</th>
							<td colspan="3"><input type="date" id="PROJECT_START"
								name="PROJECT_START" pattern="yyyy/mm/dd" class="wdp_90"
								value="${map.PROJECT_START }" /></td>
						</tr>
						<tr>
							<th scope="row">종료일</th>
							<td colspan="3"><input type="date" id="PEOJECT_END"
								name="PROJECT_END" pattern="yyyy/mm/dd" class="wdp_90"
								value="${map.PROJECT_END }" /></td>
						</tr>
						<tr>
							<td colspan="4"><textarea rows="20" cols="100" title="내용"
									id="PROJECT_CONTEXT" name="PROJECT_CONTEXT">${map.PROJECT_CONTEXT }</textarea></td>
						</tr>
						<tr>
							<td scope="row">첨부파일</td>
						</tr>
						<c:forEach var="row" items="${list }">
							<tr>
								<td colspan="3">${row.PBO_NAME }<input type="file"
									id="PBO_NAME" name="PBO_NAME" class="wdq_90"
									value="${map.PBO_NAME }" />
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<div id="fileDiv">
					<p>
						<input type="file" id="file" name="file_0"> <a
							href="../Project/Project.do" class="btn" id="list">목록으로</a> <a
							href="../Project/Delete.do" class="btn" id="delete">삭제하기</a> <input
							type="submit" value="수정하기"> <a onclick="fn_addFile()"
							class="btn" id="addFile">파일추가</a>
					</p>
				</div>



			</form>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
		
	</script>

</body>
</html>