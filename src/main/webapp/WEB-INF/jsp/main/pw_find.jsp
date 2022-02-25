<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
							<a href="#this" class="btn btn-primary" id="Login">비밀번호찾기</a>
						</div>						
					</form>
                </div>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#Login").bind("click", function(e){
			e.preventDefault();
			let EMAIL = $("#EMAIL").val();
			$.ajax({
				 url : "<c:url value='/main/findPassword.do?EMAIL=" + EMAIL + "'/>",
				 type : "post",
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 success : function(){
					 alert("TEST");
				 },
				 error : function(){
					 alert("");
				 }
			 })
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