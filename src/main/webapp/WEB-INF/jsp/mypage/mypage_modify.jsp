<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="kso">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="generator" content="Hugo 0.88.1">
<title>내정보 수정</title>


<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>

<body>
	<div class="main-panel" id="main-panel">
		<div class="panel-header panel-header-sm"></div>
		<div class="container">
			<div class="card">
				<div class="card-header">
					<h4 class="mb-3">내정보수정</h4>
				</div>
				<div class="card-body">
					<form method="post" onsubmit="return test()"
						class="needs-validation" enctype="multipart/form-data" novalidate>
						<div class="row g-3">
							<div class="col-md-6">
								<label for="address2" class="form-label">별명</label> <input
									type="text" class="form-control" name="NICK_NAME"
									id="NICK_NAME" placeholder="별명" required
									value="${map.NICK_NAME }">
								<div class="invalid-feedback">필수 입력사항입니다</div>
							</div>
							<div class="col-md-6">
								<label for="address2" class="form-label">프로필사진</label>
								 <br><input
									type="hidden" name="PROFILE" value="${map.PROFILE }">
								<img width="250" height="250" src="${map.PROFILE }"><br>
								<label class="btn" for ="input-file">
								업로드
								</label>
								<input type="file" id="input-file" name="FILE" style="display: none;">
							</div>


							<div class="col-12">
								<label for="email" class="form-label">이메일</label>
								<div>${map.EMAIL}</div>
							</div>
							<div class="col-md-6">
								<label for="address2" class="form-label">암호</label> <input
									type="password" class="form-control" name="PASSWORD"
									id="PASSWORD" placeholder="암호" required
									value="${map.PASSWORD }">
								<div class="invalid-feedback">필수 입력사항입니다</div>
							</div>
							<div class="col-md-6">
								<label for="address2" class="form-label">암호확인</label> <input
									type="password" class="form-control" name="PASSWORD2"
									id="PASSWORD2" placeholder="암호확인" required
									value="${map.PASSWORD }">
								<div class="invalid-feedback">필수 입력사항입니다</div>
							</div>

							<div align="center">
								<hr class="my-4">
								<button class=" btn btn-primary btn-lg" type="submit">정보
									변경</button>
								<input class="btn btn-primary btn-lg" type="button"
									onclick="location.href='../main/Mypage.do?USER_NO=${map.USER_NO}'"
									value="변경 취소">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
		function test() {
			var password = document.getElementById("PASSWORD").value;
			var password2 = document.getElementById("PASSWORD2").value;

			if (password != password2) {
				alert('암호와 암호확인이 일치해야 합니다');
				document.getElementById("PASSWORD").focus();
				return false;
			}
		}
	</script>
</body>
</html>