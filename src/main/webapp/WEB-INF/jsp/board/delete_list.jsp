<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제글 목록</title>
</head>
<body>
<table class="delete_list">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="15%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">복구하기</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.ROWNUM }</td>
 							<td><a href="/net/board/detail.do?BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a></td>
							<td>${row.READ_COUNT }</td>
							<td>${row.NICK_NAME }</td>
							<td>${row.BOARD_DATE }</td>
							<td>복구하기</td> <!-- del_gb='n'으로 바꾸는 기능 추가해야 함 -->
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
</body>
</html>