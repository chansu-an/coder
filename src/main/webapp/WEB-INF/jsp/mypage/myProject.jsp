<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0128)file:///C:/Users/garde/OneDrive/%EB%B0%94%ED%83%95%20%ED%99%94%EB%A9%B4/%EC%93%B8%EB%A7%8C%ED%95%9C%EA%B1%B0/checkout/index.html -->
<html lang="ko">
<head>
<title>참가프로젝트</title>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-mypageheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

</head>
		<!-- Page content wrapper-->
	<body >
	 <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-plain">
              <div class="card-header">
              	<br/>
                <h4 class="card-title">참가 프로젝트</h4>
              </div>
              <div class="card-body">
                <div class="table2-responsive">
                  <table class="table">
                  <colgroup>
						<col width="15%" />
						<col width="25%" />
						<col width="30%" />
						<col width="30%" />
				  </colgroup>
                    <thead class=" text2-primary">                      
						<tr>
							<th scope="col">번호</th>
							<th scope="col">프로젝트이름</th>
							<th scope="col">시작일</th>
							<th scope="col">종료일</th>
							
						</tr>
                    </thead>
                    <tbody>
                      <c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">
										<tr>
											<td>${row.PROJECT_NO}</td>
  											<td><a href="../Team/List.do?PROJECT_NO=${row.PROJECT_NO }">${row.PROJECT_NAME}</a></td>
											<td>${row.PROJECT_START}</td>
											<td>${row.PROJECT_END}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
					  </c:choose>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
		<div align="center">
			<c:if test="${map.startpag>1}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag-2}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${map.startpag }" end="${map.endpage }">
				<a href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&PAG_NUM=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${smap.endpage<smap.maxpag}">
				<a
					href="../Mypage/ProjectList.do?USER_NO=${param.USER_NO}&PAG_NUM=${map.startpag+2}">다음</a>
			</c:if>
		</div>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>