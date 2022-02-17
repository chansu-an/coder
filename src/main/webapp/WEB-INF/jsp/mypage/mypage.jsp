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
<body>
	<div align="center">
		<h2>스크랩 리스트</h2>
		<table class="board_list">
			<colgroup>
				<col width="10%" />
				<col width="*%" />
				<col width="15%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(slist) >0}">
						<c:forEach items="${slist }" var="row">
							<tr>
								<td><a href="#">${row.TITLE }</a></td>
								<td>새로운 댓글이 달렸습니다</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4"></td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
		<h2>팔로우 리스트</h2>
		<table class="board_list">
			<colgroup>
				<col width="10%" />
				<col width="*%" />
				<col width="15%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(flist) >0}">
						<c:forEach items="${flist }" var="row">
							<tr>
								<td><a href="../main/Mypage.do?USER_NO=${row.FOLLOWER}">${row.NICK_NAME}</a></td>
							</tr>
						</c:forEach>

					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">팔로우한 유저가 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div align="center">
			<c:if test="${smap.startpag>1}">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&PAG_NUM=${smap.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${smap.startpag }" end="${smap.endpage }">
				<a href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${smap.endpage<smap.maxpag}">
				<a
					href="../Mypage/MypageDetail.do?USER_NO=${param.USER_NO}&PAG_NUM=${smap.startpag+2}">다음</a>
			</c:if>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>