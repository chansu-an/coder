<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

</head>
<!-- Page content-->
<body>

	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="card-header">
						<br />
						<h4 class="card-title">신고글 목록</h4>
					</div>
					<div class="card-body">
						<div class="table2-responsive">
							<table class="table">
								<thead class=" text2-primary">
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
													<td><a href="/net/board/reset.do?BOARD_NO=${row.BOARD_NO }" class="btn" id="reset">복구하기</a></td>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center">
		<c:if test="${rmap.startpag>1}">
			<a href="../board/adminList.do?R_PAG_NUM=${rmap.startpag-2}&D_PAG_NUM=${param.D_PAG_NUM}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${rmap.startpag }" end="${rmap.endpage }">
			<a href="../board/adminList.do?R_PAG_NUM=${i}&D_PAG_NUM=${param.D_PAG_NUM}">[${i}]</a>
		</c:forEach>
		<c:if test="${rmap.endpage<rmap.maxpag}">
			<a href="../board/adminList.do?R_PAG_NUM=${rmap.startpag+2}&D_PAG_NUM=${param.D_PAG_NUM}">다음</a>
		</c:if>
	</div>

	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="card-header">
						<br />
						<h4 class="card-title">삭제글 목록</h4>
					</div>
					<div class="card-body">
						<div class="table2-responsive">
							<table class="table">
								<thead class=" text2-primary">
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
												<td><a href="/net/board/restore.do?BOARD_NO=${row.BOARD_NO }" class="btn" id="restore">복구하기</a></td>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div align="center">
		<c:if test="${dmap.startpag>1}">
			<a href="../board/adminList.do?R_PAG_NUM=${param.R_PAG_NUM}&D_PAG_NUM=${dmap.startpag-2}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${dmap.startpag }" end="${dmap.endpage }">
			<a href="../board/adminList.do?R_PAG_NUM=${param.R_PAG_NUM}&D_PAG_NUM=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${dmap.endpage<dmap.maxpag}">
			<a href="../board/adminList.do?R_PAG_NUM=${param.R_PAG_NUM}&D_PAG_NUM=${dmap.startpag+2}">다음</a>
		</c:if>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>