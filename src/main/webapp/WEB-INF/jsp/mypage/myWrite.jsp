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
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="card-header">
						<br />
						<h4 class="card-title">작성글</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<colgroup>
									<col width="*" />
									<col width="*" />
									<col width="*" />
									<col width="*" />
								</colgroup>
								<thead class=" text2-primary">
									<tr>
										<th scope="col">글제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">조회수</th>

									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(list) > 0}">
											<c:forEach items="${list }" var="row">
												<tr>
													<td><a
														href="../board/detail.do?BOARD_NO=${row.BOARD_NO}&IDENTI_TYPE=${row.IDENTI_TYPE}">${row.TITLE}</a></td>
													<td>${row.NICK_NAME}</td>
													<td>${row.BOARD_DATE}</td>
													<td>${row.READ_COUNT }</td>
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
		<c:if test="${map.startpag>1}">
			<a
				href="../Mypage/WriteList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag-2}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${map.startpag }" end="${map.endpage }">
			<a
				href="../Mypage/WriteList.do?USER_NO=${param.USER_NO}&PAG_NUM=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${smap.endpage<smap.maxpag}">
			<a
				href="../Mypage/WriteList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag+2}">다음</a>
		</c:if>
	</div>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>