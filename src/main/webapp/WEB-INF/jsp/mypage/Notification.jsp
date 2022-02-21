<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
<body>
	<h2>게시판 알림</h2>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">번호</th>
						</tr>
					</thead>
						<c:forEach items="${list1}" var="row">
							<tbody>
								<tr>
									<td><a
										href="../Mypage/ArlistClick.do?BOARD_NO=${row.BOARD_NO}&IDENTI_TYPE="${row.IDENTI_TYPE}">${row.TITLE }</a></td>
									<td>새로운 댓글이 달렸습니다</td>
								</tr>
							</tbody>
						</c:forEach>
				</table>
	<div align="center">
		<c:if test="${bmap.startpag>1}">
			<a
				href="../Mypage/Notification.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${bmap.startpag-2}&P_PAG_NUM=${param.P_PAG_NUM}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${bmap.startpag }" end="${bmap.endpage }">
			<a
				href="../Mypage/Notification.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${i}&P_PAG_NUM=${param.P_PAG_NUM}">[${i}]</a>
		</c:forEach>
		<c:if test="${bmap.endpage<bmap.maxpag}">
			<a
				href="../Mypage/Notification.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${bmap.startpag+2}&P_PAG_NUM=${param.P_PAG_NUM}">다음</a>
		</c:if>
	</div>
	<h2>프로젝트 알림</h2>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">번호</th>
						</tr>
					</thead>
						<c:forEach items="${list2}" var="row">
							<tbody>
								<tr>
									<td><a
										href="../Mypage/ProjectArClick.do?PROJECT_NO=${row.PROJECT_NO}">${row.PROJECT_NAME}</a></td>
									<td>새로운 작업일지가 작성되었습니다</td>
								</tr>
							</tbody>
						</c:forEach>
				</table>
	<div align="center">
		<c:if test="${pmap.startpag>1}">
			<a
				href="../Mypage/Notification.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${param.B_PAG_NUM}&P_PAG_NUM=${pmap.startpag-2}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${pmap.startpag }" end="${pmap.endpage }">
			<a
				href="../Mypage/Notification.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${param.B_PAG_NUM}&P_PAG_NUM=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pmap.endpage<smap.maxpag}">
			<a
				href="../Mypage/Notification.do?USER_NO=${param.USER_NO}&B_PAG_NUM=${param.B_PAG_NUM}&P_PAG_NUM=${pmap.startpag+2}">다음</a>
		</c:if>
	</div>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>