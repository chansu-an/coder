<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script>
	function confirmLogOut(){
		var result = confirm("로그아웃 하시겠습니까?");
		
		if(result){
			window.location.href="/net/main/logout.do";
		}else{
			return false;
		}
	}
</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
</head>     
<body>

      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card2 card-plain">
              <div class="card-header">
              	<br/>
                <h4 class="card-title">최근 공지사항</h4>
              </div>
              <div class="card2-body">
                <div class="table2-responsive">
                  <table class="table">
                  <colgroup>
						<col width="*%" />
						<col width="15%" />
						<col width="20%" />
						<col width="20%" />
				  </colgroup>
                    <thead class=" text2-primary">                      
						<tr>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">추천수</th>
						</tr>
                    </thead>
                    <tbody>
                      <c:choose>
								<c:when test="${fn:length(list1) > 0}">
									<c:forEach items="${list1 }" var="row">
										<tr>
											<td><a href="/net/board/detail.do?BOARD_NO=${row.BOARD_NO}&IDENTI_TYPE=${row.IDENTI_TYPE}">${row.TITLE }</a></td>
											<td>${row.NICK_NAME }</td>
											<td>${row.BOARD_DATE }</td>
											<td>${row.RECOMMEND_COUNT }</td>
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
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card2 card-plain">
              <div class="card-header">
              	<br/>
                <h4 class="card-title">QnA</h4>
              </div>
              <div class="card-body">
                <div class="table2-responsive">
                  <table class="table">
                  <colgroup>
						<col width="*%" />
						<col width="15%" />
						<col width="20%" />
						<col width="20%" />
				  </colgroup>
                    <thead class=" text2-primary">                      
						<tr>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">추천수</th>
						</tr>
                    </thead>
                    <tbody>
                      <c:choose>
								<c:when test="${fn:length(list2) > 0}">
									<c:forEach items="${list2 }" var="row">
										<tr>
											<td><a href="/net/board/detail.do?BOARD_NO=${row.BOARD_NO}&IDENTI_TYPE=${row.IDENTI_TYPE}">${row.TITLE }</a></td>
											<td>${row.NICK_NAME }</td>
											<td>${row.BOARD_DATE }</td>
											<td>${row.RECOMMEND_COUNT }</td>
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
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card2 card-plain">
              <div class="card-header">
              	<br/>
                <h4 class="card-title">자유게시판</h4>
              </div>
              <div class="card-body">
                <div class="table2-responsive">
                  <table class="table">
                  <colgroup>
						<col width="*%" />
						<col width="15%" />
						<col width="20%" />
						<col width="20%" />
				  </colgroup>
                    <thead class=" text2-primary">                      
						<tr>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">추천수</th>
						</tr>
                    </thead>
                    <tbody>
                      <c:choose>
								<c:when test="${fn:length(list3) > 0}">
									<c:forEach items="${list3 }" var="row">
										<tr>
											<td><a href="/net/board/detail.do?BOARD_NO=${row.BOARD_NO}&IDENTI_TYPE=${row.IDENTI_TYPE}">${row.TITLE }</a></td>
											<td>${row.NICK_NAME }</td>
											<td>${row.BOARD_DATE }</td>
											<td>${row.RECOMMEND_COUNT }</td>
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


	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	</script>


</body>
</html>