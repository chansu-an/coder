<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<script>
	<!-- get파라미터 제거후 새로고침 -->
	history.replaceState({}, null, location.pathname);
</script>
<body>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

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
						<a href="/net/main/RegisterForm.do">회원가입</a>
						<br/>
						<a href="/net/main/FindId.do">아이디 찾기</a>
						<br/>
						<a href="/net/main/FindPw.do">비밀번호 찾기</a>
						<br/>
						<a href="/net/main/UserList.do">회원 리스트</a>
						<br/>
						<a href="/net/main/StopUserList.do">신고회원 리스트</a>
						<br/>
						<a href="/net/main/DeleteUserList.do">탈퇴회원 리스트</a>
						<br/>
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
		
		$("#delete").on("click", function(e){ //삭제하기 버튼
			e.preventDefault();
			fn_deleteBoard();
		});
		
		$("#addFile").on("click", function(e){ //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});
		
		$("a[name^='delete']").on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
		
		function fn_Login(){		
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/main/Login.do' />");
			comSubmit.submit();
		}
	
	});
</script>
</body>
</html>