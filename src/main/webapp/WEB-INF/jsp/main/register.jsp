<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
</head>
<body>
<div class="container">
  <main>
    <div class="row g-5">  
      <div class="col-md-7 col-lg-8 mx-auto">
      <div class="card card-signin my-5">
          <div class="card-body">
      	<br/>
        <h4 class="mb-3">회원가입</h4>
        <form id="regitsterform" method="post" class="needs-validation" onSubmit="registerForm()" novalidate>
        <input type="hidden" name="check_email" value=""/>
          <div class="row g-3">
            <div class="col-12">
              <label for="email" class="form-label">이메일</label>
              <div class="input-group has-validation">
                <input type="email" class="form-control focused-email" name="EMAIL" id="EMAIL" placeholder="you@example.com" required>
                &nbsp&nbsp&nbsp<a href="#this" id="openModalBtn" class="btn btn-primary">ID 중복체크</a>          
                &nbsp&nbsp&nbsp<a href="#this" id="checkEmail" class="btn btn-primary">EMAIL인증</a>          
              <div class="invalid-feedback">이메일을 입력해주세요</div>
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <input type="text" class="form-control" name="NICK_NAME" id="NICK_NAME" placeholder="이름" required>
              <div class="invalid-feedback">이름을 작성해주세요</div>
            </div>
            <div class="col-12">
              <label for="password" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="PASSWORD" id="PASSWORD" oninput="checkPW()" required>
              <div class="invalid-feedback">비밀번호를 입력해주세요</div>
            </div>
            <div class="col-12">
              <label for="password" class="form-label">비밀번호 확인&nbsp;<a id="checkPW2">(비밀번호가 일치하지않습니다.)</a></label>
              <input type="password" class="form-control" name="PASSWORD2" id="PASSWORD2" oninput="checkPW()" required>              
              <div class="invalid-feedback">비밀번호를 입력해주세요</div>
            </div>
           <!--<div class="col-md-6">
              <label for="address2" class="form-label">주소</label>
              <input type="text" class="form-control" id="address2" placeholder="주소" required>
            <div class="invalid-feedback">주소는 필수 입력사항입니다</div>
           </div>
            <div class="col-md-6">
              <label for="zip" class="form-label">상세주소<span class="text-muted">(선택)</span></label>
              <input type="text" class="form-control" id="zip" placeholder="상세주소">            
            </div>
          	<div class="col-md-6">
              <label for="zip" class="form-label">우편 번호</label>
              <input type="text" class="form-control" id="zip" placeholder="우편번호" required>
              <div class="invalid-feedback">우편 번호는 필수 입력사항입니다</div>
            </div>
            -->
          </div>
          <hr class="my-4">
          <input type="submit" class="w-100 btn btn-primary btn-lg" value="회원가입 완료"/>
          <!-- <button class="w-100 btn btn-primary btn-lg" id="register_button">회원가입 완료</button> -->
        </form>
      </div>
    </div>
    </div>
    </div>
  </main> 
</div>
<!-- 모달 영역 -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!-- <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">모달 타이틀</h4>
      </div> -->
      <div class="modal-body">
        이미 존재하는 아이디 입니다.
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-primary" id="confirmModalBtn">확인</button>
        <button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
      </div>
    </div>
  </div>
</div>
<div id="modalBox2" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!-- <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">모달 타이틀</h4>
      </div> -->
      <div class="modal-body">
        사용가능한 아이디 입니다.
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-primary" id="confirmModalBtn2">확인</button>
        <button type="button" class="btn btn-default" id="closeModalBtn2">취소</button>
      </div>
    </div>
  </div>
</div>
<div id="modalBox3" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!-- <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">모달 타이틀</h4>
      </div> -->
      <div class="modal-body">
        ID 중복체크 필수
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-primary" id="confirmModalBtn3">확인</button>
        <button type="button" class="btn btn-default" id="closeModalBtn3">취소</button>
      </div>
    </div>
  </div>
</div>
<div id="modalBox4" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">이메일 인증</h4>
      </div>
      <div class="modal-body">
        입력하신 메일로 인증 번호를 보냈습니다.<br/>
        인증번호 : <input type="text" id="emailchecknum">
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-primary" id="confirmModalBtn4">확인</button>
        <button type="button" class="btn btn-default" id="closeModalBtn4">취소</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	let checkPw = false;
	let checkEmailKey = false;
	let checkauthkey;//컨트롤러에서 가져온 인증메일번호
	let checkemailkey;//입력한 인증메일번호
	$(document).ready(function(){
	  $('#openModalBtn').on('click', function(){//ID중복체크 버튼
		  let emailVal = $("#EMAIL").val();
		  let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장
		  if(emailVal != null && emailVal != ""){
			  if (emailVal.match(regExp) != null) {
				 var userId = $("#EMAIL").val();//EMAIL에 입력되는 값				 
				 
				 $.ajax({
					 url : "<c:url value='/main/checkUserNickName.do'/>",
					 type : "post",
					 data : userId,
					 dataType : 'json',
					 contentType : "application/json; charset=UTF-8",
					 success : function(result){
						 if(result == 0){//사용가능한 아이디
							$('#modalBox2').modal('show');
							$("input[name=check_email]").val('Y');
						 }else{//중복된 아이디
							$('#modalBox').modal('show');
						 }
					 },
					 error : function(){
						 alert("서버요청실패");
					 }
				 })			  
			  }else{
				  alert('이메일 형식이 맞지않습니다.');
			  }			  
		  }else{
			  alert('이메일을 입력해주세요.');
			  $('#EMAIL').focus();
			  return false;
		  }
	  });
	  // 모달 안의 취소 버튼에 이벤트를 건다.
	  $('#closeModalBtn').on('click', function(){
	    $('#modalBox').modal('hide');
	  });
	  $('#confirmModalBtn').on('click', function(){
	    $('#modalBox').modal('hide');
	    $('.focused-email').focus();
	  });
	  $('#closeModalBtn2').on('click', function(){
	    $('#modalBox2').modal('hide');
	  });
	  $('#confirmModalBtn2').on('click', function(){
	    $('#modalBox2').modal('hide');
	  });
	  $('#closeModalBtn3').on('click', function(){
		 $('#modalBox3').modal('hide');
	  });
	  $('#confirmModalBtn3').on('click', function(){
		 $('#modalBox3').modal('hide');
	  });
	  $('#closeModalBtn4').on('click', function(){
		 $('#modalBox4').modal('hide');
	  });
	  $('#confirmModalBtn4').on('click', function(){
		 checkemailkey = $("#emailchecknum").val();
		 if(checkemailkey == checkauthkey){
			 $('#modalBox4').modal('hide');
			 checkEmailKey = true;
		 }else{
			 alert("일치하지않음");
		 }
	  });
	  
	  $('#checkEmail').on('click', function(){
		  let emailVal = $("#EMAIL").val();
		  let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장
		  if(emailVal != null && emailVal != ""){
			  if (emailVal.match(regExp) != null) {
				 if($("input[name=check_email]").val() == 'Y'){//중복체크했는지
					 var userId = $("#EMAIL").val();//EMAIL에 입력되는 값				 
					 
					 $.ajax({
						 url : "<c:url value='/main/checkEmail.do'/>",
						 type : "post",
						 data : userId,
						 dataType : 'json',
						 contentType : "application/json; charset=UTF-8",
						 success : function(result){
							 checkauthkey = result.checkauthkey;
							 $('#modalBox4').modal('show');
						 },
						 error : function(){
							 alert("서버요청실패");
						 }
					 })
				 }else{
					 $('#modalBox3').modal('show');
				 }
			  }else{
				  alert('이메일 형식이 맞지않습니다.');
			  }			  
		  }else{
			  alert('이메일을 입력해주세요.');
			  $('#EMAIL').focus();
			  return false;
		  }
	  });
	
	});
	
	function registerForm(){
		if($("#NICK_NAME").val() == "" || $("#PASSWORD").val() == "" || $("#PASSWORD2").val() == ""|| !checkEmailKey){			
			if(!checkEmailKey){
				alert("이메일 인증 필수");
				return false;
			}else{
				alert('입력한 정보 확인');	
				return false;
			}
		}else{
			alert("성공");
			alert($("input[name=check_email]").val());
			if($("input[name=check_email]").val() == 'Y'){
		  		var comSubmit = new ComSubmit('regitsterform');
				comSubmit.setUrl("<c:url value='/main/RegisterInsert.do'/>");
				comSubmit.submit();
				    
		  	}else{
		  		$('#modalBox3').modal('show');
		  		return false;
		  	}		
		}
	}
	
	function checkPW(){
		var pw1 = $("#PASSWORD").val();
		var pw2 = $("#PASSWORD2").val();
		
		if(pw1 == pw2 && pw1 != "" && pw2 != ""){
			$("#checkPW2").empty();
			$("#checkPW2").append("(비밀번호가 일치합니다.)");
			checkPw = true;
		}else{
			$("#checkPW2").empty();
			$("#checkPW2").append("(비밀번호가 일치하지않습니다.)");
			checkPw = false;
		}
	}
			
	</script>
</body>
</html>