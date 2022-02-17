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
	<div align="center">
			<c:if test="${smap.startpag>1}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${smap.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${smap.startpag }" end="${smap.endpage }">
				<a href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${smap.endpage<smap.maxpag}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${smap.startpag+2}">다음</a>
			</c:if>
		</div>
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
		<div align="center">
			<c:if test="${smap2.startpag>1}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&P_PAG_NUM=${smap2.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${smap2.startpag }" end="${smap2.endpage }">
				<a href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&P_PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${smap2.endpage<smap.maxpag}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&P_PAG_NUM=${smap2.startpag+2}">다음</a>
			</c:if>
		</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>