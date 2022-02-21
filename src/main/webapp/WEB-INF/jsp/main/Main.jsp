<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
                <c:out value="${user.EMAIL}"/>
				<c:out value="${user.PASSWORD}"/>
				<c:out value="${user.NICK_NAME}"/>
				<c:out value="${user.USER_NO}"/>
				<br/>
				<img src="${user.PROFILE}" class="img-fluid rounded-circle" height="100" width="100"/>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>