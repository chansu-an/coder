<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
var test = true
function testttt() {
	
	alert(test);
	if(test){
		document.getElementById('test1').className = 'navbar-collapse collapse show';
		 test = false;
	}else{
		document.getElementById('test1').className = 'navbar-collapse collapse';
		 test = true;
		
	}
	
};
</script>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<div class="wrapper ">

		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<!-- End Navbar -->

			<!-- Page content-->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4>신고삭제글</h4>
							</div>
							<div class="card-body">
								<div class="table2-responsive">
									<table class="board_view">
										<colgroup>
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="15%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">글번호</th>
												<td>${map.BOARD_NO }</td>
												<th scope="row">작성자</th>
												<td>${map.NICK_NAME }</td>
											</tr>
											<tr>
												<th scope="row">작성일</th>
												<td>${map.BOARD_DATE }</td>
												<th scope="row">조회수</th>
												<td>${map.READ_COUNT }</td>
											</tr>
											<tr>
												<th scope="row">추천수</th>
												<td>${map.RECOMMEND_COUNT }</td>
												<th scope="row">신고수</th>
												<td>${map.REPORT_COUNT }</td>
											</tr>
											<tr>
												<th scope="row">제목</th>
												<td colspan="3">${map.TITLE }</td>
											</tr>
											<tr>
												<td colspan="4">${map.CONTEXT }</td>
											</tr>
										</tbody>
									</table>
									<br />
									<div>
										<a href="../board/adminList.do?R_PAG_NUM=1&D_PAG_NUM=1" class="btn" id="adminList">목록보기</a>
									</div>
									<br />
									<!-- 댓글 리스트 -->
									<section class="mb-5">
										<div class="card bg-light">
											<div id="reply">
												<div class="card-header">
													<i class="far fa-comment-dots"></i> 댓글
													<c:out value="${count}"></c:out>
												</div>
											</div>
											<div class="card-body">
												<!-- Single comment-->
												<c:if test="${bestcomment.RECOMMAND_COUNT != null }">
													<div class="d-flex">
														<div class="flex-shrink-0">
															<i class="fas fa-star fa-lg" style="color: currentcolor"></i>
														</div>
														<div class="ms-3">
															<div class="fw-bold">${bestcomment.NICK_NAME}/${bestcomment.REPLY_DATE }</div>
															${bestcomment.CONTEXT}
														</div>
													</div>
													<br />
												</c:if>
												<!-- Comment with nested comments-->
												<c:forEach items="${list}" var="row" varStatus="var">
													<c:choose>
														<c:when test="${row.DEL_GB == 'N' }">
															<input type="hidden" id="REF_NO_${var.index }" value="${row.REF_NO}" />
															<input type="hidden" id="REF_STEP_${var.index }" value="${row.REF_STEP}" />
															<div class="d-flex mb-4">
																<!-- Parent comment-->
																<div class="ms-3">
																	<div class="fw-bold">${row.NICK_NAME}/${row.REPLY_DATE }</div>
																	<div onclick="com(${row.RE_NO}, ${var.index })">${row.CONTEXT}</div>
																</div>
																<c:if test="${row.USER_NO == sessionScope.session.USER_NO }">
			               &nbsp;<a href="/net/board/commentDelete.do?RE_NO=${row.RE_NO }&BOARD_NO=${map.BOARD_NO}&IDENTI_TYPE=${map.IDENTI_TYPE}"><i class="fas fa-trash"></i></a>
																</c:if>
																<c:if test="${!empty sessionScope.session.USER_NO}">
						   &nbsp;<a href="#this" onclick="fn_recommendComment(${var.index});"><i class="fas fa-thumbs-up"></i></a>
																</c:if>
															</div>
															<c:if test="${!empty sessionScope.session.USER_NO }">
																<div id="coms${row.RE_NO}"></div>
															</c:if>
														</c:when>
														<c:otherwise>
															<div class="d-flex mb-4">
																<div class="ms-3">
																	<div class="fw-bold">[삭제된 댓글입니다]</div>
																</div>
															</div>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</div>
										</div>
							</section>
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