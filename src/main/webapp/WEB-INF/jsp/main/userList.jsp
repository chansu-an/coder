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
						<col width="20%"/> 
						<col width="40%"/>
						<col width="20%"/> 
						<col width="20%"/> 
					</colgroup> 
					<thead> 
						<tr> 
							<th scope="col">번호</th> 
							<th scope="col">닉네임</th> 
							<th scope="col">이메일</th>
							<th scope="col">탈퇴여부</th> 
							<th scope="col">신고복구</th> 
						</tr> 
					</thead> 
					<tbody>
						<c:choose> 
							<c:when test="${fn:length(list) > 0}"> 
							<c:forEach items="${list }" var="row"> 
								<tr> 
									<td>${row.ROWNUM}</td> 
									<td>${row.NICK_NAME}</td> 
									<td>${row.EMAIL}</td>
									<td>
										<c:choose>
											<c:when test="${row.DEL_GB == 'Y'}">
												<a href="/net/main/restoreUser.do?USER_NO=${row.USER_NO }" class="btn" id="restore">복구하기</a>
											</c:when>
											<c:otherwise>
												<input type='button' disabled='disabled' value='일반회원'/>
											</c:otherwise>
										</c:choose>
									</td> 
									<td>
										<c:choose>
											<c:when test="${row.USER_STOP == 'Y'}">
												<a href="/net/main/returnUserDisabled.do?USER_NO=${row.USER_NO }" class="btn" id="return">정지복구</a>
											</c:when>
											<c:otherwise>
												<input type='button' disabled='disabled' value='일반회원'/>
											</c:otherwise>
										</c:choose>
									</td> 
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
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>