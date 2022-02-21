<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
                <table>
					<colgroup> 
						<col width="10%"/> 
						<col width="*"/> 
						<col width="15%"/> 
						<col width="20%"/>
						<col width="20%"/> 
					</colgroup> 
					<thead> 
						<tr> 
							<th scope="col">번호</th> 
							<th scope="col">닉네임</th> 
							<th scope="col">비밀번호</th> 
							<th scope="col">이메일</th>
							<th scope="col">프로필</th> 
						</tr> 
					</thead> 
					<tbody>
						<c:choose> 
							<c:when test="${fn:length(list) > 0}"> 
							<c:forEach items="${list }" var="row"> 
								<tr> 
									<td>${row.ROWNUM}</td> 
									<td>${row.NICK_NAME}</td> 
									<td>${row.PASSWORD}</td> 
									<td>${row.EMAIL}</td>
									<td>${row.PROFILE}</td> 
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
            <c:out value="${list.PROFILE}"/>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>