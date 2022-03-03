<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내활동</title>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

</head>
<body class="background-color:">

	<div align="center">
		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-plain">
						<div class="card-header">
							<br />
							<h4 class="card-title">스크랩 리스트</h4>
						</div>
						<div class="card-body">
							<div class="table2-responsive">
								<table class="table">
									<colgroup>
										<col width="*%" />
										<col width="20%" />
										<col width="20%" />
									</colgroup>
									<thead class=" text2-primary">
										<tr>
											<th scope="col">제목</th>
											<th scope="col">작성일</th>
											<th scope="col">추천수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(slist) > 0}">
												<c:forEach items="${slist }" var="row">
													<tr>
														<td><a
															href="../board/detail.do?BOARD_NO=${row.BOARD_NO}&IDENTI_TYPE=${row.IDENTI_TYPE}">${row.TITLE }</a></td>
														<td>${row.BOARD_DATE }</td>
														<td>${row.RECOMMEND_COUNT }</td>
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
		<nav >
		<ul class="pagination" >
			<c:if test="${smap.startpag>1}">
				<li><a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${smap.startpag-2}&F_PAG_NUM=${param.F_PAG_NUM}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
					</li>
					
			</c:if>
			<c:forEach var="i" begin="${smap.startpag }" end="${smap.endpage }">
				<li><a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${i}&F_PAG_NUM=${param.F_PAG_NUM}">[${i}]</a></li>
			</c:forEach>
			<c:if test="${smap.endpage<smap.maxpag}">
				<li><a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${smap.startpag+2}&F_PAG_NUM=${param.F_PAG_NUM}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
			</li>
			</c:if>
			</ul>
		</nav>




		<div class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-plain">
						<div class="card-header">
							<br />
							<h4 class="card-title">팔로우 리스트</h4>
						</div>
						<div class="card-body">
							<div class="table2-responsive">
								<table class="table">
									<colgroup>
										<col width="*%" />
									</colgroup>
									<thead class=" text2-primary">
										<tr>
											<th scope="col">유저이름</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(flist) > 0}">
												<c:forEach items="${flist }" var="row">
													<tr>
														<td><a
															href="../main/Mypage.do?USER_NO=${row.FOLLOWER}">${row.NICK_NAME}</a></td>
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
		<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

		<div align="center">
			<c:if test="${fmap.startpag>1}">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${param.S_PAG_NUM}&F_PAG_NUM=${fmap.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${fmap.startpag }" end="${fmap.endpage }">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${param.S_PAG_NUM}&F_PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${fmap.endpage<fmap.maxpag}">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${param.S_PAG_NUM}&F_PAG_NUM=${fmap.startpag+2}">다음</a>
			</c:if>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>