<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script>
	function confirmLogOut(){
		var result = confirm("로그아웃 하시겠습니다?");
		
		if(result){
			window.location.href="/net/main/logout.do";
		}else{
			return false;
		}
	}
</script>
</head>
<body>
<div class="d-flex" id="wrapper">
            <!-- Sidebar-->            
			<c:choose>
				<c:when test="${sessionScope.session.ADMIN == 'Y'}">
	            	<div class="border-end bg-white" id="sidebar-wrapper">
		                <div class="sidebar-heading border-bottom bg-light">Coders</div>
		                <div class="list-group list-group-flush">
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/net/board/openBoardList.do">공지사항</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">QnA 게시판</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">자유게시판</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">프로젝트</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">건의사항</a>		                    
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">신고관리</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">회원관리</a>
		                </div>
            		</div>
	            </c:when>
	            <c:otherwise>
	            	<div class="border-end bg-white" id="sidebar-wrapper">
		                <div class="sidebar-heading border-bottom bg-light">Coders</div>
		                <div class="list-group list-group-flush">
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/net/board/openBoardList.do?IDENTI_TYPE=1">공지사항</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/net/board/openBoardList.do?IDENTI_TYPE=2">QnA 게시판</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/net/board/openBoardList.do?IDENTI_TYPE=3">자유게시판</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">프로젝트</a>
		                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/net/board/openBoardList.do?IDENTI_TYPE=4">건의사항</a>
		                </div>
            		</div>
	            </c:otherwise>
            </c:choose>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link"><c:out value="${session.NICK_NAME}"/>님 환영합니다</a></li>
                                <li class="nav-item"><a class="nav-link" href="javascript:confirmLogOut();">로그아웃</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
	<h2>최근 공지사항</h2>
	<table class="notice_list">
		<colgroup>
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list1) > 0}">
					<c:forEach items="${list1 }" var="row">
						<tr>
							<td><a href="/net/board/detail.do?IDENTI_TYPE=${row.IDENTI_TYPE}&BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a></td>
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
	
	<h2>QnA인기글</h2>
	<table class="QnA_list">
		<colgroup>
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">추천수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list2) > 0}">
					<c:forEach items="${list2 }" var="row">
						<tr>
							<td><a href="/net/board/detail.do?IDENTI_TYPE=${row.IDENTI_TYPE}&BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a></td>
							<td>${row.NICK_NAME }</td>
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
	
	<h2>자유게시판 인기글</h2>
	<table class="QnA_list">
		<colgroup>
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">추천수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list3) > 0}">
					<c:forEach items="${list3 }" var="row">
						<tr>
							<td><a href="/net/board/detail.do?IDENTI_TYPE=${row.IDENTI_TYPE}&BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a></td>
							<td>${row.NICK_NAME }</td>
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

	<br />
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>

</body>
</html>