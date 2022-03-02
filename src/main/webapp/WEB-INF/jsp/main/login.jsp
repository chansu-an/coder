<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<script>
	<!-- get파라미터 제거후 새로고침 -->
	history.replaceState({}, null, location.pathname);
</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href="../css/signin.css" rel="stylesheet">
<body>
<main class="form-signin">
  <form id="frm" name="frm">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input type="email" class="form-control focused-email" name="EMAIL" id="EMAIL" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control focused-password" name="PASSWORD" id="PASSWORD" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>
    <a href="#this" class="btn btn-primary" id="Login">로그인</a>
	<a href="../main/RegisterForm.do" class="btn btn-primary">회원가입</a><br/>
	<a href="../main/FindPw.do">비밀번호 찾기</a>
	<div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="${pageContext.request.contextPath}/img/naver_Bn_Green.png"/></a></div>
  </form>
</main>
                <!-- Page content
                <div class="container-fluid">
                    <form id="frm" name="frm">
						<div align="center">
							<a>아이디 : </a>
							<input type="text" name="EMAIL" id="EMAIL" class="focused-email" size="30"><br/>
							<a>비밀번호 : </a>
							<input type="password" name="PASSWORD" id="PASSWORD" class="focused-password" size="30">
							<br/>
							<a href="#this" class="btn btn-primary" id="Login">로그인</a>
							<a href="../main/RegisterForm.do" class="btn btn-primary">회원가입</a>
							<br/>
							<a href="../main/FindPw.do">비밀번호 찾기</a>
						</div>
						<div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="${pageContext.request.contextPath}/img/naver_Bn_Green.png"/></a></div>
					</form>
                </div>-->


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