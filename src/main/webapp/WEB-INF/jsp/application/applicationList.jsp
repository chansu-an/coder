<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">	
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
	<h2>프로젝트 게시판</h2>
	<table class="project_board_list">
		<colgroup>
			<col width="*%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">닉네임</th>
			</tr>
		</thead>
		<tbody>
		
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					
					<c:forEach items="${list}" var="row">
						<tr>
							<td>${row.NICK_NAME }</td>
							<c:if test="${sessionScope.session.USER_NO==map.USER_NO}">
							<form action="../Project/ProjectApp.do">
							<input type="hidden" name="USER_NO" value="${row.USER_NO}">
							<input type="hidden" name="PROJECT_NO" value="${row.PROJECT_NO}">
							<input type="submit" class="btn" value="수락">
							</form>
							<form action = "../Resume/Detail.do">
							<input type="hidden" name="USER_NO" value="${row.USER_NO}">
							<input type="submit" class="btn" value="이력서 보기">
							</form>
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
	<a href="../Project/Write.do" class="btn" id="write">프로젝트 생성</a>
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