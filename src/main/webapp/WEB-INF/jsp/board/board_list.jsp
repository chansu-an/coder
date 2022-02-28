<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script>
	function test(f){		
		f.action="/net/board/openBoardList.do?IDENTI_TYPE=" + ${IDENTI_TYPE}
		f.submit();
	}

	function test1(f){
		$('input[name=SEARCH_TYPE]').attr('value',f);
	}

</script>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper ">
    
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
              	<c:choose>
			    	<c:when test="${IDENTI_TYPE eq '1' }">
						<h4 class="card-title">공지사항</h4>   	
			    	</c:when>
			    	<c:when test="${IDENTI_TYPE eq '2' }">
						<h4 class="card-title">QnA</h4>   	
			    	</c:when>
			    	<c:when test="${IDENTI_TYPE eq '3' }">
						<h4 class="card-title">자유게시판</h4>   	
			    	</c:when>
			    	<c:when test="${IDENTI_TYPE eq '4' }">
						<h4 class="card-title">건의사항</h4>   	
			    	</c:when>
			    </c:choose> 
			    	
                <!-- <h4 class="card-title"> Simple Table</h4> -->
                <form name="ORDER_TYPE" method="post">
					<p style="text-align:right;">
			 		<select id="ORDER_TYPE" name="ORDER_TYPE" onchange="test(this.form);">
						<option>-----</option>
						<option value="DATE"
							<c:if test="${order_type == 'DATE'}">selected</c:if>>최신순</option>
						<option value="REPLY"
							<c:if test="${order_type == 'REPLY'}">selected</c:if>>댓글순</option>
						<option value="READ"
							<c:if test="${order_type == 'READ'}">selected</c:if>>조회순</option>
						<option value="RECOMMEND"
							<c:if test="${order_type == 'RECOMMEND'}">selected</c:if>>추천순</option>
					</select>			
					<input type="hidden" name="ORDER_TYPE" value="${ORDER_TYPE }"/>
					<input type="hidden" name="KEYWORD" value="${keyWord }"/>
					<input type="hidden" name="SEARCH_TYPE" value="${searchType }"/>
					</p>
				</form>
				
				<c:if test="${!empty session.USER_NO }">
					<a href="/net/board/write.do" class="btn" id="write">글쓰기</a>	
				</c:if>
              </div>
              <div class="card-body">
                <div class="table2-responsive">
                  <table class="table">
					<c:choose>
						<%-- 공지사항, QnA, 자유 게시판 --%>
						<c:when test="${IDENTI_TYPE != '4'}">
							<colgroup>
								<col width="10%" />
								<col width="*%" />
								<col width="10%" />
								<col width="10%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead class="text2-primary">
								<tr>
									<th scope="col">글번호</th>
									<th scope="col" >제목</th>
									<th scope="col">조회수</th>
									<th scope="col">추천수</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list }" var="row">
											<tr>
												<td>${row.ROWNUM }</td>
												<td><a
													href="/net/board/detail.do?IDENTI_TYPE=${IDENTI_TYPE}&BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a>
													[${row.REPLY_COUNT}]</td>
												<td>${row.READ_COUNT }</td>
												<td>${row.RECOMMEND_COUNT }</td>
												<td>${row.NICK_NAME }</td>
												<td>${row.BOARD_DATE }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
						</c:when>
						<%-- 건의사항 --%>
						<c:otherwise>
							<colgroup>
								<col width="10%" />
								<col width="*%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead class="text2-primary">
								<tr>
									<th scope="col">글번호</th>
									<th scope="col">제목</th>
									<th scope="col">관리자답변</th>
									<th scope="col">조회수</th>
									<th scope="col">추천수</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list }" var="row">
											<tr>
												<td>${row.ROWNUM }</td>
												<td><a
													href="/net/board/detail.do?IDENTI_TYPE=${IDENTI_TYPE}&BOARD_NO=${row.BOARD_NO}">${row.TITLE }</a>
													[${row.REPLY_COUNT}]</td>
												<td>
													<c:choose>
													<%-- 관리자답변 있을 때 --%>
														<c:when test="${row.REPLY_COUNT !=0 }">
															답변완료
														</c:when>
													<%-- 관리자답변 없을 때 --%>
														<c:otherwise>
															답변대기
														</c:otherwise>
													</c:choose>	
												</td>
												<td>${row.READ_COUNT }</td>
												<td>${row.RECOMMEND_COUNT }</td>
												<td>${row.NICK_NAME }</td>
												<td>${row.BOARD_DATE }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
						</c:otherwise>
					</c:choose>
					</tbody>
					</table>
					<form action="/net/board/openBoardList.do" method="get">
						<div class="search-wrap">
							<select id="SEARCH_TYPE" name="SEARCH_TYPE" onchange="test1(this.value);">
								<option>검색</option>
								<option value="TITLE"
									<c:if test="${searchType == 'TITLE'}">selected</c:if>>제목</option>
								<option value="CONTEXT"
									<c:if test="${searchType == 'CONTEXT'}">selected</c:if>>내용</option>
								<option value="NICKNAME"
									<c:if test="${searchType == 'NICKNAME'}">selected</c:if>>작성자</option>
								<option value="T+C"
									<c:if test="${searchType == 'T+C'}">selected</c:if>>제목+내용</option>
							</select>
							<input type="hidden" id="IDENTI_TYPE" name="IDENTI_TYPE" value="${IDENTI_TYPE }"/>
							<input type="text" id="KEYWORD" name="KEYWORD" value="${keyWord }"></input>
							<input type="submit" value="검색" class="btn bin-info search-btn"/>		
						</div>
					</form>
					<div align="center">
							<c:if test="${map.startpag>1}">
								<a
									href="../board/openBoardList.do?IDENTI_TYPE=${param.IDENTI_TYPE}&PAG_NUM=${map.startpag-2}">이전</a>
							</c:if>
							<c:forEach var="i" begin="${map.startpag }" end="${map.endpage }">
								<a href="../board/openBoardList.do?IDENTI_TYPE=${param.IDENTI_TYPE}&PAG_NUM=${i}">[${i}]</a>
							</c:forEach>
							<c:if test="${map.endpage<map.maxpag}">
								<a
									href="../board/openBoardList.do?IDENTI_TYPE=${param.IDENTI_TYPE}&PAG_NUM=${map.startpag+2}">다음</a>
							</c:if>
					</div>
                </div>
              </div>
            </div>
          </div>        
        </div>
      </div>
      </div>
    </div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>

</body>
</html>