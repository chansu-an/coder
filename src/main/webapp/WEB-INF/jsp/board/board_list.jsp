<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script>
	function test(f){
		f.action="/net/board/openBoardList.do?IDENTI_TYPE=" + ${IDENTI_TYPE}
		f.submit();
	}

	function test1(f){
		$('input[name=SEARCH_TYPE]').attr('value',f);
	}

</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
<body>
                <!-- Page content-->
	<c:choose>
    	<c:when test="${IDENTI_TYPE eq '1' }">
			<h2>공지사항</h2>   	
    	</c:when>
    	<c:when test="${IDENTI_TYPE eq '2' }">
			<h2>QnA</h2>   	
    	</c:when>
    	<c:when test="${IDENTI_TYPE eq '3' }">
			<h2>자유게시판</h2>   	
    	</c:when>
    	<c:when test="${IDENTI_TYPE eq '4' }">
			<h2>건의사항</h2>   	
    	</c:when>
    </c:choose> 
	<form name="ORDER_TYPE" method="post">
	<p style="text-align:right;">
		<select onchange="test(this.form);" id="ORDER_TYPE" name="ORDER_TYPE">
			<option>---</option>
			<option value="DATE">최신순</option>
			<option value="REPLY">댓글순</option>
			<option value="READ">조회수</option>
			<option value="RECOMMEND">추천순</option>
		</select>
		<input type="hidden" name="ORDER_TYPE" value="${ORDER_TYPE }"/>
	</p>
	</form>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="10%" />
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">추천수</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.ROWNUM }</td>
 							<td><a href="/net/board/detail.do?IDENTI_TYPE=${IDENTI_TYPE}&BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a> [${row.REPLY_COUNT}]</td>
							<td>${row.READ_COUNT }</td>
							<td>${row.RECOMMEND_COUNT }</td>
							<td>${row.NICK_NAME }</td>
							<td>${row.BOARD_DATE }</td>
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

	<form action="/net/board/openBoardList.do?IDENTI_TYPE=${IDENTI_TYPE}" method="post">
		<div class="search-wrap">
			<select name="form-control search-select" id="SEARCH_TYPE" name="SEARCH_TYPE" onchange="test1(this.value);">
				<option value="">검색</option>
				<option value="TITLE">제목</option>
				<option value="CONTEXT">내용</option>
				<option value="NICKNAME">작성자</option>
				<option value="T+C">제목+내용</option> 
			</select>
			<input type="hidden" id="SEARCH_TYPE" name="SEARCH_TYPE" value="${SEARCH_TYPE }"/>
			<input type="text" id="KEYWORD" name="KEYWORD" value="${KEYWORD }"></input>
			<input type="submit" value="검색" class="btn bin-info search-btn"/>		
		</div>
	</form>
	
	<p style="text-align:right;"><a href="/net/board/write.do" class="btn" id="write">글쓰기</a>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>