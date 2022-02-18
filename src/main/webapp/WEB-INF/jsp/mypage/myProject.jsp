<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<title>참가프로젝트</title>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
		<!-- Page content wrapper-->
	<body class="bg-light">
	<div class="d-flex" id="wrapper" align="center">
			<div class="db-example" align="center">
				<h4 class="mb-3">참가 프로젝트</h4>
				<hr class="my-4">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">프로젝트이름</th>
							<th scope="col">시작일</th>
							<th scope="col">종료일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="rows" items="${list}">
							<tr>
								<th scope="row">${rows.PROJECT_NO}</th>
								<td><a href="#">${rows.PROJECT_NAME}</a></td>
								<td>${rows.PROJECT_START}</td>
								<td>${rows.PROJECT_END}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div align="center">
			<c:if test="${map.startpag>1}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${map.startpag }" end="${map.endpage }">
				<a href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${smap.endpage<smap.maxpag}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag+2}">다음</a>
			</c:if>
		</div>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>