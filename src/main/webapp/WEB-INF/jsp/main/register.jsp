<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
                <div class="container">
  <main>
    <div class="row g-5">  
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">회원가입</h4>
        <form action="./RegisterInsert.do" method="post" class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control focused-email" name="NICK_NAME" id="NICK_NAME" placeholder="이름" required>
                &nbsp&nbsp&nbsp<a href="#this" id="openModalBtn" class="btn btn-primary">ID 중복체크</a>
              <div class="invalid-feedback">이름을 입력해주세요</div>
              </div>
            </div>
            <div class="col-12">
              <label for="email" class="form-label">이메일</label>
              <input type="email" class="form-control" name="EMAIL" id="EMAIL" placeholder="you@example.com" required>
              <div class="invalid-feedback">이메일을 작성해주세요</div>
            </div>
            <div class="col-12">
              <label for="password" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="PASSWORD" id="PASSWORD" required>
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
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address" required>
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info" required>
            <label class="form-check-label" for="save-info">Save this information for next time</label>
          </div>
          <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="submit">회원가입 완료</button>
        </form>
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

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">	
	  $('#openModalBtn').on('click', function(){
			 var userId = $("#NICK_NAME").val();//NICK_NAME에 입력되는 값
			 $.ajax({
				 url : "<c:url value='/main/checkUserNickName.do'/>",
				 type : "post",
				 data : userId,
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 success : function(result){
					 if(result == 0){//사용가능한 아이디
						$('#modalBox2').modal('show');					 
					 }else{//중복된 아이디
						$('#modalBox').modal('show');
					 }
				 },
				 error : function(){
					 alert("서버요청실패");
				 }
			 })
	  });
	  /* 	  $('#openModalBtn').on('click', function(){
	  }); */
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
			
	</script>
</body>
</html>