<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
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

			<!-- content -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-plain">
							<div class="card-header">
								<br />
								<h4 class="card-title">회원 관리</h4>
							</div>
							<div class="card-body">
								<div class="table2-responsive">
									<table class="table">
										<thead class=" text2-primary">
											<tr>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">닉네임</th>
												<th scope="col">이메일</th>
												<th scope="col">탈퇴여부</th>
												<th scope="col">신고복구</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(list) > 0}">
													<c:forEach items="${list }" var="row">
														<tr>
															<td>${row.ROWNUM}</td>
															<td><a href="../main/Mypage.do?USER_NO=${row.USER_NO }">${row.NICK_NAME }</a></td>
															<td>${row.EMAIL}</td>
															<td><c:choose>
																	<c:when test="${row.DEL_GB == 'Y'}">
																		<a href="/net/main/restoreUser.do?USER_NO=${row.USER_NO }" class="btn" id="restore">복구하기</a>
																	</c:when>
																	<c:when test="${row.ADMIN == 'Y'}">
																		<input type='button' disabled='disabled' value='관리자' />
																	</c:when>
																	<c:otherwise>
																		<input type='button' disabled='disabled' value='일반회원' />
																	</c:otherwise>
																</c:choose></td>
															<td><c:choose>
																	<c:when test="${row.USER_STOP == 'Y'}">
																		<a href="/net/main/returnUserDisabled.do?USER_NO=${row.USER_NO }" class="btn" id="return">정지복구</a>
																	</c:when>
																</c:choose></td>
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

									<div style="padding-left: 50%; padding-right: 50%;">
										<nav>
											<ul class="pagination">
												<c:if test="${map.startpag>1}">
													<li><a href="../main/UserList.do?PAG_NUM=${map.startpag-2}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
												</c:if>
												<c:forEach var="i" begin="${map.startpag }" end="${map.endpage }">
													<li id="${i}" class=""><a href="../main/UserList.do?PAG_NUM=${i}">${i}</a></li>
												</c:forEach>
												<c:if test="${map.endpage<map.maxpag}">
													<li><a href="../main/UserList.do?PAG_NUM=${map.startpag+2}" aria-label="Next"><span aria-hidden="true">&laquo;</span></a></li>
												</c:if>
											</ul>
										</nav>
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