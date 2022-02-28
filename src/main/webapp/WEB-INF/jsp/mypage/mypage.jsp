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
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body class="background-color:">
	<div align="center">
		<div class="card">
			<div class="card-header">
				<h2>스크랩 리스트</h2>
			</div>
			<div class="card-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">글제목</th>
						</tr>
					</thead>

					<c:forEach items="${slist }" var="row">
						<tbody>
							<tr>
								<td><a
									href="../board/detail.do?BOARD_NO=${rows.BOARD_NO}&IDENTI_TYPE="${row.IDENTI_TYPE}">${row.TITLE }</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
		<div align="center">
			<c:if test="${smap.startpag>1}">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${smap.startpag-2}&F_PAG_NUM=${param.F_PAG_NUM}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${smap.startpag }" end="${smap.endpage }">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${i}&F_PAG_NUM=${param.F_PAG_NUM}">[${i}]</a>
			</c:forEach>
			<c:if test="${smap.endpage<smap.maxpag}">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&S_PAG_NUM=${smap.startpag+2}&F_PAG_NUM=${param.F_PAG_NUM}">다음</a>
			</c:if>
		</div>
		<div class="card">
			<div class="card-header">
				<h2>팔로우 리스트</h2>
			</div>
			<div class="card-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">유저이름</th>
						</tr>
					</thead>
					<c:forEach items="${flist}" var="row">
						<tbody>
							<tr>
								<th><a href="../main/Mypage.do?USER_NO=${row.FOLLOWER}">${row.NICK_NAME}</a></th>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>

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