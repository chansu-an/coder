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
<div class="main-panel" id="main-panel">
<div class="panel-header panel-header-sm"></div>
<div class="content">

    <div class="card">  
      <div class="card-header" >
        <h4 class="mb-3"><span style="color: black">${map.NAME}님의 이력서</span></h4>
        </div>
        <div class="card-body" style="padding-bottom: 20px">
            <div class="col-md-6" style="padding-bottom: 20px">
              <label for="NAME" class="form-label"><span style="color: black">이름</span></label>
              <div>
              ${map.NAME}
              </div>
              </div>
              <div class="col-md-6" style="padding-bottom: 20px">
              <label for="FILE" class="form-label"><span style="color: black">첨부파일</span></label>
              <form action="../Resume/Filedowload.do" method="post" id="Filedowload">
              <input type="hidden" value="${map.USER_NO}" name="USER_NO">
              <input type="hidden" value="${map.FILES}" name="FILES">
              <div>
              <button class="btn" onclick="document.getElementById('Filedowload').submit()">첨부파일다운로드</button>
              </div>
              </form>
              </div>
              <div class="col-md-6" style="padding-bottom: 20px">
                <label for="SKILL" class="form-label"><span style="color: black">자신있는기술</span></label>
                <div>
              ${map.SKILL}
              </div>
              </div>
            <div class="col-md-6" style="padding-bottom: 20px">
              <label for="TELL" class="form-label"><span style="color: black">전화번호</span></label>
              <div>
               ${map.TELL}
               </div>
            </div>
            <div class="col-md-6" style="padding-bottom: 20px">
              <label for="email" class="form-label"><span style="color: black">이메일</span></label>
			<div>
              ${map.EMAIL}
              </div>
              </div>
            <div class="col-md-6" style="padding-bottom: 20px">
              <label for="BLOG" class="form-label"><span style="color: black">포트폴리오</span></label>
              <div>
               <a href="${map.BLOG}">${map.BLOG}</a>
               </div>
            </div>
            <div class="col-md-6" style="padding-bottom: 20px">
              <label for="zipcode" class="form-label"><span style="color: black">우편번호</span></label>
              <div>
               ${map.ZIPCODE}
               </div>
            </div> 
           <div class="col-md-6" style="padding-bottom: 20px">
              <label for="address" class="form-label"><span style="color: black">주소</span></label>
              <div>
              ${map.ADDRESS}
              </div>
           </div>
             <div class="col-md-6" style="padding-bottom: 20px">
              <label for="address2" class="form-label"><span style="color: black">상세주소</span></label>
              <div>
             ${map.ADDRESS1}
             </div>
           </div>
           </div>
          <hr class="my-4">
          <div align="center">
          <c:if test="${map.USER_NO == sessionScope.session.USER_NO}">
          <button class=" btn btn-primary " onclick="location.href='../Resume/UpdateResume.do'" >수정</button>
          <button class=" btn btn-primary " onclick="deletere()" >삭제</button>
          </c:if>
          </div>
          </div>
          </div>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>