<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function deletere() {
    if (confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
    	location.href="../Resume/DeleteResume.do"
    } else {
    }
}
</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<meta charset="UTF-8">
<title> ${map.NAME}님의 이력서</title>
</head>
<body>
<div class="container">
  <main>
    <div class="row g-5">  
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">이력서 작성</h4>
        <div>
          <div class="row g-3">
            <div class="col-md-6">
              <label for="NAME" class="form-label">이름</label>
              <div>
              ${map.NAME}
              </div>
              </div>
              <div class="col-md-6">
                <label for="SKILL" class="form-label">자신있는기술</label>
                <div>
              ${map.SKILL}
              </div>
              </div>
            <div class="col-md-6">
              <label for="TELL" class="form-label">전화번호</label>
              <div>
               ${map.TELL}
               </div>
            </div>
            <div class="col-md-6">
              <label for="email" class="form-label">이메일</label>
              <div>
              ${map.EMAIL}
              </div>
            </div>
            <div class="col-md-6">
              <label for="BLOG" class="form-label">포트폴리오</label>
              <div>
               ${map.BLOG}
               </div>
            </div>
            <div class="col-md-6">
              <label for="zipcode" class="form-label">우편번호</label>
              <div>
               ${map.ZIPCODE}
               </div>
            </div> 
           <div class="col-md-6">
              <label for="address" class="form-label">주소</label>
              <div>
              ${map.ADDRESS}
              </div>
           </div>
             <div class="col-md-6">
              <label for="address2" class="form-label">상세주소</label>
              <div>
             ${map.ADDRESS1}
             </div>
           </div>
           </div>
          <hr class="my-4">
          <div align="right">
          <hr class="my-4">
          <button class=" btn btn-primary btn-lg" onclick="location.href='../Resume/UpdateResume.do'" >수정</button>
          <button class=" btn btn-primary btn-lg" onclick="deletere()" >삭제</button>
          </div>
        </div>
      </div>
    </div>
  </main> 
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>