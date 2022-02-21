<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
                <!-- Page content-->
                <div class="container-fluid">
                    <form  method="post">
						<div align="center">
							<a>아이디 : </a>
							<input type="text" name="EMAIL" id="EMAIL" size="30"><br/>
							<a>비밀번호 : </a>
							<input type="password" name="PASSWORD" id="PASSWORD" size="30">
							<br/>
							<input type="submit" value="로그인"/>
						</div>
					</form>
						<a href="/net/main/RegisterForm.do">회원가입</a>
						<br/>
						<a href="/net/main/FindId.do">아이디 찾기</a>
						<br/>
						<a href="/net/main/FindPw.do">비밀번호 찾기</a>
						<br/>
						<a href="/net/main/UserList.do">회원 리스트</a>
						<br/>
						<a href="/net/main/StopUserList.do">신고회원 리스트</a>
						<br/>
						<a href="/net/main/DeleteUserList.do">탈퇴회원 리스트</a>
						<br/>
                </div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>