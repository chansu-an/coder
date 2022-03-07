<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
<body>
	<div class="main-panel" id="main-panel">
		<div class="panel-header panel-header-sm"></div>
		<div class="content" align="center">
			<div class="card">
				<div class="card-header" style="background-color: #A1A1A1">
					<h4 class="card-title" align="left">
						<span style="color: black">내정보</span>
					</h4>
				</div>
				<hr class="my-4">
				<div class="card-body" style="background-color: white" style="padding-bottom: 20px">
					<div class="col-12" align="left" >
						<label for="email" class="form-label"><span style="color: black">프로필 사진</span></label>
						<div>
							<c:if test="${sessionScope.session.PROFILE=='TEMP'}">
								<img src="../img/profile/temp/profile.jpg" width="40"
									height="10" class="img-thumbnail">
							</c:if>
							<c:if test="${sessionScope.session.PROFILE!='TEMP'}">
								<img src="${sessionScope.session.PROFILE}" width="40"
									height="10" class="img-thumbnail">
							</c:if>
						</div>
					</div>
					<div  align="left" >
						<div class="col-12" style="padding-bottom: 20px">
							<label for="username" class="form-label"><span style="color: black">별명</span></label>
							<div class="input-group has-validation">
								<div>${map.NICK_NAME}</div>
							</div>
						</div>
						<div class="col-md-6" style="padding-bottom: 20px">
							<label for="email" class="form-label" align="left"><span style="color: black">이메일</span></label>
							<div>${map.EMAIL}</div>
						</div>
					</div>


				</div>
				<div align="center">

					<c:if
						test="${sessionScope.session!=null&&param.USER_NO==sessionScope.session.USER_NO }">
						<button onclick="location.href='../Mypage/Modify.do'"
							class=" btn btn-primary btn-lg" type="button">내정보수정</button>
					</c:if>
					<c:if
						test="${sessionScope.session!=null&&param.USER_NO!=sessionScope.session.USER_NO}">
						<button
							onclick="location.href = '../Mypage/insertFollow.do?USER_NO=${param.USER_NO}'"
							class=" btn btn-primary btn-lg" type="button">팔로우하기</button>
						<button
							onclick="location.href = '../Mypage/RepostUser.do?USER_NO=${param.USER_NO}'"
							class=" btn btn-primary btn-lg" type="button">신고하기</button>
					</c:if>
				</div>

			</div>


		</div>

	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>