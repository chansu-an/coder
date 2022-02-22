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
	<h2>프로젝트 게시판</h2>
	<table class="project_board_list">
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
				<th scope="col">프로젝트 번호</th>
				<th scope="col">제목</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
				<th scope="col">인원수</th>
				<th scope="col">관리자</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.ROWNUM }</td>
							<%-- <td>${row.PROJECT_NAME }</td> --%>
							<td><a href="../Project/Detail.do?PROJECT_NO=${row.PROJECT_NO }">${row.PROJECT_NAME}</a>
							<td>${row.PROJECT_START }</td>
							<td>${row.PROJECT_END }</td>
							<td>${row.PROJECT_MEMBER }</td>
							<td>${row.USER_NO }</td>
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
	<div align="center">
			<c:if test="${map.startpag>1}">
				<a
					href="../Project/Project.do?PAG_NUM=${map.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${map.startpag }" end="${map.endpage }">
				<a href="../Project/Project.do?PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${map.endpage<map.maxpag}">
				<a
					href="../Project/Project.do?PAG_NUM=${map.startpag+2}">다음</a>
			</c:if>
		</div>
	<a href="../Project/Write.do" class="btn" id="write">프로젝트 생성</a>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>