<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
								<c:if test="${!empty session.USER_NO }">
									<a href="../Team/Write.do" class="btn" id="write">글쓰기</a>
								</c:if>
									<div class="card-body">
										<div class="table2-responsive">
											<table class="table">

												<colgroup>
													<col width="10%" />
													<col width="*%" />
													<col width="10%" />
													<col width="10%" />
													<col width="20%" />
													<col width="20%" />
												</colgroup>
												<thead class="text2-primary">
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
																	<td><a
																		href="../Team/Detail.do?PROJECT_NO=${row.PROJECT_NO}&PD_BOARD_NO=${row.PD_BOARD_NO}">${row.PD_TITLE}</a>
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
											<form action="../Team/List.do" method="get">
												<div class="search-wrap">
													<select id="SEARCH_TYPE" name="SEARCH_TYPE"
														onchange="test1(this.value);">
														<option>검색</option>
														<option value="PD_TITLE"
															<c:if test="${searchType == 'PD_TITLE'}">selected</c:if>>제목</option>
														<option value="PD_CONTEXT"
															<c:if test="${searchType == 'PD_CONTEXT'}">selected</c:if>>내용</option>
														<option value="NICKNAME"
															<c:if test="${searchType == 'NICKNAME'}">selected</c:if>>작성자</option>
														<option value="T+C"
															<c:if test="${searchType == 'T+C'}">selected</c:if>>제목+내용</option>
													</select><input type="text" id="KEYWORD" name="KEYWORD"
														value="${keyWord }"></input> <input type="submit"
														value="검색" class="btn bin-info search-btn" />
												</div>
											</form>
											<%-- <div align="center">
												<c:if test="${map.startpag>1}">
													<a href="../Project/Project.do?PAG_NUM=${map.startpag-2}">이전</a>
												</c:if>
												<c:forEach var="i" begin="${map.startpag }"
													end="${map.endpage }">
													<a href="../Project/Project.do?PAG_NUM=${i}">[${i}]</a>
												</c:forEach>
												<c:if test="${map.endpage<map.maxpag}">
													<a href="../Project/Project.do?PAG_NUM=${map.startpag+2}">다음</a>
												</c:if>
											</div> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/include/include-body.jspf"%>
		<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>