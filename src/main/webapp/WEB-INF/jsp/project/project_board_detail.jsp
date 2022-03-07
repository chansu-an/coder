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

								<!-- Page content-->
								<h2>프로젝트 상세보기</h2>
								<table class=project_board_list>

									<div class="card-body">
										<div class="table2-responsive">
											<table class="table">
												<colgroup>
													<col width="12%" />
													<col width="*%" />
													<col width="15%" />
													<col width="20%" />
													<col width="20%" />
													<col width="10%" />
													<col width="10%" />
												</colgroup>
												<thead class="text2-primary">


													<tr>
														<th scope="col">프로젝트 번호</th>
														<th scope="col">프로젝트 제목</th>
														<th scope="col">작성자</th>
														<th scope="col">내용</th>
														<th scope="col">시작일</th>
														<th scope="col">종료일</th>
														<th scope="col">인원수</th>
													</tr>

												</thead>
												<tbody>
													<c:choose>
														<c:when test="${!empty map}">
															<tr>
																<td>${map.PROJECT_NO}</td>
																<td><a
																	href="../Team/List.do?PROJECT_NO=${map.PROJECT_NO}">${map.PROJECT_NAME}</a></td>
																<td>${map.NICK_NAME}</td>
																<td>${map.PROJECT_CONTEXT}</td>
																<td>${map.PROJECT_START}</td>
																<td>${map.PROJECT_END}</td>
																<td>${map.PROJECT_MEMBER}</td>
															</tr>
															<tr>


																<th scope="row">첨부파일</th>

																<td colspan="10"><c:forEach var="row"
																		items="${list }">

																		<p>

																			<input type="hidden" id="PBF_NO"
																				value="${row.PBF_NO }">
																			<svg xmlns="http://www.w3.org/2000/svg" width="16"
																				height="16" fill="currentColor"
																				class="bi bi-cloud-download" viewBox="0 0 16 16">
  																					<path
																					d="M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z" />
 																					 <path
																					d="M7.646 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V5.5a.5.5 0 0 0-1 0v8.793l-2.146-2.147a.5.5 0 0 0-.708.708l3 3z" />
																																								</svg>
																			<a
																			
																				href="../common/downloadProjectFile.do?PBF_NO=${row.PBF_NO }">${row.PBF_NO },${row.PBO_NAME}</a>
																			(${row.PBF_SIZE }kb)

																		</p>
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
											<c:if test="${map.USER_NO == session.USER_NO }">
											<a href="../Project/Modify.do?PROJECT_NO=${map.PROJECT_NO}"
												class="btn" id="write"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tools" viewBox="0 0 16 16">
  <path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z"/>
</svg> 수정하기</a>
</c:if> 
											<a href="../Project/Project.do" class="btn" id="list"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-fill" viewBox="0 0 16 16">
  <path d="M5.921 11.9 1.353 8.62a.719.719 0 0 1 0-1.238L5.921 4.1A.716.716 0 0 1 7 4.719V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
</svg> 목록으로</a>
											<c:if test="${map.USER_NO == session.USER_NO }">
											<a href="../Project/Delete.do?PROJECT_NO=${map.PROJECT_NO}"
												class="btn" id="delete"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg> 삭제하기</a>
</c:if>
											<c:if test="${empty end }">
											<a href="#" onclick="check_Project();"
												class="btn" id="list"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083l6-15Zm-1.833 1.89.471-1.178-1.178.471L5.93 9.363l.338.215a.5.5 0 0 1 .154.154l.215.338 7.494-7.494Z"/>
</svg> 참가신청</a>
</c:if>
										</div>
									</div>
								</table>
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
		
		function check_Project(){
			if(${checkProject == 0}){
				window.location.href = "../Project/Appjoin.do?PROJECT_NO=${map.PROJECT_NO}&USER_NO=${sessionScope.session.USER_NO}";
			}else{
				alert("참가신청 하셨습니다.");
			}
		}
	</script>
</body>
</html>