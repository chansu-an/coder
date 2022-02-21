<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%> 

                <!-- Page content-->
  
	<h2>신고글 목록</h2>
	<table class="report_list">
		<colgroup>
			<col width="*%" />
			<col width="15%" />
			<col width="10%" />
			<col width="20%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">신고수</th>
				<th scope="col">작성일</th>
				<th scope="col">복구하기</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list1) > 0}">
					<c:forEach items="${list1 }" var="row">
						<tr>
							<td><a href="/net/board/adminDetail.do?BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a></td>
							<td>${row.NICK_NAME }</td>
							<td>${row.REPORT_COUNT }</td>
							<td>${row.BOARD_DATE }</td>
							<td><a href="/net/board/reset.do?BOARD_NO=${row.BOARD_NO }" class="btn" id="reset">복구하기</a></td><!-- REPORT_COUNT = 0 -->
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
	<p>
	<h2>삭제글 목록</h2>
	<table class="QnA_list">
		<colgroup>
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">복구하기</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list2) > 0}">
					<c:forEach items="${list2 }" var="row">
						<tr>
							<td><a href="/net/board/adminDetail.do?BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a></td>
							<td>${row.NICK_NAME }</td>
							<td>${row.BOARD_DATE }</td>
							<td><a href="/net/board/restore.do?BOARD_NO=${row.BOARD_NO }" class="btn" id="restore">복구하기</a></td><!-- del_gb = 'N' -->
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
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>