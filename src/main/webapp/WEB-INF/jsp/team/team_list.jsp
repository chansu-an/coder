<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
<link href='../css/main.css' rel='stylesheet' />
<script src='../js/main.js'></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar'); // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..}) 
		$(function() {

			var request = $.ajax({
				url : "../Team/Calendar.do?PROJECT_NO=${param.PROJECT_NO}",
				method : "GET",
				dataType : "json"
			});

			request.done(function(data) {
				console.log(data);

				var calendarEl = document.getElementById('calendar');

				var calendar = new FullCalendar.Calendar(calendarEl, {
					local : 'ko',
					initialView : 'dayGridMonth',
					headerToolbar : {
						left : 'prev,next today',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek,timeGridDay'
					},
					eventClick : function(info) { // 있는 일정 클릭시, 
						window.alert('Event: ' + info.event.title);
						
					},
					dayMaxEvents: true,
					events : data
				});

				calendar.render();
			});

			request.fail(function(jqXHR, textStatus) {
				alert("Request failed: " + textStatus);
			});
		});

		calendar.render();
	});
	
	function test1(f) {
		$('input[name=SEARCH_TYPE]').attr('value', f);
	}
</script>
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
							<h4 class="card-title">프로젝트 작업일지</h4>
								<c:if test="${!empty session.USER_NO }">
								
								</c:if>
								<div class="card-body">
									<div class="table2-responsive">
										<table class="table">

											<colgroup>
												<col width="15%" />
												<col width="*%" />
												<col width="10%" />
												<col width="10%" />
												<col width="20%" />
												<col width="20%" />
											</colgroup>
											<thead class="text2-primary">
												<tr>
													<th scope="col">작업일지 번호</th>
													<th scope="col">제목</th>
													<th scope="col">진행도</th>
													<th scope="col">담당자</th>
													<th scope="col">마감일</th>
													<th scope="col">중요도</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${fn:length(list) > 0}">
														<c:forEach items="${list }" var="row">
															<tr>
																<td>${row.ROWNUM}</td>
																<%-- <td>${row.PROJECT_NAME }</td> --%>
																<td><a
																	href="../Team/Detail.do?PROJECT_NO=${row.PROJECT_NO}&PD_BOARD_NO=${row.PD_BOARD_NO}">${row.PD_TITLE}</a>
																<td>${row.PD_ING }</td>
																<td>${row.NICK_NAME }</td>
																<td>${row.PD_END  }</td>
																<td>${row.PD_IMPORT }</td>
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
										<%-- <div align="center">
												<c:if test="${map.startpag>1}">
													<a href="../Project/Project.do?PAG_NUM=${map.startpag-2}">이전</a>
												</c:if>
												<c:forEach var="i" begin="${map.startpag }"
													end="${map.endpage }">
													<a href="../Project/Project.do?PAG_NUM=${i}">[${i}]</a>
												</c:forEach>
												<c:if test="${map.endpage<map.maxpag}">
													<a href="../Project/Project.do?PAG_NUM=${map.startpag+2}">다음</a>
												</c:if>
											</div> --%>
									</div>
									<a href="../Project/Project.do?PROJECT_NO=${param.PROJECT_NO }"class="btn" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 목록으로</a>

<a href="../Project/Applist.do?PROJECT_NO=${param.PROJECT_NO}" class = "btn">참가자 리스트</a>
									<a href="../Team/Write.do?PROJECT_NO=${param.PROJECT_NO }"
										class="btn" id="write"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg> 글쓰기</a></div>
								</div>
							</div>
						</div>
						<div class="card">
							<div style=" max-width: 1400px; margin: 60px" id='calendar'></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>