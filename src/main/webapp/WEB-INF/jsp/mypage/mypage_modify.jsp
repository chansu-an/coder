<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="kso"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="generator" content="Hugo 0.88.1">
    <title>내정보 수정</title>
    

<%@ include file="/WEB-INF/include/include-header2.jspf"%>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>   
    <!-- Custom styles for this template -->
    <link href="<c:url value='../css/form-validation.css'/>" rel="stylesheet"/>
    
  </head>
  <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<button class="btn btn-primary" id="sidebarToggle">메뉴</button>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
						
						<li class="nav-item active"><a class="nav-link" href="../board/mainList.do">메인으로</a></li>
						
						<li class="nav-item"><a class="nav-link" href="../Mypage/Notification.do?USER_NO=${sessionScope.session.USER_NO }&amp;B_PAG_NUM=1&amp;P_PAG_NUM=1">알림()</a></li>
							<c:if test="${sessionScope.session!=null}">
							<li class="nav-item">
									<img src="${sessionScope.session.PROFILE}" width="40" height="10" class="img-thumbnail">
								</li>
							<li class="nav-item"><a class="nav-link" href="../main/Mypage.do?USER_NO=${sessionScope.session.USER_NO }">테스트3213님 환영합니다.</a></li>
							
							<li class="nav-item">
							<a class="nav-link" href="../main/logout.do">로그아웃</a>								
							</li>
							</c:if>
							<c:if test="${sessionScope.session==null}">
							<a class="nav-link" href="../main/Login.do">로그인</a>	
							</c:if>
						</ul>
					</div>
				</div>
			</nav>
  <body onload="test()" class="bg-light">
<div class="container">
  <main>
    <div class="row g-5">  
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">내정보수정</h4>
        <form method="post" onsubmit="return test()" class="needs-validation" enctype="multipart/form-data" novalidate>
          <div class="row g-3">
            <div class="col-md-6">
                <label for="address2" class="form-label">별명</label>
              <input type="text" class="form-control" name="NICK_NAME" id="NICK_NAME" placeholder="별명" required value="${map.NICK_NAME }">
            <div class="invalid-feedback">필수 입력사항입니다</div>
              </div>
               <div class="col-md-6">
                <label for="address2" class="form-label">프로필사진</label>
                <input type="hidden" name="PROFILE" value="${map.PROFILE }">
                ${map.PROFILE }
               <input type="file" name="FILE"  >
              </div>
             
            
            <div class="col-12">
              <label for="email" class="form-label">이메일</label>
               <div >
               ${map.EMAIL}
              </div>
            </div>
           <div class="col-md-6">
              <label for="address2" class="form-label">암호</label>
              <input type="password" class="form-control"  name="PASSWORD" id="PASSWORD" placeholder="암호" required value="${map.PASSWORD }">
            <div class="invalid-feedback">필수 입력사항입니다</div>
           </div>
             <div class="col-md-6">
              <label for="address2" class="form-label">암호확인</label>
              <input type="password" class="form-control" name="PASSWORD2" id="PASSWORD2" placeholder="암호확인" required value="${map.PASSWORD }">
            <div class="invalid-feedback">필수 입력사항입니다</div>
           </div>
          
          <div align="center">
          <hr class="my-4">
          <button class=" btn btn-primary btn-lg" type="submit">정보 변경</button>
          <input class="btn btn-primary btn-lg" type="button" onclick ="location.href='../main/Mypage.do?USER_NO=${map.USER_NO}'" value="변경 취소">
          </div>
          </div>
        </form>
      </div>
      </div>
      </main> 
    </div>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>>
    <script type="text/javascript">
    function  test(){
    	var password = document.getElementById("PASSWORD").value;
    	var password2 = document.getElementById("PASSWORD2").value;
    	
    	if(password!=password2){
    		alert('암호와 암호확인이 일치해야 합니다');
    		document.getElementById("PASSWORD").focus();
    		return false;
    	}
    }
    </script>
</body>
</html>