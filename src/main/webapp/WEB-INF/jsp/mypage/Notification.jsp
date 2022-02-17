<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
<body>

	<h2>게시판 알림</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list1) > 0}">
					<c:forEach items="${list1 }" var="row">
						<tr>
							<td><a href="../Mypage/ArlistClick.do?BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a></td>
							<td>새로운 댓글이 달렸습니다</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">새로운 알림이 없습니다</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
	<h2>프로젝트 알림</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list2) > 0}">
					<c:forEach items="${list2 }" var="row">
						<tr>
							<td><a href="../Mypage/ProjectArClick.do?PROJECT_NO=${row.PROJECT_NO}">${row.PROJECT_NAME}</a></td>
							<td>새로운 작업일지가 작성되었습니다</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">새로운 알림이 없습니다</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
	
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>