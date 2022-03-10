<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">	
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

</head>

<body>
	<div class="wrapper ">
		
<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
					
					
                <!-- Page content-->
	<h2>참가신청 리스트</h2>
	
	<table class="project_board_list">
	<div class="card-body">
	<div class="table2-responsive">
	<table class="table">
		<colgroup>
			<col width="*%" />
			<col width="30%" />
			<col width="30%" />
		</colgroup>
		<thead class="text2-primary">
		
			<tr>
				<th scope="col">닉네임</th>
				<th scope="col">수락여부</th>
				<th scope="col">이력서</th>
			</tr>
			</thead>
	
		<tbody>
		
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					
					<c:forEach items="${list}" var="row">
						<tr>
							<td>${row.NICK_NAME }</td>
							
							<c:if test="${sessionScope.session.USER_NO==map.USER_NO}">
							<td>
							<form action="../Project/ProjectApp.do">
							<input type="hidden" name="USER_NO" value="${row.USER_NO}">
							<input type="hidden" name="PROJECT_NO" value="${row.PROJECT_NO}">
							<input type="submit" class="btn" value="수락">
							</form>
							
							</td>
							<td>
							<form action = "../Resume/Detail.do">
							<input type="hidden" name="USER_NO" value="${row.USER_NO}">
							<input type="submit" class="btn" value="이력서 보기">
							</form>
							</td>
							</c:if>
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
				</div>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
<script type="text/javascript">
${document}.ready(function(){ //수락하기버튼
	${"#App"}.on("click", function(e){
		e.preventDefault();
		fn_ProjectApp();
	});
	
});;

function fn_ProjectApp(){
	alert(신청되었습니다!);
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/Project/ProjectApp.do' />");
	comSubmit.submit();
}
</script>

</body>
</html>