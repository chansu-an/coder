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
									<a href="../Project/Write.do" class="btn" id="write">글쓰기</a>
								</c:if>
							</div>
							<div align="right">
							<a href="../Project/ProjectS.do">시작예정</a>
							<a href="../Project/Project.do">진행중</a>
							<a href="../Project/ProjectE.do">종료</a>
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
												<c:when test="${fn:length(list2) > 0}">
													<!-- 종료 프로젝트 -->
													<c:forEach items="${list2 }" var="row">
														<tr>
															<td>${row.ROWNUM }</td>
															<%-- <td>${row.PROJECT_NAME }</td> --%>
															<td><a
																href="../Project/Detail.do?PROJECT_NO=${row.PROJECT_NO }">${row.PROJECT_NAME}</a>
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
									<form action="../Project/Project.do" method="get">
										<div class="search-wrap">
											<select id="SEARCH_TYPE" name="SEARCH_TYPE"
												onchange="test1(this.value);">
												<option>검색</option>
												<option value="PROJECT_NAME"
													<c:if test="${searchType == 'PROJECT_NAME'}">selected</c:if>>제목</option>
												<option value="PROJECT_CONTEXT"
													<c:if test="${searchType == 'PROJECT_CONTEXT'}">selected</c:if>>내용</option>
												<option value="NICKNAME"
													<c:if test="${searchType == 'NICKNAME'}">selected</c:if>>작성자</option>
												<option value="T+C"
													<c:if test="${searchType == 'T+C'}">selected</c:if>>제목+내용</option>
											</select><input type="text" id="KEYWORD" name="KEYWORD"
												value="${keyWord }"></input> <input type="submit" value="검색"
												class="btn bin-info search-btn" />
										</div>
									</form>
									<div align="center">
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