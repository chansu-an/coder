<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script>
	function test1(f){
		$('input[name=SEARCH_TYPE]').attr('value',f);
	}
</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

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
								<h2>프로젝트 게시판</h2>								
							<div align="right">
							<a href="../Project/ProjectS.do" class = "btn">시작예정 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar2-plus" viewBox="0 0 16 16">
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z"/>
  <path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4zM8 8a.5.5 0 0 1 .5.5V10H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V11H6a.5.5 0 0 1 0-1h1.5V8.5A.5.5 0 0 1 8 8z"/>
</svg></a>
							<a href="../Project/Project.do" class = "btn">진행중</a>
							<a href="../Project/ProjectE.do" class = "btn">종료</a>
							<div class="card-body">
								<div class="table2-responsive">
									<table class="table">
											<div align="left">
													<h3>프로젝트 게시판</h3>
													<div align="right">
													<h5>시작예정인 프로젝트입니다.</h5>
													</div>
										<colgroup>
											<col width="15%" />
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

												<c:when test="${fn:length(list1) > 0}">
													<!-- 진행예정 프로젝트 -->
													<c:forEach items="${list1 }" var="row">
														<tr>
															<td>${row.ROWNUM }</td>
															<%-- <td>${row.PROJECT_NAME }</td> --%>
															<td><a
																href="../Project/Detail.do?PROJECT_NO=${row.PROJECT_NO }&USER_NO=${session.USER_NO}">${row.PROJECT_NAME}</a>
															<td>${row.PROJECT_START }</td>
															<td>${row.PROJECT_END }</td>
															<td>${row.PROJECT_MEMBER }</td>
															<td>${row.USER_NO }</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="10">조회된 결과가 없습니다.</td>
														
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<form action="../Project/ProjectS.do" method="get">
										<div class="search-wrap">
											<select id="SEARCH_TYPE" name="SEARCH_TYPE"	onchange="test1(this.value);">
												<option value="PROJECT_NAME"
													<c:if test="${param.SEARCH_TYPE == 'PROJECT_NAME'}">selected</c:if>>제목</option>
												<option value="PROJECT_CONTEXT"
													<c:if test="${param.SEARCH_TYPE == 'PROJECT_CONTEXT'}">selected</c:if>>내용</option>
												<option value="NICKNAME"
													<c:if test="${param.SEARCH_TYPE == 'NICKNAME'}">selected</c:if>>작성자</option>
												<option value="T+C"
													<c:if test="${param.SEARCH_TYPE == 'T+C'}">selected</c:if>>제목+내용</option>
											</select>
											<input type="text" id="KEYWORD" name="KEYWORD" value="${param.KEYWORD }"/>
											<input type="submit" value="검색" class="btn bin-info search-btn" />
														
										</div>												
									</form>
										<div align="left">
												<a href="../Project/Write.do" class="btn" id="write"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg> 글쓰기</a>
									<div style="padding-left: 50%; padding-right: 50%;">
												<c:if test="${param.KEYWORD==null}">
													<nav>
														<ul class="pagination">
															<c:if test="${map.startpag>1}">
																<li><a
																	href="../Project/Project.do?PAG_NUM=${map.startpag-10}"
																	aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
															</c:if>
															<c:forEach var="i" begin="${map.startpag }"
																end="${map.endpage }">
																<li id="${i }" class=""><a href="../Project/Project.do?PAG_NUM=${i}">${i}</a></li>
															</c:forEach>
															<c:if test="${map.endpage<map.maxpag}">
																<li><a
																	href="../Project/Project.do?PAG_NUM=${map.startpag+10}"
																	aria-label="Next"><span aria-hidden="true">&laquo;</span></a></li>
															</c:if>
														</ul>
													</nav>
													</c:if>
													<c:if test="${param.KEYWORD!=null}">
													<nav>
														<ul class="pagination">
															<c:if test="${map.startpag>1}">
																<li><a
																	href="../Project/Project.do?PAG_NUM=${map.startpag-10}&KEYWORD=${param.KEYWORD}"
																	aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
															</c:if>
															<c:forEach var="i" begin="${map.startpag }"
																end="${map.endpage }">
																<li><a href="../Project/Project.do?PAG_NUM=${i}&KEYWORD=${param.KEYWORD}">${i}</a></li>
															</c:forEach>
															<c:if test="${map.endpage<map.maxpag}">
																<li id="${i }" class=""><a
																	href="../Project/Project.do?PAG_NUM=${map.startpag+10}&KEYWORD=${param.KEYWORD}"
																	aria-label="Next"><span aria-hidden="true">&laquo;</span></a></li>
															</c:if>
														</ul>
													</nav>
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
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
<script type="text/javascript">
	$(window).load (function() {
		var ch = 1;

		ch = ${param.PAG_NUM}
		document.getElementById(ch).className = 'active'
	});
	</script>
</body>
</html>