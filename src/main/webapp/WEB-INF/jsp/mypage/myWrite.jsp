<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<title>작성글</title>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
<body class="bg-light">
	<div class="d-flex" id="wrapper">
			<div class="db-example">
				<h4 class="mb-3">작성글</h4>
				<hr class="my-4">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">글제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="rows" items="${list}">
							<tr>
								<th scope="row">${rows.ROWNUM}</th>
								<td><a href="../board/detail.do?BOARD_NO=${rows.BOARD_NO}&IDENTI_TYPE=${rows.IDENTI_TYPE}">${rows.TITLE}</a></td>
								<td>${rows.NICK_NAME}</td>
								<td>${rows.BOARD_DATE}</td>
								<td>${rows.READ_COUNT }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div align="center">
			<c:if test="${map.startpag>1}">
				<a
					href="../Mypage/WriteList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${map.startpag }" end="${map.endpage }">
				<a href="../Mypage/WriteList.do?USER_NO=${param.USER_NO}&PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${smap.endpage<smap.maxpag}">
				<a
					href="../Mypage/WriteList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag+2}">다음</a>
			</c:if>
		</div>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>