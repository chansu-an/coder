<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header2.jspf"%>
<%@ include file="/WEB-INF/include/include-menuheader.jspf"%>
<%@ include file="/WEB-INF/include/include-navbar.jspf"%>
</head>


<body>
<table class="board_view">
									<colgroup>
										<col width="15%" />
										<col width="30%" />
										<col width="15%" />
										<col width="30%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">업무제목</th>
											<td>${map.PD_TITLE}</td>
											<th scope="col">작업일지 번호</th>
											<td>${map.PD_BOARD_NO}</td>
										</tr>
										<tr>
											<th scope="col">작성자</th>
											<td>${map.NICK_NAME}</td>
											<th scope="col">진행도 / 중요도</th>
											<td>${map.PD_ING} / ${map.PD_IMPORT}</td>										
										</tr>
										<tr>
											<th scope="col">시작일</th>
											<td>${map.PD_START}</td>
											<th scope="col">종료일</th>	
											<td>${map.PD_END}</td>
										</tr>
										<tr>
											<th scope="col">내용</th>
											<td>${map.PD_CONTEXT}</td>
										</tr>
												<tr>
													<th scope="row">첨부파일</th>
													<td colspan="3"><c:forEach var="row" items="${list }">
															<p>
																<input type="hidden" id="PF_NO" value="${row.PF_NO }">
																<a
																	href="../common/downloadTeamFile.do?PF_NO=${row.PF_NO }">${row.PF_NO },${row.POF_NAME}</a>
																(${row.PF_SIZE }kb)
															</p>
														</c:forEach>
													</td>
												</tr>
									</tbody>
								</table>
	

	<a href="../Team/Modify.do?PD_BOARD_NO=${map.PD_BOARD_NO}&PROJECT_NO=${param.PROJECT_NO}" class="btn"
		id="write">수정하기</a>
	<a href="../Team/List.do?PROJECT_NO=${param.PROJECT_NO }" class="btn" id="list"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 목록으로</a>
	<a
		href="../Team/Delete.do?PD_BOARD_NO=${map.PD_BOARD_NO}&PROJECT_NO=${param.PROJECT_NO}"
		class="btn" id="delete"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg> 삭제하기</a>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<%@ include file="/WEB-INF/include/include-menufooter.jspf"%>
</body>
</html>