<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
</head>


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
								<!-- Page content-->
								<h2>게시판 상세보기</h2>
								<table class=team_list>
									<colgroup>
										<col width="15%" />
										<col width="20%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="10%" />
										<col width="10%" />
										<col width="10%" />
									</colgroup>
									<thead class="text2-primary">
										<tr>
											<th scope="col">작업일지 번호</th>
											<th scope="col">업무제목</th>
											<th scope="col">작성자</th>
											<th scope="col">진행도</th>
											<th scope="col">중요도</th>
											<th scope="col">시작일</th>
											<th scope="col">종료일</th>
											<th scope="col">내용</th>
										</tr>

									</thead>
									<tbody>
										<c:choose>
											<c:when test="${!empty map}">
												<tr>
													<td>${map.PD_BOARD_NO}</td>
													<td>${map.PD_TITLE}</td>
													<td>${map.USER_NO}</td>
													<td>${map.PD_ING}</td>
													<td>${map.PD_IMPORT}</td>
													<td>${map.PD_START}</td>
													<td>${map.PD_END}</td>
													<td>${map.PD_CONTEXT}</td>
												</tr>
												<tr>
													<th scope="row">첨부파일</th>
													<td colspan="3"><c:forEach var="row" items="${list }">
															<p>
																<input type="hidden" id="PF_NO" value="${row.PF_NO }">
																<a
																	href="../common/downloadTeamFile.do?PF_NO=${row.PF_NO }">${row.PF_NO },${row.POF_NAME}</a>
																(${row.PF_SIZE }kb)
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<a href="../Team/Modify.do?PD_BOARD_NO=${map.PD_BOARD_NO}" class="btn"
		id="write">수정하기</a>
	<a href="../Team/List.do?PROJECT_NO=${param.PROJECT_NO }" class="btn"
		id="list">목록으로</a>
	<a
		href="../Team/Delete.do?PD_BOARD_NO=${map.PD_BOARD_NO}&PROJECT_NO=${param.PROJECT_NO}"
		class="btn" id="delete">삭제하기</a>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>