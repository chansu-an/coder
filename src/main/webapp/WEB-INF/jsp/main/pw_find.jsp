<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
 <!-- Page content-->
                <div class="container-fluid">
                    <form id="frm" name="frm">
						<div align="center">
							<label for="email" class="form-label">이메일 : </label>
							<input type="text" name="EMAIL" id="EMAIL" class="focused-email" placeholder="you@example.com" size="30">
							<br/>
							<a href="#" onclick="verifyEmail();" class="btn btn-primary" id="findPw">비밀번호찾기</a>
						</div>						
					</form>
                </div>
    <!-- 모달영역 -->
    <div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <!-- <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">모달 타이틀</h4>
	      </div> -->
	      <div class="modal-body">
	        임시 비밀번호 : ${authKey }<br/>
	        로그인 하시겠습니까?
	      </div>
	      <div class="modal-footer">
			<button type="button" class="btn btn-primary" id="confirmModalBtn">확인</button>
	        <button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	$(document).ready(function(){		
		if(${!empty authKey}){
			$('#modalBox').modal('show');
		}
		
		$('#confirmModalBtn').on('click', function(){
		  $('#modalBox').modal('hide');
		  window.location.href="/net/main/Login.do";
		});
		$('#closeModalBtn').on('click', function(){
		  $('#modalBox').modal('hide');
		});
		

	
	});
	
	function verifyEmail(){		
		let emailVal = $("#EMAIL").val(); 
		let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 검증에 사용할 정규식 변수 regExp에 저장 
		if (emailVal.match(regExp) != null) {
			let EMAIL = $("#EMAIL").val();
			$.ajax({
				 url : "<c:url value='/main/findPassword.do?EMAIL=" + EMAIL + "'/>",
				 type : "post",
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 error : function(){
					 alert("입력하신 이메일로 인증 메일을 보냈습니다.");
					 return false;
				 }
			 })
		}else {
			alert('이메일 형식이 맞지않습니다.'); 
		}

	}

	</script>
</body>
</html>