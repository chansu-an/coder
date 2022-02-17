<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Start Bootstrap</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Shortcuts</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Overview</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Events</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
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
                <table>
					<colgroup> 
						<col width="10%"/> 
						<col width="*"/> 
						<col width="15%"/> 
						<col width="20%"/>
						<col width="20%"/> 
					</colgroup> 
					<thead> 
						<tr> 
							<th scope="col">번호</th> 
							<th scope="col">닉네임</th> 
							<th scope="col">비밀번호</th> 
							<th scope="col">이메일</th>
							<th scope="col">프로필</th> 
						</tr> 
					</thead> 
					<tbody>
						<c:choose> 
							<c:when test="${fn:length(list) > 0}"> 
							<c:forEach items="${list }" var="row"> 
								<tr> 
									<td>${row.ROWNUM}</td> 
									<td>${row.NICK_NAME}</td> 
									<td>${row.PASSWORD}</td> 
									<td>${row.EMAIL}</td>
									<td>${row.PROFILE}</td> 
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
            <c:out value="${list.PROFILE}"/>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>