<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
	<h2>작업일지 게시판</h2>
	<table class="tema_list">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">작업일지 번호</th>
				<th scope="col">제목</th>
				<th scope="col">진행도</th>
				<th scope="col">담당자</th>
				<th scope="col">마감일</th>
				<th scope="col">중요도</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.PD_BOARD_NO }</td>
							<%-- <td>${row.PROJECT_NAME }</td> --%>
							<td><a href="../Project/Team/Detail.do?PD_BOARD_NO=${row.PD_BOARD_NO }">${row.PD_TITLE}</a>
							<td>${row.PD_ING }</td>
							<td>${row.USER_NO }</td>
							<td>${row.PD_END  }</td>
							<td>${row.PD_IMPORT }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
	<a href="../Project/Team/Write.do" class="btn" id="write">프로젝트 생성</a>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>