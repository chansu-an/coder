<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Coders</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">공지사항</a>
		            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">QnA 게시판</a>
		            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">자유게시판</a>
		            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">프로젝트</a>
		            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">건의사항</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
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
	<h2>게시판 상세보기</h2>
	<table class=project_board_list">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<caption>프로젝트 상세보기</caption>
		<thead>
			<tr>
				<th scope="col">프로젝트 번호</th>
				<th scope="col">프로젝트 제목</th>
				<th scope="col">작성자</th>
				<th scope="col">내용</th>
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
				<th scope="col">인원수</th>
			</tr>
			
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty map}">
					<tr>
						<td>${map.PROJECT_NO}</td>
 						<td>${map.PROJECT_NAME}</td>
						<td>${map.USER_NO}</td>
						<td>${map.PROJECT_CONTEXT}</td>
						<td>${map.PROJECT_START}</td>
						<td>${map.PROJECT_END}</td>
						<td>${map.PROJECT_MEMBER}</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="3">
						
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
	<a href="/net/Project/Modify.do?PROJECT_NO=${map.PROJECT_NO}" class="btn" id="write">수정하기</a>

	<br />
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script>
	
</script>

</body>
</html>