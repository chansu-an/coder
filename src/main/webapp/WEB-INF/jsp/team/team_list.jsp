<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf" %>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
 <!-- 캘린더 -->
<!-- <link href='/resources/fullcalendar-5.10.2/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.10.2/lib/main.js'></script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

</script> -->
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- //fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
                <!-- Page content-->
	<h2>작업일지 게시판</h2>
	<div id='calendar'></div>
	<table class="team_list">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
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
							<td>${row.PD_BOARD_NO }</td>
							<%-- <td>${row.PROJECT_NAME }</td> --%>
							<td><a href="../Team/Detail.do?PROJECT_NO=${row.PROJECT_NO}&PD_BOARD_NO=${row.PD_BOARD_NO}">${row.PD_TITLE}</a>
							<td>${row.PD_ING }</td>
							<td>${row.USER_NO }</td>
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

<div id='calendar'></div>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko' // 한국어 설정
	});
	calendar.render();
});
</script>
		</tbody>
	</table>
	<a href="../Team/Write.do?PROJECT_NO=${param.PROJECT_NO}" class="btn" id="write">프로젝트 생성</a>
	<a href="../Project/Applist.do?PROJECT_NO=${param.PROJECT_NO}">참가자 리스트</a>
	<a href="../Project/Project.do" class="btn" id="list">게시판목록</a>
	<div id='calendar'></div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>


</body>
</html>