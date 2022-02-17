<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="kso"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="generator" content="Hugo 0.88.1">
    <title>내정보 수정</title>
    
    <script type="text/javascript">
    function  test(){
    	alert("12312");
    	var pas = getParameter("pas")
    	alert("dasdas");
    	if(${pas.equals("Y")}){
    		alert('암호와 암호확인이 일치해야 합니다')
    	}
    }
    </script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
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
    <link href="<c:url value='/resources/css/form-validation.css'/>" rel="stylesheet"/>
    
  </head>
  <body onload="test()" class="bg-light">
<div class="container">
  <main>
    <div class="row g-5">  
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">내정보수정</h4>
        <form method="post"  class="needs-validation" enctype="multipart/form-data" novalidate>
          <div class="row g-3">
            <div class="col-md-6">
                <label for="address2" class="form-label">별명</label>
              <input type="text" class="form-control" name="NICK_NAME" id="NICK_NAME" placeholder="별명" required value="${map.NICK_NAME }">
            <div class="invalid-feedback">필수 입력사항입니다</div>
              </div>
               <div class="col-md-6">
                <label for="address2" class="form-label">프로필사진</label>
               <input type="file" name="PROFILE" >
              </div>
             
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
            </div>
          <hr class="my-4">
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">Save this information for next time</label>
          </div>
          <div align="center">
          <hr class="my-4">
          <button class=" btn btn-primary btn-lg" type="submit">정보 변경</button>
          <input class="btn btn-primary btn-lg" type="button" onclick ="lacation.href='/main/Main'" value="변경 취소">
          </div>
        </form>
      </div>
    </div>
  
  </main> 
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>