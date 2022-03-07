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
<body>
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Coders Login</h5>
            <form class="form-signin" id="frm" name="frm">
              <div class="form-label-group">
                <input type="email" class="form-control focused-email" name="EMAIL" id="EMAIL" placeholder="name@example.com">
              </div><br/>

              <div class="form-label-group">
                <input type="password" class="form-control focused-password" name="PASSWORD" id="PASSWORD" placeholder="Password">
              </div>
              
              <hr/>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" id="Login">Sign in</button>
              <div id="naver_id_login" style="text-align:center"><a class="" href="${url}">
              <img width="100%" height="100%" src="${pageContext.request.contextPath}/img/btnG_naver.png"/></a></div>
              <hr class="my-4"/>
              Forgot your <a href="../main/FindPw.do">Password</a>
              <button type="button" class="btn btn-lg btn-primary btn-block text-uppercase" onclick="window.location.href='../main/RegisterForm.do'">Join</button>
            </form>
          </div>
        </div>
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