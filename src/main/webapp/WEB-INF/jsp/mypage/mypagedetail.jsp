<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<script type="text/javascript">
alert(location.pathname+location.search);
sch = location.search;
var params = new URLSearchParams(sch);
var page_num = params.get('PAG_NUM');
if(page_num!=null){
params.set('PAG_NUM','1');
alert(location.pathname+params);
}else{
	var page_num = 1;
	alert(location.pathname+location.search+'&PAG_NUM='+page_num);
}



	function modify() {
		location.href = "../Mypage/Modify.do"
	}
	function follow() {
		location.href = "../Mypage/insertFollow.do?"
	}
</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
</head>
			<div class="container">
				<main>
					<div class="row g-5">
						<div class="col-md-7 col-lg-8">
							<h4 class="mb-3">내정보</h4>
							<div class="col-12">
								<label for="email" class="form-label">프로필 사진</label>
								<div>
									<img src="../File/profile/profile.jpg" class="img-thumbnail">
								</div>
							</div>

							<div class="row g-3">
								<div class="col-12">
									<label for="username" class="form-label">별명</label>
									<div class="input-group has-validation">
										<div>${map.NICK_NAME}</div>
									</div>
								</div>
								<div class="col-md-6">
									<label for="email" class="form-label">이메일</label>
									<div>${ map.EMAIL }</div>
								</div>
								<div class="col-md-6">
									<label for="email" class="form-label">암호</label>
									<div>${ map.PASSWORD }</div>
								</div>


							</div>
							<div align="center">
							<hr class="my-4">
							<c:if test="${CHECK.equals('Y') }">
							<button onclick="modify()" class=" btn btn-primary btn-lg"
								type="button">내정보수정</button>
								</c:if>
								<c:if test="${CHECK.equals('N') }">
							<button onclick="location.href = '../Mypage/insertFollow.do?USER_NO=${USER_NO}'" class=" btn btn-primary btn-lg"
								type="button">팔로우하기</button>
								</c:if>
								</div>
						</div>
					</div>
				</main>

			</div>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>