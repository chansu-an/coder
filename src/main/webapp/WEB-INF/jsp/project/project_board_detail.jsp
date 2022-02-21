<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
	<h2>게시판 상세보기</h2>
	<table class=project_board_list>
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">프로젝트 번호</th>
				<th scope="col">프로젝트 제목</th>
				<th scope="col">작성자</th>
				<th scope="col">내용</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
				<th scope="col">인원수</th>
			</tr>
			
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty map}">
					<tr>
						<td>${map.PROJECT_NO}</td>
 						<td>${map.PROJECT_NAME}</td>
						<td>${map.USER_NO}</td>
						<td>${map.PROJECT_CONTEXT}</td>
						<td>${map.PROJECT_START}</td>
						<td>${map.PROJECT_END}</td>
						<td>${map.PROJECT_MEMBER}</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="3">
						
						<c:forEach var="row" items="${list }">
						<p>
							<input type="hidden" id="PBF_NO" value="${row.PBF_NO }">
							<a href="../common/downloadProjectFile.do?PBF_NO=${row.PBF_NO }"  >${row.PBF_NO },${row.PBO_NAME}</a> 
							(${row.PBF_SIZE }kb)
						</p>
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
	<a href="../Project/Modify.do?PROJECT_NO=${map.PROJECT_NO}" class="btn" id="write">수정하기</a>
	<a href="../Project/Project.do" class="btn" id="list">목록으로</a>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>