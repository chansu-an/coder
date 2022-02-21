<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<script>
	<!-- get파라미터 제거후 새로고침 -->
	history.replaceState({}, null, location.pathname);
</script>
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
                <div class="container-fluid">
                    <form id="frm" name="frm">
						<div align="center">
							<a>아이디 : </a>
							<input type="text" name="EMAIL" id="EMAIL" class="focused-email" size="30"><br/>
							<a>비밀번호 : </a>
							<input type="password" name="PASSWORD" id="PASSWORD" class="focused-password" size="30">
							<br/>
							<a href="#this" class="btn btn-primary" id="Login">로그인</a>
						</div>
					</form>
						<a href="../main/RegisterForm.do">회원가입</a>
						<br/>
						<a href="../main/FindId.do">아이디 찾기</a>
						<br/>
						<a href="../main/FindPw.do">비밀번호 찾기</a>
						<br/>
						<a href="../main/UserList.do">회원 리스트</a>
						<br/>
						<a href="../main/StopUserList.do">신고회원 리스트</a>
						<br/>
						<a href="../main/DeleteUserList.do">탈퇴회원 리스트</a>
						<br/>
                </div>
            </div>
        </div>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
		if(!${checklogin}){
			alert("아이디와 비밀번호가 일치하지 않습니다.");
			$('.focused-email').focus();
		}
		
		$("#Login").on("click", function(e){ //로그인 버튼		
			e.preventDefault();
			var ID = $("#EMAIL").val();
			var PW = $("#PASSWORD").val();
			if(ID == "" || ID == null){
				alert("아이디 입력");
				$('.focused-email').focus();
				return false;
			}
			if(PW == "" || PW == null){
				alert("비밀번호 입력");
				$('.focused-password').focus();
				return false;
			}
			
			fn_Login();
		});
		
		
		function fn_Login(){		
			var comSubmit = new ComSubmit('frm');
			comSubmit.setUrl("<c:url value='/main/Login.do' />");
			comSubmit.submit();
		}
	
	});
</script>

</body>
</html>