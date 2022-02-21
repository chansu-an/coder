<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function zipcode(){
    new daum.Postcode({
        oncomplete: function(data) {
        	var addr ='';
        	  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }
        	 document.getElementById('ZIPCODE').value = data.zonecode;
        	 document.getElementById("ADDRESS").value = addr;
        }
    }).open();};
</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<meta charset="UTF-8">
<title>이력서 작성</title>
</head>
<body>
<div class="container">
  <main>
    <div class="row g-5">  
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">이력서 작성</h4>
        <form method="post"  class="needs-validation" enctype="multipart/form-data" novalidate>
          <div class="row g-3">
            <div class="col-md-6">
              <label for="NAME" class="form-label">이름</label>
              <input type = "text" class="form-control" name="NAME" id="NAME" placeholder="이름">
              </div>
              <div class="col-md-6">
              <label for="NAME" class="form-label">첨부파일</label>
              <input type = "file" class="form-control" name="FILES" id="FILES" placeholder="이름">
              </div>
              <div class="col-md-6">
                <label for="SKILL" class="form-label">자신있는기술</label>
              <input type="text" class="form-control" name="SKILL" id="SKILL" placeholder="예:java,javascript...">
              </div>
            <div class="col-md-6">
              <label for="TELL" class="form-label">전화번호</label>
               <input type="tel" class="form-control" name="TELL" id="TELL" placeholder="전화번호">
            </div>
            <div class="col-md-6">
              <label for="email" class="form-label">이메일</label>
               <input type="email" class="form-control" name="EMAIL" id="EMAIL" placeholder="이메일">
            </div>
            <div class="col-md-6">
              <label for="BLOG" class="form-label">포트폴리오</label>
               <input type="url" class="form-control" name="BLOG" id="BLOG" placeholder="포트폴리오" >
            </div>
            <div class="col-md-6">
              <label for="zipcode" class="form-label">우편번호</label>
               <input type="text" class="form-control" name="ZIPCODE" id="ZIPCODE" placeholder="우편번호" readonly>
            </div> 
            <div class="col-md-6">
             <input type="button" value="우편번호검색" onclick="zipcode()">
            </div>
           <div class="col-md-6">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control"  name="ADDRESS" id="ADDRESS" placeholder="주소" readonly>
           </div>
             <div class="col-md-6">
              <label for="address2" class="form-label">상세주소</label>
              <input type="text" class="form-control" name="ADDRESS1" id="ADDRESS1" placeholder="상세주소" >
           </div>
            </div>
          <hr class="my-4">
          <div align="center">
          <hr class="my-4">
          <button class=" btn btn-primary btn-lg" type="submit">작성완료</button>
          </div>
          </form>
        </main>
      </div>
    </div>
  </main> 
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>