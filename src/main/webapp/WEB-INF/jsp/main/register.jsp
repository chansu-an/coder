<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf" %>
</head>
  <body class="bg-light">
  <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Start Bootstrap</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Shortcuts</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Overview</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Events</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container">
  <main>
    <div class="row g-5">  
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">회원가입</h4>
        <form action="./RegisterInsert.do" method="post" class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="NICK_NAME" id="NICK_NAME" placeholder="이름" required>
              <div class="invalid-feedback">이름을 입력해주세요</div>
              </div>
            </div>
            <div class="col-12">
              <label for="email" class="form-label">이메일</label>
              <input type="email" class="form-control" name="EMAIL" id="EMAIL" placeholder="you@example.com" required>
              <div class="invalid-feedback">이메일을 작성해주세요</div>
            </div>
            <div class="col-12">
              <label for="password" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="PASSWORD" id="PASSWORD" required>
              <div class="invalid-feedback">비밀번호를 입력해주세요</div>
            </div>
           <!--<div class="col-md-6">
              <label for="address2" class="form-label">주소</label>
              <input type="text" class="form-control" id="address2" placeholder="주소" required>
            <div class="invalid-feedback">주소는 필수 입력사항입니다</div>
           </div>
            <div class="col-md-6">
              <label for="zip" class="form-label">상세주소<span class="text-muted">(선택)</span></label>
              <input type="text" class="form-control" id="zip" placeholder="상세주소">            
            </div>
          	<div class="col-md-6">
              <label for="zip" class="form-label">우편 번호</label>
              <input type="text" class="form-control" id="zip" placeholder="우편번호" required>
              <div class="invalid-feedback">우편 번호는 필수 입력사항입니다</div>
            </div>
            -->
          </div>
          <hr class="my-4">
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address" required>
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info" required>
            <label class="form-check-label" for="save-info">Save this information for next time</label>
          </div>
          <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="submit">회원가입 완료</button>
        </form>
      </div>
    </div>
  </main> 
</div>
            </div>
        </div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>