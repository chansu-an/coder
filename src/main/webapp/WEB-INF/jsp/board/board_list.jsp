<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>
<body>

	<div class="wrapper ">
		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<c:choose>
									<c:when test="${param.IDENTI_TYPE eq '1' }">
										<h4 class="card-title">공지사항</h4>
									</c:when>
									<c:when test="${param.IDENTI_TYPE eq '2' }">
										<h4 class="card-title">QnA</h4>
									</c:when>
									<c:when test="${param.IDENTI_TYPE eq '3' }">
										<h4 class="card-title">자유게시판</h4>
									</c:when>
									<c:when test="${param.IDENTI_TYPE eq '4' }">
										<h4 class="card-title">건의사항</h4>
									</c:when>
								</c:choose>

								
								<form name="ORDER_TYPE" method="get">
									<p style="text-align: right;">
										<select id="ORDER_TYPE" name="ORDER_TYPE" onchange="test(1);">
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
										<%-- <input type="hidden" name="IDENTI_TYPE"	value=${param.IDENTI_TYPE }> 
										<input type="hidden" name="KEYWORD" value="${param.KEYWORD }" /> 
										<input type="hidden" name="SEARCH_TYPE"	value="${param.SEARCH_TYPE }" /> --%>
									</p>
								</form>

								<c:choose>
									<c:when test="${param.IDENTI_TYPE eq '1' }">
										<c:if test="${sessionScope.session.ADMIN == 'Y' }">
											<a href="/net/board/write.do" class="btn" id="write"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"	fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg> 글쓰기</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if test="${!empty session.USER_NO }">
											<a href="/net/board/write.do" class="btn" id="write"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"	fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg> 글쓰기</a>
										</c:if>
									</c:otherwise>
								</c:choose>
							</div>

							<!-- 게시판 -->

							<div class="card-body">
								<div class="table2-responsive">
									<table class="table">
										<c:choose>
											<%-- 공지사항, QnA, 자유 게시판 --%>
											<c:when test="${param.IDENTI_TYPE != '4'}">
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
														<th scope="col">제목</th>
														<th scope="col">조회수</th>
														<th scope="col">추천수</th>
														<th scope="col">작성자</th>
														<th scope="col">작성일</th>
													</tr>
												</thead>
												<tbody id="test12">
												</tbody>
											</c:when>
											<%-- 건의사항 --%>
											<c:otherwise>
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
														<th scope="col">제목</th>
														<th scope="col">관리자답변</th>
														<th scope="col">조회수</th>
														<th scope="col">작성자</th>
														<th scope="col">작성일</th>
													</tr>
												</thead>
												<tbody id="test123">
												
												</tbody>
											</c:otherwise>
										</c:choose>
										</tbody>
									</table>
										<div class="search-wrap">
											<select id="SEARCH_TYPE" name="SEARCH_TYPE">
												<option value="TITLE"
													<c:if test="${searchType == 'TITLE'}">selected</c:if>>제목</option>
												<option value="CONTEXT"
													<c:if test="${searchType == 'CONTEXT'}">selected</c:if>>내용</option>
												<option value="NICKNAME"
													<c:if test="${searchType == 'NICKNAME'}">selected</c:if>>작성자</option>
												<option value="T+C"
													<c:if test="${searchType == 'T+C'}">selected</c:if>>제목+내용</option>
											</select>
											<input type="text" id="KEYWORD" name="KEYWORD" value="${keyWord }" onkeypress="if(event.keyCode == 13){test1();}"></input> 
											<input type="button" value="검색" class="btn bin-info search-btn" onclick="test(1);"/>
										</div>
								</div>
							</div>
								<!-- 페이징 -->
									<div style="padding-left: 50%; padding-right: 50%;">
										<nav>
											<ul class="pagination" id="pageclass2" >
												
											</ul>
										</nav>
									</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
	<script type="text/javascript">
	$(function(){
		test(1)
	});
	
		function test(f) {//ORDER_TYPE
			var IDENTI_TYPE = ${param.IDENTI_TYPE};
			var ORDER_TYPE = $("#ORDER_TYPE").val();
			var SEARCH_TYPE = $("#SEARCH_TYPE").val();
			var KEYWORD = $("#KEYWORD").val();
			var PAG_NUM = f;
		
			let dataList = {"IDENTI_TYPE" : IDENTI_TYPE, "ORDER_TYPE" : ORDER_TYPE, "SEARCH_TYPE" : SEARCH_TYPE, "KEYWORD" : KEYWORD};

			$.ajax({				 
				 url : "<c:url value='/board/openBoardList.do?PAG_NUM="+f+"'/>",
				 type : "post",
				 data : JSON.stringify(dataList),
				 dataType : 'json',
				 contentType : "application/json; charset=UTF-8",
				 success : function(result){
					 $("#test12").empty();
					 $("#test123").empty();
					 $("#pageclass2").empty();
					 var str = "";
					 var str2 = "";
					 if(result.list.length < 1){
						 str = "<tr>" + 
										"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
									"</tr>";
						 $("#test12").append(str);
					 }else{
						 $.each(result.list, function(key, value){
							 str += "<tr>"  
							 str +="<td>" + value.ROWNUM + "</td>" 
							 str +="<td>" 
							 str +="<a href='/net/board/detail.do?IDENTI_TYPE=${param.IDENTI_TYPE}&BOARD_NO=" + value.BOARD_NO + "' name='title'>" + value.TITLE + "</a>" 
							 str +="[" + value.REPLY_COUNT + "]" +"</td>"
											if(${param.IDENTI_TYPE == 4}){
												if(value.READ_COUNT!=0){
							str +="<td>답변완료</td>"}else{
								str +="<td>답변대기</td>"}
						 }
							 str +="<td>" + value.READ_COUNT + "</td>"  
							 str +="<td>" + value.RECOMMEND_COUNT + "</td>" 
							 str +="<td>" 
							 str +="<a href='../main/Mypage.do?USER_NO=" + value.USER_NO + "' name='title'>" + value.NICK_NAME + "</a>" 										
							 str +="</td>" 
							 str +="<td>" + value.BOARD_DATE + "</td>" 
							 str +="</tr>";
											if(IDENTI_TYPE=='4'){
												$("#test123").html(str);
											}else{
							$("#test12").html(str); }
						});
						if(result.map.startpag > 1){
							str2 = "<li><a onclick='test(" + (result.map.startpag-10) +")' aria-label='Previous'>"								
								 + "<span aria-hidden='true'>&laquo;</span></a></li>";
						}
						for(var i = result.map.startpag; i <= result.map.endpage; i++){
							str2 += "<li id=" + i + ">"
								 + "<a onclick='test(" + i + ")'>"
								 + i + "</a></li>";
						}
						if(result.map.endpage < result.map.maxpag){
							str2 = "<li><a ' onclick='test(" + (result.map.startpag+10) +")' aria-label='Next'>"
								 + "<span aria-hidden='true'>&laquo;</span></a></li>";
						}
								
						$("#pageclass2").html(str2);
					 }
				 },
				 error : function(){
					 alert("서버요청실패");
				 }
			 })
		}
		
	
		
		
	
		
		
	</script>
</body>
</html>