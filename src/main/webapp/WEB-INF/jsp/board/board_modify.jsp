<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form method="post">
        <h2>게시글 수정</h2>
			<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>			
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${map.BOARD_NO }</td>
					<th scope="row">조회수</th>
					<td>${map.READ_COUNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.WRITER }</td>
					<th scope="row">작성시간</th>
					<td>${map.BOARD_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map.TITLE }"/></td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="20" cols="100" title="내용" id="CONTEXT" name="CONTEXT">${map.CONTEXT }</textarea></td>
				</tr>
			</tbody>
			</table>
			<a href="./openBoardList.do?IDENTI_TYPE=${map.IDENTI_TYPE }" class="btn" id="list">목록으로</a>
			<input type="submit" value="수정하기"/>
		</form>
	</div>
</div>
	<br/>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>