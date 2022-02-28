<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
 <!-- Page content-->
                <div class="container-fluid">
                    <form id="frm" name="frm">
						<div align="center">
							<a>Email : </a>
							<input type="text" name="EMAIL" id="EMAIL" class="focused-email" size="30"><br/>
							<br/>
							<a href="#this" class="btn btn-primary" id="Login">��й�ȣã��</a>
						</div>						
					</form>
                </div>
    <!-- ��޿��� -->
    <div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <!-- <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">��� Ÿ��Ʋ</h4>
	      </div> -->
	      <div class="modal-body">
	        �ӽ� ��й�ȣ : ${authKey }<br/>
	        �α��� �Ͻðڽ��ϱ�?
	      </div>
	      <div class="modal-footer">
			<button type="button" class="btn btn-primary" id="confirmModalBtn">Ȯ��</button>
	        <button type="button" class="btn btn-default" id="closeModalBtn">���</button>
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
		$("#Login").bind("click", function(e){
			e.preventDefault();
			let EMAIL = $("#EMAIL").val();
			$.ajax({
				 url : "<c:url value='/main/findPassword.do?EMAIL=" + EMAIL + "'/>",
				 type : "post",
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 error : function(){
					 alert("�Է��Ͻ� �̸��Ϸ� ���� ������ ���½��ϴ�.");
					 return false;
				 }
			 })
		});
		
		$('#confirmModalBtn').on('click', function(){
		  $('#modalBox').modal('hide');
		  window.location.href="/net/main/Login.do";
		});
		$('#closeModalBtn').on('click', function(){
		  $('#modalBox').modal('hide');
		});

	
	});
	</script>
</body>
</html>